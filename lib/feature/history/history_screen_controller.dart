// lib/feature/history/history_screen_controller.dart

import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/wms/model/wms_bundle/wms_bundle.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/app/utils/event.dart';
import 'package:fskeleton/core.dart';

part 'history_screen_controller.freezed.dart';

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


class HistoryScreenController extends StateNotifier<HistoryScreenUiState> {
  HistoryScreenController(
    this._wmsApiRepository,
    this._commonController, // Menambahkan CommonController
  ) : super(const HistoryScreenUiState());

  final WmsApiRepository _wmsApiRepository;
  final CommonController _commonController; // Menambahkan CommonController

  static final provider =
      StateNotifierProvider.autoDispose<HistoryScreenController, HistoryScreenUiState>(
    (ref) {
      return HistoryScreenController(
        ref.watch(WmsApiRepository.provider),
        ref.watch(CommonController.provider.notifier), // Menambahkan CommonController
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
    final result = await AsyncValue.guard(() => _wmsApiRepository.getBundles());
    if (!mounted) return;
    result.when(
      data: (bundleResource) {
        state = state.copyWith(bundles: AsyncData(bundleResource.data));
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

  void onRetrySearch() {
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

    if (mounted) {
      final AsyncValue<List<WmsProduct>> newProductState = result.when(
        data: (apiResponse) {
          _currentPage = apiResponse.pagination.currentPage;
          _lastPage = apiResponse.pagination.totalPages;
          return AsyncValue.data(apiResponse.data);
        },
        error: (e, s) {
           _commonController.handleCommonError(e, () => loadProducts());
           return AsyncValue.error(e, s);
        },
        loading: () => const AsyncValue.loading(),
      );
      state = state.copyWith(products: newProductState);
    }
  }

  Future<void> loadNextProducts() async {
    if (state.nextPageLoading?.data == true || _currentPage >= (_lastPage ?? _currentPage)) return;

    state = state.copyWith(nextPageLoading: Event(true));
    _currentPage++;
    
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.searchProduct(
        searchQuery: state.searchKey,
        page: _currentPage,
      ),
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
      state = state.copyWith(nextPageLoading: Event(false));
    }
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