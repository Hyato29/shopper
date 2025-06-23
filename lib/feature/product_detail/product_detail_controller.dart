// lib/feature/product_detail/product_detail_controller.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/wms/model/wms_category/wms_category.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/feature/product_detail/product_detail_params.dart';

part 'product_detail_controller.freezed.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    @Default(AsyncData([])) AsyncValue<List<Category>> categories,
    @Default(null) String? selectedStatus,
    @Default(1) int quantity,
    @Default({}) Set<int> selectedCategoryIds,
    @Default(false) bool isLoading,
  }) = _ProductDetailState;
}

class ProductDetailController extends StateNotifier<ProductDetailState> {
  ProductDetailController(this._wmsRepository, this._commonController)
      : super(const ProductDetailState());

  final WmsApiRepository _wmsRepository;
  final CommonController _commonController;

  Future<void> onScreenLoaded() async {
    state = state.copyWith(categories: const AsyncValue.loading());
    final result = await AsyncValue.guard(() => _wmsRepository.getCategories());
    if(mounted) {
      state = state.copyWith(categories: result);
    }
  }

  void onStatusChanged(String? status) {
    state = state.copyWith(selectedStatus: status);
  }

  void onQuantityChanged(String value) {
    state = state.copyWith(quantity: int.tryParse(value) ?? 1);
  }

  void toggleCategory(int categoryId) {
    final currentSelected = {...state.selectedCategoryIds};
    if (currentSelected.contains(categoryId)) {
      currentSelected.remove(categoryId);
    } else {
      currentSelected.add(categoryId);
    }
    state = state.copyWith(selectedCategoryIds: currentSelected);
  }

  Future<bool> saveData(ProductDetailParams params) async {
    if (state.selectedStatus == null || state.quantity <= 0) {
      _commonController.handleCommonError(Exception("Status dan kuantitas wajib diisi."), null);
      return false;
    }

    _commonController.showLoading(isLoading: true);

    final result = await AsyncValue.guard(() => _wmsRepository.saveProductScan(
          productName: params.productName,
          productPrice: params.productPrice,
          quantity: state.quantity,
          status: state.selectedStatus!,
          categoryIds: state.selectedCategoryIds.toList(),
        ));

    _commonController.showLoading(isLoading: false);

    if (result.hasError) {
      _commonController.handleCommonError(result.error ?? Exception("Gagal menyimpan data"), null);
      return false;
    }

    return true;
  }
}

final productDetailControllerProvider = StateNotifierProvider.autoDispose<ProductDetailController, ProductDetailState>((ref) {
  return ProductDetailController(
    ref.watch(WmsApiRepository.provider),
    ref.watch(CommonController.provider.notifier)
  );
});