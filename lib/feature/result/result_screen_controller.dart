import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/auth/auth_repository.dart';
import 'package:fskeleton/app/data/my_search_preferences/saved_search.dart';
import 'package:fskeleton/app/data/serpapi/model/lens_response.dart';
import 'package:fskeleton/app/data/serpapi/model/shopping_response.dart';
import 'package:fskeleton/app/data/serpapi/serp_api_repository.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/app/utils/event.dart';
import 'package:fskeleton/core.dart';

part 'result_screen_controller.freezed.dart';

class ResultScreenController extends StateNotifier<ResultScreenUiState> {
  ResultScreenController(
    this._authRepository,
    this._serpApiRepository,
    this._commonController,
    this._wmsApiRepository,
  ) : super(const ResultScreenUiState());

  final AuthRepository _authRepository;
  final CommonController _commonController;
  final SerpApiRepository _serpApiRepository;
  final WmsApiRepository _wmsApiRepository;

  int _currentPage = 1;
  String _currentKeyword = '';

  static final provider = StateNotifierProvider.autoDispose<
      ResultScreenController, ResultScreenUiState>(
    (ref) {
      return ResultScreenController(
        ref.watch(AuthRepository.provider),
        ref.watch(SerpApiRepository.provider),
        ref.watch(CommonController.provider.notifier),
        ref.watch(WmsApiRepository.provider),
      );
    },
  );

  Future<void> onScreenLoaded({
    required String keyword,
    required String fileUrl,
    required String image,
    SavedSearch? savedSearched,
  }) async {
    if (fileUrl.isNotEmpty) {
      state = state.copyWith(
        keyword: keyword,
        fileUrl: fileUrl,
        image: image,
        savedSearch: savedSearched,
      );
      if (savedSearched == null) {
        await onSearchProduct();
      } else {
        state = state.copyWith(
          image: savedSearched.image,
          shoppingResults: AsyncData(savedSearched.data),
          savedSearch: savedSearched,
          currentKeyword: savedSearched.keyword,
        );
      }
    }
  }

  void onLogout() {
    _authRepository.clearSession();
  }

  Future<void> onSearchProduct() async {
    _commonController.showLoading(isLoading: true);
    _currentPage = 1;
    final keyword = state.keyword;
    state = state.copyWith(savedKeyword: keyword);
    final result = await AsyncValue.guard(
      () => _serpApiRepository.searchSerpDogGoogleShopping(keyword: keyword),
    );
    _commonController.showLoading(isLoading: false);
    if (!mounted) return;
    return result.when(
      data: (data) {
        state = state.copyWith(
          shoppingResults: AsyncValue.data(data.shoppingResults),
        );
        _currentKeyword = keyword;
        state = state.copyWith(currentKeyword: keyword);
        _currentPage = result.valueOrNull?.pagination?.current ?? 1;
      },
      error: (_, __) {
        state = state.copyWith(
          shoppingResults: AsyncError(Object(), StackTrace.current),
        );
        state = state.copyWith(isError: Event(null));
      },
      loading: () {},
    );
  }

  Future<void> requestNextPage() async {
    if (_currentKeyword.isEmpty || state.savedSearch != null) return;

    _currentPage += 1;
    state = state.copyWith(nextPageLoading: Event(true));
    final result = await AsyncValue.guard(
      () => _serpApiRepository.searchSerpDogGoogleShopping(
        keyword: _currentKeyword,
        start: (_currentPage == 1 ? 0 : 60) * _currentPage,
      ),
    );
    state = state.copyWith(nextPageLoading: Event(false));
    if (!mounted) return;
    return result.when(
      data: (data) {
        state = state.copyWith(
          shoppingResults: AsyncValue.data([
            ...?state.shoppingResults.value,
            ...data.shoppingResults,
          ]),
        );
      },
      error: (_, __) {
        _currentPage -= 1;
        state = state.copyWith(isError: Event(null));
      },
      loading: () {},
    );
  }

  void onChangedSavedKeyword(String value) {
    state = state.copyWith(savedKeyword: value);
  }

  Future<void> onSaveSearchResultSaveButtonPressed({
    required VoidCallback onSuccess,
  }) async {
    final shoppingResult = state.shoppingResults.valueOrNull;
    if (shoppingResult != null) {
      final isEnableSave =
          await _serpApiRepository.checkEnableKeywordSave(state.savedKeyword);
      if (isEnableSave) {
        await _serpApiRepository.saveLastSearchData(
          image: state.image,
          keyword: state.savedKeyword,
          data: shoppingResult,
        );
        onSuccess();
      } else {
        state = state.copyWith(isDuplicateSavedResult: Event(null));
      }
    }
  }

  void setSelectedItem(ShoppingResult item) {
    state = state.copyWith(selectedItem: item);
  }

  void removeSelectedItem() {
    state = state.copyWith(selectedItem: null);
  }

  Future<void> submitProduct(ShoppingResult item) async {
    _commonController.showLoading(isLoading: true);

    final result1 = item.price.substring(0, item.price.indexOf(','));
    final result2 = result1.replaceAll(RegExp('[^0-9]'),'');

    final result = await AsyncValue.guard(
      () => _wmsApiRepository.addProduct(
        productName: item.title,
        productPrice: result2,
      ),
    );
    _commonController.showLoading(isLoading: false);
    if (!mounted) return;

    return result.when(
      data: (_) {
        state = state.copyWith(successSubmit: Event(null));
      },
      error: (_, __) {
        _commonController.handleCommonError(result.error!, () {
          submitProduct(item);
        });
      },
      loading: () {},
    );
  }
}

@freezed
class ResultScreenUiState with _$ResultScreenUiState {
  const factory ResultScreenUiState({
    @Default('') String keyword,
    @Default('') String fileUrl,
    @Default('') String image,
    @Default('') String currentKeyword,
    @Default(null) bool? isLoggedIn,
    @Default(AsyncValue.loading()) AsyncValue<LensResponse> lensReponse,
    @Default(AsyncValue.loading())
    AsyncValue<List<ShoppingResult>> shoppingResults,
    @Default(null) Event? isError,
    @Default(null) Event? isDuplicateSavedResult,
    @Default(null) Event<bool>? nextPageLoading,
    @Default('') String savedKeyword,
    @Default(null) SavedSearch? savedSearch,
    @Default(null) Event? uploadFileException,
    @Default(null) ShoppingResult? selectedItem,
    @Default(null) Event? successSubmit,
  }) = _ResultScreenUiState;
}
