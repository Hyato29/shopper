import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/auth/auth_repository.dart';
import 'package:fskeleton/app/data/serp/serp_api_repository.dart';
import 'package:fskeleton/app/data/wms/model/wms_identify/identify_product_response.dart';
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
    this._serpApiRepository,
  ) : super(const HomeScreenUiState());

  final AuthRepository _authRepository;
  final CommonController _commonController;
  final WmsApiRepository _wmsApiRepository;
  final SerpApiRepository _serpApiRepository;

  static final provider = StateNotifierProvider.autoDispose<
      HomeScreenController, HomeScreenUiState>(
    (ref) {
      return HomeScreenController(
        ref.watch(AuthRepository.provider),
        ref.watch(CommonController.provider.notifier),
        ref.watch(WmsApiRepository.provider),
        ref.watch(SerpApiRepository.provider),
      );
    },
  );

  int _currentPage = 1;
  int? _lastPage;

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
      result.when(
        data: (resource) {
          _currentPage = resource.currentPage;
          _lastPage = resource.lastPage;
          state = state.copyWith(products: AsyncData(resource.data));
        },
        error: (e, s) {
          state = state.copyWith(products: AsyncError(e, s));
          _commonController.handleCommonError(e, () => loadProducts());
        },
        loading: () {},
      );
    }
  }

  Future<void> loadNextProducts() async {
    if (state.nextPageLoading || _currentPage >= (_lastPage ?? _currentPage))
      return;

    state = state.copyWith(nextPageLoading: true);
    _currentPage++;

    final result = await AsyncValue.guard(
      () =>
          _wmsApiRepository.searchProduct(searchQuery: '', page: _currentPage),
    );

    if (mounted) {
      result.whenData((resource) {
        _currentPage = resource.currentPage;
        _lastPage = resource.lastPage;
        state = state.copyWith(
          products: AsyncData([
            ...?state.products.value,
            ...resource.data,
          ]),
        );
      });
      state = state.copyWith(nextPageLoading: false);
    }
  }

  Future<ProductScanData?> identifyProduct({required File file}) async {
    _commonController.showLoading(isLoading: true);

    final result = await AsyncValue.guard(
      () => _serpApiRepository.identifyProductFromFile(imageFile: file),
    );

    _commonController.showLoading(isLoading: false);

    if (!mounted) return null;

    if (result.hasError) {
      _commonController.handleCommonError(
          result.error ?? Exception('Unknown error'),
          () => identifyProduct(file: file));
      return null;
    }

    final response = result.asData?.value;
    if (response != null && response.success && response.data != null) {
      return response.data;
    } else {
      _commonController.handleCommonError(
          Exception(response?.message ?? 'Gagal mengidentifikasi produk.'),
          null);
      return null;
    }
  }
}
