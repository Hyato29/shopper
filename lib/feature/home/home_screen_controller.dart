// lib/feature/home/home_screen_controller.dart

import 'dart:async';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/config/env_loader.dart';
import 'package:fskeleton/app/data/auth/auth_repository.dart';
import 'package:fskeleton/app/data/wms/model/wms_identify/identify_product_response.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/app/utils/aws_s3_upload/aws_s3_upload.dart';
import 'package:fskeleton/core.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart';

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
    if (state.nextPageLoading || _currentPage >= (_lastPage ?? _currentPage))
      return;

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

  Future<ProductScanData?> identifyProduct({required File file}) async {
    _commonController.showLoading(isLoading: true);

    final imageUrl = await AwsS3.uploadFile(
      accessKey: EnvLoader.get('AWS_ACCESS_KEY_ROOT'),
      secretKey: EnvLoader.get('AWS_SECRET_KEY_ROOT'),
      file: file,
      bucket: EnvLoader.get('AWS_BUCKET_NAME'),
      region: EnvLoader.get('AWS_REGION'),
      filename: basename(file.path),
    );

    if (imageUrl == null) {
      _commonController.showLoading(isLoading: false);
      _commonController.handleCommonError(
          Exception("Gagal mengunggah gambar"), null);
      return null;
    }

    final result = await AsyncValue.guard(
      () => _wmsApiRepository.identifyProduct(imageUrl: imageUrl),
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
