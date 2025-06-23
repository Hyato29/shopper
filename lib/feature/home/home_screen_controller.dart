import 'dart:async';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/auth/auth_repository.dart';
import 'package:fskeleton/app/data/my_headless_web_view.dart';
import 'package:fskeleton/app/data/my_search_preferences/saved_search.dart';
import 'package:fskeleton/app/data/serpapi/model/lens_response.dart';
import 'package:fskeleton/app/data/serpapi/model/shopping_response.dart';
import 'package:fskeleton/app/data/wms/model/wms_identify/identify_product_response.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/app/utils/event.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/home/suggestion_model.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'home_screen_controller.freezed.dart';

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

  Timer? _debounceTimer;
  MyHeadlessWebView? _headlessWebView;
  int _currentPage = 1;
  int? _lastPage;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _headlessWebView?.dispose();
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

  Future<ProductScanData?> processImage({required File file}) async {
    _commonController.showLoading(isLoading: true);

    final result = await AsyncValue.guard(
      () => _wmsApiRepository.identifyProduct(imageFile: file),
    );

    _commonController.showLoading(isLoading: false);

    if (!mounted) return null;

    if (result.hasError) {
      // Menangani error jika panggilan ke backend gagal
      _commonController.handleCommonError(result.error!, null);
      return null;
    }

    final response = result.asData?.value;
    if (response != null && response.success && response.data != null) {
      // Jika sukses, kembalikan data produk
      return response.data;
    } else {
      // Jika backend merespon tidak sukses
      _commonController.handleCommonError(
          Exception(response?.message ?? 'Gagal mengidentifikasi produk.'),
          null);
      return null;
    }
  }

  Future<void> loadProducts() async {
    _currentPage = 1;
    _lastPage = null;
    state = state.copyWith(products: const AsyncValue.loading());
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.searchProduct(
        searchQuery: state.searchKey,
        page: _currentPage,
      ),
    );
    _commonController.showLoading(isLoading: false);
    if (!mounted) return;
    return result.when(
      data: (data) {
        _lastPage = data.lastPage;
        state = state.copyWith(products: AsyncData(data.data));
      },
      error: (_, __) {
        _commonController.handleCommonError(result.error!, () {});
        state = state.copyWith(
          products: AsyncError(
            result.error!,
            StackTrace.current,
          ),
        );
      },
      loading: () {},
    );
  }

  Future<void> loadNextProducts() async {
    if (_currentPage == _lastPage) return;

    _currentPage += 1;
    state = state.copyWith(nextPageLoading: Event(true));
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.searchProduct(
        searchQuery: state.searchKey,
        page: _currentPage,
      ),
    );
    state = state.copyWith(nextPageLoading: Event(false));
    if (!mounted) return;
    return result.when(
      data: (data) {
        state = state.copyWith(
          products: AsyncValue.data([
            ...?state.products.value,
            ...data.data,
          ]),
        );
      },
      error: (_, __) {
        _currentPage -= 1;
      },
      loading: () {},
    );
  }

  void onChangeSearchKey(String searchKey) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      state = state.copyWith(searchKey: searchKey);
      loadProducts();
    });
  }

  void onRetrySeach() {
    loadProducts();
  }

  void onClearSavedResultSearch() {
    state = state.copyWith(
      savedResultSearch: null,
      lensKeyword: null,
    );
  }
}

@freezed
class HomeScreenUiState with _$HomeScreenUiState {
  const factory HomeScreenUiState({
    @Default(null) bool? isLoggedIn,
    @Default(AsyncValue.loading()) AsyncValue<LensResponse> lensReponse,
    @Default(AsyncValue.loading())
    AsyncValue<List<ShoppingResult>> shoppingResults,
    @Default(AsyncData([])) AsyncValue<List<SuggestionModel>> suggestions,
    @Default(AsyncData([])) AsyncValue<List<WmsProduct>> products,
    @Default(false) bool isError,
    @Default('') String searchKey,
    @Default(null) Event<bool>? nextPageLoading,
    @Default(null) Event? uploadFileException,
    @Default(null) Event? lastSearchDataException,
    @Default('') String appVersion,
    Event<String>? lensKeyword,
    Event<SavedSearch>? savedResultSearch,
    @Default(null) File? uploadedFile,
    @Default(null) String? uploadedFileUrl,
  }) = _HomeScreenUiState;
}
