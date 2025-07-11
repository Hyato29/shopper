import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/app/utils/event.dart';

part 'product_bundle_controller.freezed.dart';

@freezed
class ProductBundleState with _$ProductBundleState {
  const factory ProductBundleState({
    @Default(AsyncData([])) AsyncValue<List<WmsProduct>> products,
    @Default({}) Set<int> selectedProductIds,
    @Default(false) bool isInserting,
    Event<bool>? insertionSuccess,
    @Default('') String searchKey,
    @Default(false) bool nextPageLoading,
  }) = _ProductBundleState;
}

class ProductBundleController extends StateNotifier<ProductBundleState> {
  ProductBundleController(this._wmsApiRepository, this._commonController)
      : super(const ProductBundleState());

  final WmsApiRepository _wmsApiRepository;
  final CommonController _commonController;

  static final provider = StateNotifierProvider.autoDispose<
      ProductBundleController, ProductBundleState>((ref) {
    return ProductBundleController(
      ref.watch(WmsApiRepository.provider),
      ref.watch(CommonController.provider.notifier),
    );
  });

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
  }

  void onChangeSearchKey(String searchKey) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      state = state.copyWith(searchKey: searchKey);
      loadProducts();
    });
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
    if (state.nextPageLoading || _currentPage >= (_lastPage ?? _currentPage)) {
      return;
    }

    state = state.copyWith(nextPageLoading: true);
    _currentPage++;

    final result = await AsyncValue.guard(
      () => _wmsApiRepository.searchProduct(
        searchQuery: state.searchKey,
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
      state = state.copyWith(nextPageLoading: false);
    }
  }

  void toggleProductSelection(int productId) {
    final newSet = Set<int>.from(state.selectedProductIds);
    if (newSet.contains(productId)) {
      newSet.remove(productId);
    } else {
      newSet.add(productId);
    }
    state = state.copyWith(selectedProductIds: newSet);
  }

  void toggleSelectAll() {
    final allProductIds = state.products.value?.map((p) => p.id).toSet() ?? {};
    if (state.selectedProductIds.containsAll(allProductIds)) {
      state = state.copyWith(selectedProductIds: {});
    } else {
      state = state.copyWith(selectedProductIds: allProductIds);
    }
  }

  Future<void> addProductsToBundle(int bundleId) async {
    if (state.selectedProductIds.isEmpty) {
      _commonController.handleCommonError(
        Exception("Pilih minimal satu produk."),
        null,
      );
      return;
    }

    state = state.copyWith(isInserting: true);
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.addProductsToBundle(
        bundleId: bundleId,
        productIds: state.selectedProductIds.toList(),
      ),
    );
    state = state.copyWith(isInserting: false);

    if (result.hasError) {
      _commonController.handleCommonError(
        result.error ?? Exception("Gagal menambahkan produk ke bundle"),
        () => addProductsToBundle(bundleId),
      );
    } else {
      state = state.copyWith(insertionSuccess: Event(true));
    }
  }
}
