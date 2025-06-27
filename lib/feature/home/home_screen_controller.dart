// lib/feature/home/home_screen_controller.dart

import 'dart:async';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/auth/auth_repository.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'home_screen_controller.freezed.dart';

@freezed
class HomeScreenUiState with _$HomeScreenUiState {
  const factory HomeScreenUiState({
    @Default(AsyncData([])) AsyncValue<List<WmsProduct>> products,
    @Default('') String appVersion,
    @Default(false) bool nextPageLoading,
  }) = _HomeScreenUiState;
}

class HomeScreenController extends StateNotifier<HomeScreenUiState> {
  HomeScreenController(
    this._authRepository,
    this._commonController,
    this._wmsApiRepository,
  ) : super(const HomeScreenUiState());

  final AuthRepository _authRepository;
  final CommonController _commonController;
  final WmsApiRepository _wmsApiRepository;

  static final provider = StateNotifierProvider.autoDispose<
      HomeScreenController, HomeScreenUiState>(
    (ref) {
      return HomeScreenController(
        ref.watch(AuthRepository.provider),
        ref.watch(CommonController.provider.notifier),
        ref.watch(WmsApiRepository.provider),
      );
    },
  );

  int _currentPage = 1;
  int? _lastPage; // Ini adalah variabel lokal, bukan bagian dari state

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> onScreenLoaded() async {
    await _getAppVersion();
    await loadProducts();
  }

  Future<void> _getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;
    final code = packageInfo.buildNumber;
    state = state.copyWith(appVersion: 'v$version.$code');
  }

  void onLogout() {
    _authRepository.clearSession();
  }

  Future<void> loadProducts() async {
    _currentPage = 1;
    _lastPage = null;
    state = state.copyWith(products: const AsyncValue.loading());

    final result = await AsyncValue.guard(
      () =>
          _wmsApiRepository.searchProduct(searchQuery: '', page: _currentPage),
    );

    if (mounted) {
      final AsyncValue<List<WmsProduct>> newProductState = result.when(
        data: (apiResponse) {
          // Menggunakan struktur paginasi yang baru
          _currentPage = apiResponse.pagination.currentPage;
          _lastPage = apiResponse.pagination.totalPages;
          return AsyncValue.data(apiResponse.data);
        },
        error: (e, s) => AsyncValue.error(e, s),
        loading: () => const AsyncValue.loading(),
      );
      state = state.copyWith(products: newProductState);
    }
  }

  // Pastikan Anda juga memiliki fungsi ini jika ada fitur "load more"
  Future<void> loadNextProducts() async {
    if (state.nextPageLoading || _currentPage >= (_lastPage ?? _currentPage)) {
      return;
    }

    state = state.copyWith(nextPageLoading: true);
    _currentPage++;

    final result = await AsyncValue.guard(
      () =>
          _wmsApiRepository.searchProduct(searchQuery: '', page: _currentPage),
    );

    if (mounted) {
      result.whenData((apiResponse) {
        _currentPage = apiResponse.pagination.currentPage;
        _lastPage = apiResponse.pagination.totalPages;
        state = state.copyWith(
          products: AsyncData([
            ...?state.products.value,
            ...apiResponse.data,
          ]),
        );
      });
      state = state.copyWith(nextPageLoading: false);
    }
  }

  // Future<ProductScanData?> identifyProduct({required File file}) async {
  //   _commonController.showLoading(isLoading: true);

  //   // Panggil langsung repository untuk mengirim file
  //   final result = await AsyncValue.guard(
  //     () => _wmsApiRepository.identifyProductFromFile(imageFile: file),
  //   );

  //   _commonController.showLoading(isLoading: false);

  //   if (!mounted) return null;

  //   if (result.hasError) {
  //     _commonController.handleCommonError(
  //         result.error ?? Exception('Unknown error'),
  //         () => identifyProduct(file: file));
  //     return null;
  //   }

  //   final response = result.asData?.value;
  //   if (response != null && response.success && response.data != null) {
  //     // imageUrl sekarang akan null karena backend tidak mengirimkannya lagi
  //     // Ini tidak masalah karena ProductDetailParams mengizinkan null
  //     return response.data;
  //   } else {
  //     _commonController.handleCommonError(
  //         Exception(response?.message ?? 'Gagal mengidentifikasi produk.'),
  //         null);
  //     return null;
  //   }
  // }

  Future<String?> identifyProduct({required File file}) async {
    _commonController.showLoading(isLoading: true);
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.identifyProductFromFile(imageFile: file),
    );
    _commonController.showLoading(isLoading: false);
    if (!mounted) return null;

    if (result.hasError) {
      _commonController.handleCommonError(result, null);
      return null;
    }

    final response = result.asData?.value;
    if (response != null && response.success && response.data != null) {
      // HANYA KEMBALIKAN NAMA PRODUK
      return response.data!.productName;
    } else {
      _commonController.handleCommonError(Exception(response?.message), null);
      return null;
    }
  }
}
