// lib/feature/search/search_screen_controller.dart

import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/app/utils/event.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/result/product_detail_params.dart';

part 'search_screen_controller.freezed.dart';

@freezed
class SearchScreenUiState with _$SearchScreenUiState {
  const factory SearchScreenUiState({
    @Default(AsyncData([])) AsyncValue<List<WmsProduct>> products,
    @Default('') String searchKey,
    @Default(null) Event<bool>? nextPageLoading,
  }) = _SearchScreenUiState;
}

class SearchScreenController extends StateNotifier<SearchScreenUiState> {
  SearchScreenController(
    this._commonController,
    this._wmsApiRepository,
  ) : super(const SearchScreenUiState());

  final CommonController _commonController;
  final WmsApiRepository _wmsApiRepository;

  static final provider =
      StateNotifierProvider.autoDispose<SearchScreenController, SearchScreenUiState>(
    (ref) {
      return SearchScreenController(
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
    state = state.copyWith(products: const AsyncData([]));
  }

  void onChangeSearchKey(String searchKey) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      state = state.copyWith(searchKey: searchKey);
      _currentSearchKey = searchKey;
      loadProducts();
    });
  }

  Future<void> loadProducts() async {
    if (_currentSearchKey.isEmpty) {
      state = state.copyWith(products: const AsyncData([]));
      return;
    }

    _currentPage = 1;
    _lastPage = null;
    state = state.copyWith(products: const AsyncValue.loading());

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
    if (state.nextPageLoading?.data == true || _currentPage >= (_lastPage ?? _currentPage)) {
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

  ProductDetailParams prepareProductForDetail(WmsProduct product) {
    return ProductDetailParams(
      productName: product.productName,
      productPrice: double.tryParse(product.productPrice) ?? 0.0,
      imageUrl: product.image, // Gunakan field 'image' dari WMS
      localImagePath: '',
      listEcomerce: [], 
    );
  }
}