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
    Event<bool>? nextPageLoading,
    WmsProduct? selectedProduct,
    WmsBundle? selectedBundle,
    Event<bool>? bundleCreated,
    @Default(false) bool isSelectionMode,
    @Default({}) Set<int> selectedProductIdsForDeletion,
  }) = _HistoryScreenUiState;
}

class HistoryScreenController extends StateNotifier<HistoryScreenUiState> {
  HistoryScreenController(
    this._commonController,
    this._wmsApiRepository,
  ) : super(const HistoryScreenUiState());

  final CommonController _commonController;
  final WmsApiRepository _wmsApiRepository;

  static final provider = StateNotifierProvider.autoDispose<
      HistoryScreenController, HistoryScreenUiState>(
    (ref) {
      return HistoryScreenController(
        ref.watch(CommonController.provider.notifier),
        ref.watch(WmsApiRepository.provider),
      );
    },
  );

  Timer? _debounceTimer;
  int _currentPage = 1;
  int? _lastPage;
  String _currentSearchKey = '';

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void onScreenLoaded() {
    loadProducts();
    loadBundles();
  }

  void onChangeSearchKey(String searchKey) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      state = state.copyWith(searchKey: searchKey);
      _currentSearchKey = searchKey;
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
      products: const AsyncValue.loading(),
      selectedProduct: null,
    );

    final result = await AsyncValue.guard(
      () => _wmsApiRepository.searchProduct(
        searchQuery: _currentSearchKey,
        page: _currentPage,
      ),
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
    if (state.nextPageLoading?.data == true ||
        _currentPage >= (_lastPage ?? _currentPage)) {
      return;
    }

    state = state.copyWith(nextPageLoading: Event(true));
    _currentPage++;

    final result = await AsyncValue.guard(
      () => _wmsApiRepository.searchProduct(
        searchQuery: _currentSearchKey,
        page: _currentPage,
      ),
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
      state = state.copyWith(nextPageLoading: Event(false));
    }
  }

  Future<void> loadBundles() async {
    state = state.copyWith(
      bundles: const AsyncValue.loading(),
      isSelectionMode: false,
      selectedProductIdsForDeletion: {},
    );
    final result = await AsyncValue.guard(() => _wmsApiRepository.getBundles());
    if (mounted) {
      result.when(
        data: (bundleResource) {
          final currentSelectedId = state.selectedBundle?.id;
          final newSelectedBundle = bundleResource.data
              .firstWhereOrNull((b) => b.id == currentSelectedId);
          state = state.copyWith(
            bundles: AsyncData(bundleResource.data),
            selectedBundle: newSelectedBundle,
          );
        },
        error: (e, s) {
          state = state.copyWith(bundles: AsyncError(e, s));
        },
        loading: () {},
      );
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
    if (state.isSelectionMode) return;

    if (state.selectedBundle == bundle) {
      state = state.copyWith(selectedBundle: null);
    } else {
      state = state.copyWith(selectedBundle: bundle);
    }
  }

  Future<void> createBundle(String name) async {
    _commonController.showLoading(isLoading: true);
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.createBundle(name: name),
    );
    _commonController.showLoading(isLoading: false);

    if (result.hasError) {
      _commonController.handleCommonError(
        result.error ?? Exception("Gagal membuat bundle"),
        () => createBundle(name),
      );
      state = state.copyWith(bundleCreated: Event(false));
    } else {
      await loadBundles();
      state = state.copyWith(bundleCreated: Event(true));
    }
  }

  Future<void> deleteBundle(int bundleId) async {
    _commonController.showLoading(isLoading: true);
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.deleteBundle(bundleId: bundleId),
    );
    _commonController.showLoading(isLoading: false);

    if (result.hasError) {
      _commonController.handleCommonError(
        result.error ?? Exception("Gagal menghapus bundle"),
        () => deleteBundle(bundleId),
      );
    } else {
      await loadBundles();
    }
  }

  void toggleSelectionMode() {
    state = state.copyWith(
      isSelectionMode: !state.isSelectionMode,
      selectedProductIdsForDeletion: {},
    );
  }

  void toggleProductForDeletion(int productInBundleId) {
    final newSet = Set<int>.from(state.selectedProductIdsForDeletion);
    if (newSet.contains(productInBundleId)) {
      newSet.remove(productInBundleId);
    } else {
      newSet.add(productInBundleId);
    }
    state = state.copyWith(selectedProductIdsForDeletion: newSet);
  }

  Future<void> deleteSelectedProductsFromBundle() async {
    if (state.selectedProductIdsForDeletion.isEmpty) return;

    final bundleId = state.selectedBundle?.id;
    if (bundleId == null) return;

    _commonController.showLoading(isLoading: true);

    final result = await AsyncValue.guard(
      () => _wmsApiRepository.removeProductsFromBundle(
        bundleId: bundleId,
        productInBundleIds: state.selectedProductIdsForDeletion.toList(),
      ),
    );

    _commonController.showLoading(isLoading: false);

    if (result.hasError) {
      _commonController.handleCommonError(
        result.error ?? Exception("Gagal menghapus produk"),
        null,
      );
    } else {
      await loadBundles();
    }
  }

  Future<void> deleteSingleProductFromBundle(int productInBundleId) async {
    final bundleId = state.selectedBundle?.id;
    if (bundleId == null) return;

    _commonController.showLoading(isLoading: true);

    final result = await AsyncValue.guard(
      () => _wmsApiRepository.removeProductsFromBundle(
        bundleId: bundleId,
        productInBundleIds: [productInBundleId],
      ),
    );

    _commonController.showLoading(isLoading: false);

    if (result.hasError) {
      _commonController.handleCommonError(
        result.error ?? Exception("Gagal menghapus produk"),
        null,
      );
    } else {
      await loadBundles();
    }
  }
}
