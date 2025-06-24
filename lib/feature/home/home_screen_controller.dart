// lib/feature/home/home_screen_controller.dart

import 'dart:async';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/auth/auth_repository.dart';
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

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> onScreenLoaded() async {
    await _getAppVersion();
    // Langsung muat riwayat produk saat layar dibuka
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
    state = state.copyWith(products: const AsyncValue.loading());
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.searchProduct(searchQuery: ''),
    );

    if (mounted) {
      // Mengubah hasil dari AsyncValue<WmsGetProductResource> ke AsyncValue<List<WmsProduct>>
      final newProductState = result.when(
        data: (resource) => AsyncValue.data(resource.data), // Ambil .data dari resource
        error: (e, s) => AsyncValue.error(e, s),
        loading: () => const AsyncValue.loading(),
      );
      state = state.copyWith(products: newProductState);
    }
  }

  Future<ProductScanData?> identifyProduct({required File file}) async {
    _commonController.showLoading(isLoading: true);

    final result = await AsyncValue.guard(
      () => _wmsApiRepository.identifyProduct(imageFile: file),
    );

    _commonController.showLoading(isLoading: false);

    if (!mounted) return null;

    if (result.hasError) {
      _commonController.handleCommonError(
          result.error ?? Exception('Unknown error'),
          () => identifyProduct(file: file)); // Opsi untuk retry
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
