import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/data/wms/model/wms_bundle/wms_bundle.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/app/utils/event.dart';
import 'package:fskeleton/core.dart';

part 'history_screen_controller.freezed.dart';

class HistoryScreenController extends StateNotifier<HistoryScreenUiState> {
  HistoryScreenController(
    this._wmsApiRepository,
  ) : super(const HistoryScreenUiState());

  final WmsApiRepository _wmsApiRepository;

  static final provider = StateNotifierProvider.autoDispose<
      HistoryScreenController, HistoryScreenUiState>(
    (ref) {
      return HistoryScreenController(
        ref.watch(WmsApiRepository.provider),
      );
    },
  );

  Timer? _debounceTimer;

  int _currentPage = 1;
  int? _lastPage;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  Future<void> onScreenLoaded() async {
    await loadProducts();
    await loadBundles();
  }

  Future<void> loadBundles() async {
    state = state.copyWith(bundles: const AsyncValue.loading());
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.getBundles(),
    );
    if (!mounted) return;
    result.when(
      data: (data) {
        state = state.copyWith(bundles: AsyncData(data.data));
      },
      error: (e, s) {
        state = state.copyWith(bundles: AsyncError(e, s));
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

  Future<void> loadProducts() async {
    _currentPage = 1;
    _lastPage = null;
    state = state.copyWith(
        products: const AsyncValue.loading(), selectedProduct: null);
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.searchProduct(
        searchQuery: state.searchKey,
        page: _currentPage,
      ),
    );
    if (!mounted) return;
    return result.when(
      data: (data) {
        _lastPage = data.lastPage;
        state = state.copyWith(products: AsyncData(data.data));
      },
      error: (_, __) {
        state = state.copyWith(
          products: AsyncError(result.error!, StackTrace.current),
        );
      },
      loading: () {},
    );
  }

  Future<void> loadNextProducts() async {
    if (state.searchKey.isEmpty || _currentPage == _lastPage) return;

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

  void selectProduct(WmsProduct product) {
    if (state.selectedProduct == product) {
      state = state.copyWith(selectedProduct: null);
    } else {
      state = state.copyWith(selectedProduct: product);
    }
  }

  void selectBundle(WmsBundle bundle) {
    if (state.selectedBundle == bundle) {
      state = state.copyWith(selectedBundle: null);
    } else {
      state = state.copyWith(selectedBundle: bundle);
    }
  }
}

@freezed
class HistoryScreenUiState with _$HistoryScreenUiState {
  const factory HistoryScreenUiState({
    @Default(AsyncData([])) AsyncValue<List<WmsProduct>> products,
    @Default(AsyncData([])) AsyncValue<List<WmsBundle>> bundles,
    @Default('') String searchKey,
    @Default(null) Event<bool>? nextPageLoading,
    WmsProduct? selectedProduct,
    WmsBundle? selectedBundle,
  }) = _HistoryScreenUiState;
}
