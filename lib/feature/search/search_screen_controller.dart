import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/auth/auth_repository.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/app/utils/event.dart';
import 'package:fskeleton/core.dart';

part 'search_screen_controller.freezed.dart';

class SearchScreenController extends StateNotifier<SearchScreenUiState> {
  SearchScreenController(
    this._authRepository,
    this._commonController,
    this._wmsApiRepository,
  ) : super(const SearchScreenUiState());

  final AuthRepository _authRepository;
  final CommonController _commonController;
  final WmsApiRepository _wmsApiRepository;

  static final provider = StateNotifierProvider.autoDispose<
      SearchScreenController, SearchScreenUiState>(
    (ref) {
      return SearchScreenController(
        ref.watch(AuthRepository.provider),
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

  void onChangeSearchKey(String searchKey) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (searchKey.length >= 3) {
        state = state.copyWith(searchKey: searchKey);
        _currentSeachKey = searchKey;
        loadProducts();
      } else {
        state = state.copyWith(products: const AsyncData([]));
      }
    });
  }

  void onRetrySeach() {
    onChangeSearchKey(state.searchKey);
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

  
}

@freezed
class SearchScreenUiState with _$SearchScreenUiState {
  const factory SearchScreenUiState({
    @Default(AsyncData([])) AsyncValue<List<WmsProduct>> products,
    @Default('') String searchKey,
    @Default(null) Event<bool>? nextPageLoading,
  }) = _SearchScreenUiState;
}
