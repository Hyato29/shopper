// lib/feature/product_detail/product_detail_controller.dart

import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/wms/model/wms_category/wms_category.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/app/utils/event.dart'; // <-- Pastikan import ini ada
import 'product_detail_params.dart';

part 'product_detail_controller.freezed.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    @Default(AsyncData([])) AsyncValue<List<Category>> categories,
    String? selectedStatus,
    @Default(1) int quantity,
    int? selectedCategoryId,
    @Default(false) bool isSaving,
    // TAMBAHKAN STATE INI untuk menandai navigasi
    Event<bool>? navigateBack, 
  }) = _ProductDetailState;
}

class ProductDetailController extends StateNotifier<ProductDetailState> {
  ProductDetailController(this._wmsRepository, this._commonController)
      : super(const ProductDetailState());

  final WmsApiRepository _wmsRepository;
  final CommonController _commonController;

  // ... (kode onScreenLoaded, onStatusChanged, onQuantityChanged, onCategoryChanged tetap sama) ...
  Future<void> onScreenLoaded() async {
    state = state.copyWith(categories: const AsyncValue.loading());
    final result = await AsyncValue.guard(() => _wmsRepository.getCategories());
    if (mounted) {
      state = state.copyWith(categories: result);
    }
  }

  void onStatusChanged(String? status) {
    state = state.copyWith(selectedStatus: status);
  }

  void onQuantityChanged(String value) {
    state = state.copyWith(quantity: int.tryParse(value) ?? 1);
  }

  void onCategoryChanged(int? categoryId) {
    state = state.copyWith(selectedCategoryId: categoryId);
  }


  // PERBAIKAN: Fungsi saveData tidak lagi mengembalikan bool
  Future<void> saveData(ProductDetailParams params) async {
    if (state.selectedStatus == null || state.quantity <= 0) {
      _commonController.handleCommonError(
          Exception("Status dan kuantitas wajib diisi."), null);
      return;
    }

    final categoryIdsToSend =
        state.selectedCategoryId == null ? <int>[] : [state.selectedCategoryId!];

    state = state.copyWith(isSaving: true);

    final imageFile = File(params.localImagePath);

    final result = await AsyncValue.guard(() => _wmsRepository.saveProductScan(
          productName: params.productName,
          productPrice: params.productPrice,
          quantity: state.quantity,
          status: state.selectedStatus!,
          categoryIds: categoryIdsToSend,
          imageFile: imageFile,
          // Menggunakan imageUrl dari e-commerce untuk disimpan
          imageUrl: params.imageUrl 
        ));

    state = state.copyWith(isSaving: false);

    if (result.hasError) {
      _commonController.handleCommonError(
          result.error ?? Exception("Gagal menyimpan data"), null);
    } else {
      // Jika berhasil, kirim event untuk navigasi
      state = state.copyWith(navigateBack: Event(true));
    }
  }
}

final productDetailControllerProvider = StateNotifierProvider.autoDispose<
    ProductDetailController, ProductDetailState>((ref) {
  return ProductDetailController(
    ref.watch(WmsApiRepository.provider),
    ref.watch(CommonController.provider.notifier),
  );
});