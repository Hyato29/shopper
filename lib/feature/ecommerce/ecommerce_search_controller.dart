// lib/feature/ecommerce_search/ecommerce_search_controller.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/data/ecommerce/model/ecommerce_product.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';

part 'ecommerce_search_controller.freezed.dart';

@freezed
class EcommerceSearchState with _$EcommerceSearchState {
  const factory EcommerceSearchState({
    @Default(AsyncValue.loading())
    AsyncValue<EcommerceSearchResult> searchResult,
  }) = _EcommerceSearchState;
}

class EcommerceSearchController extends StateNotifier<EcommerceSearchState> {
  EcommerceSearchController(this._wmsApiRepository)
      : super(const EcommerceSearchState());

  final WmsApiRepository _wmsApiRepository;

  Future<void> search(String productName) async {
    state = state.copyWith(searchResult: const AsyncValue.loading());
    final result = await AsyncValue.guard(
        () => _wmsApiRepository.searchEcommerce(productName: productName));
    if (mounted) {
      state = state.copyWith(searchResult: result);
    }
  }
}

final ecommerceSearchControllerProvider = StateNotifierProvider.autoDispose<
    EcommerceSearchController, EcommerceSearchState>((ref) {
  return EcommerceSearchController(ref.watch(WmsApiRepository.provider));
});