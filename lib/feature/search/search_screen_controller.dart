import 'dart:async';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/config/env_loader.dart';
import 'package:fskeleton/app/data/auth/auth_repository.dart';
import 'package:fskeleton/app/data/serpapi/model/lens_response.dart';
import 'package:fskeleton/app/data/serpapi/model/shopping_response.dart';
import 'package:fskeleton/app/data/serpapi/serp_api_repository.dart';
import 'package:fskeleton/app/data/wms/model/wms_product.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/app/utils/aws_s3_upload/aws_s3_upload.dart';
import 'package:fskeleton/app/utils/event.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/home/suggestion_model.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

part 'search_screen_controller.freezed.dart';

class SearchScreenController extends StateNotifier<HomeScreenUiState> {
  SearchScreenController(
    this._authRepository,
    this._serpApiRepository,
    this._commonController,
    this._wmsApiRepository,
  ) : super(const HomeScreenUiState());

  final AuthRepository _authRepository;
  final CommonController _commonController;
  final SerpApiRepository _serpApiRepository;
  final WmsApiRepository _wmsApiRepository;

  static final provider = StateNotifierProvider.autoDispose<
      SearchScreenController, HomeScreenUiState>(
    (ref) {
      return SearchScreenController(
        ref.watch(AuthRepository.provider),
        ref.watch(SerpApiRepository.provider),
        ref.watch(CommonController.provider.notifier),
        ref.watch(WmsApiRepository.provider),
      );
    },
  );

  Timer? _debounceTimer;

  int _currentPage = 1;
  int? _lastPage;
  String _currentSeachKey = '';

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  Future<void> onScreenLoaded() async {
    state = state.copyWith(products: const AsyncData([]));
  }

  void onLogout() {
    _authRepository.clearSession();
  }

  Future<void> uploadFile({
    required File file,
    required Function(String) onSuccess,
  }) async {
    _commonController.showLoading(isLoading: true);
    final filename = basename(file.path);
    final uploadedUrl = await AwsS3.uploadFile(
      accessKey: EnvLoader.get('AWS_ACCESS_KEY_ROOT'),
      secretKey: EnvLoader.get('AWS_SECRET_KEY_ROOT'),
      file: file,
      bucket: EnvLoader.get('AWS_BUCKET_NAME'),
      region: EnvLoader.get('AWS_REGION'),
      filename: filename,
      metadata: {
        "Content-Type": lookupMimeType(file.path) ?? '',
      },
      contentType: lookupMimeType(file.path) ?? '',
    );

    _commonController.showLoading(isLoading: false);
    if (uploadedUrl != null) {
      onSuccess(uploadedUrl);
    } else {
      state = state.copyWith(uploadFileException: Event(null));
      _commonController.showLoading(isLoading: false);
    }
  }

  Future<void> getLastSearchData() async {
    _commonController.showLoading(isLoading: true);
    final result = await AsyncValue.guard(
      () => _serpApiRepository.getSavedSearchData(),
    );
    if (!mounted) return;
    _commonController.showLoading(isLoading: false);
    if (result is AsyncData) {
      final resultData = result.valueOrNull;
      if (resultData == null) {
        state = state.copyWith(lastSearchDataException: Event(null));
        return;
      }
    }
  }

  void onChangeSearchKey(String searchKey) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (searchKey.length >= 3) {
        state = state.copyWith(searchKey: searchKey);
        _currentSeachKey = searchKey;
        // loadSuggestions();
        loadProducts();
      } else {
        state = state.copyWith(suggestions: const AsyncData([]));
      }
    });
  }

  void onRetrySeach() {
    onChangeSearchKey(state.searchKey);
  }

  Future<void> loadSuggestions() async {
    final suggestions = List<SuggestionModel>.generate(
      10,
      (e) => const SuggestionModel(code: 'AHC 1234', title: 'Kristin Watson'),
    );
    state = state.copyWith(suggestions: const AsyncValue.loading());
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(suggestions: AsyncData(suggestions));
  }

  void onSelectSuggestion(SuggestionModel model) {
    state = state.copyWith(
      suggestions: const AsyncData([]),
      searchKey: '',
    );

    loadProducts();
  }

  Future<void> loadProducts() async {
    _currentPage = 1;
    _lastPage = null;
    state = state.copyWith(products: const AsyncValue.loading());
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.searchProduct(
        searchQuery: _currentSeachKey,
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
    if (_currentSeachKey.isEmpty || _currentPage == _lastPage) return;

    _currentPage += 1;
    state = state.copyWith(nextPageLoading: Event(true));
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.searchProduct(
        searchQuery: _currentSeachKey,
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

  Future<void> onProductTapped(WmsProduct data) async {
    _commonController.showLoading(isLoading: true);

    final result = await AsyncValue.guard(
      () => _wmsApiRepository.addProduct(
        productName: data.productName,
        productPrice: data.productPrice,
      ),
    );
    _commonController.showLoading(isLoading: false);
    if (!mounted) return;

    return result.when(
      data: (_) {
        state = state.copyWith(addProductSuccess: Event(null));
      },
      error: (_, __) {
        _commonController.handleCommonError(result.error!, () {
          onProductTapped(data);
        });
      },
      loading: () {},
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
    @Default(null) Event? addProductSuccess,
  }) = _HomeScreenUiState;
}
