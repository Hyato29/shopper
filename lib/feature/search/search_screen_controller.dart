// lib/feature/search/search_screen_controller.dart

import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/auth/auth_repository.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/app/utils/event.dart';
import 'package:fskeleton/core.dart';

part 'search_screen_controller.freezed.dart';

@freezed
class SearchScreenUiState with _$SearchScreenUiState {
  const factory SearchScreenUiState({
    @Default(AsyncData([])) AsyncValue<List<WmsProduct>> products,
    @Default('') String searchKey,
    @Default(null) Event<bool>? nextPageLoading,
    @Default(null) Event? addProductSuccess,
  }) = _SearchScreenUiState;
}

class SearchScreenController extends StateNotifier<SearchScreenUiState> {
  SearchScreenController(
    this._authRepository,
    this._commonController,
    this._wmsApiRepository,
  ) : super(const SearchScreenUiState());

  final AuthRepository _authRepository;
  final CommonController _commonController;
  final WmsApiRepository _wmsApiRepository;

  static final provider =
      StateNotifierProvider.autoDispose<SearchScreenController, SearchScreenUiState>(
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
  String _currentSearchKey = '';

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void onScreenLoaded() {
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
        _currentSearchKey = searchKey;
        loadProducts();
      } else {
        // Kosongkan daftar jika query terlalu pendek
        state = state.copyWith(products: const AsyncData([]));
      }
    });
  }

  void onRetrySearch() {
    loadProducts();
  }

  Future<void> loadProducts() async {
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
      final AsyncValue<List<WmsProduct>> newProductState = result.when(
        data: (apiResponse) {
          _currentPage = apiResponse.pagination.currentPage;
          _lastPage = apiResponse.pagination.totalPages;
          return AsyncValue.data(apiResponse.data);
        },
        error: (e, s) => AsyncValue.error(e, s),
        loading: () => const AsyncValue.loading(),
      );
      state = state.copyWith(products: newProductState);
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

  // Fungsi ini ditambahkan kembali jika Anda ingin menyimpan produk langsung dari halaman pencarian
  Future<void> onProductTapped(WmsProduct data) async {
    _commonController.showLoading(isLoading: true);

    // final result = await AsyncValue.guard(
    //   () => _wmsApiRepository.saveProductScan(
    //       productName: data.productName,
    //       productPrice: double.tryParse(data.productPrice) ?? 0.0,
    //       quantity: 1, // Default quantity
    //       status: 'Lolos', // Default status
    //       imageUrl: data.imageUrl,
    //   )
    // );
    
    _commonController.showLoading(isLoading: false);
    if (!mounted) return;

    // result.when(
    //   data: (_) {
    //     state = state.copyWith(addProductSuccess: Event(null));
    //   },
    //   error: (e, s) {
    //     _commonController.handleCommonError(e, () {
    //       onProductTapped(data);
    //     });
    //   },
    //   loading: () {},
    // );
  }
}