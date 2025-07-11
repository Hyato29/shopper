import 'package:freezed_annotation/freezed_annotation.dart';

part 'ecommerce_product.freezed.dart';
part 'ecommerce_product.g.dart';

@freezed
class EcommerceSearchResult with _$EcommerceSearchResult {
  const factory EcommerceSearchResult({
    @Default([]) List<EcommerceProduct> tokopedia,
    @Default([]) List<EcommerceProduct> shopee,
    @Default([]) List<EcommerceProduct> lazada,
  }) = _EcommerceSearchResult;

  factory EcommerceSearchResult.fromJson(Map<String, dynamic> json) =>
      _$EcommerceSearchResultFromJson(json);
}

@freezed
class EcommerceProduct with _$EcommerceProduct {
  const factory EcommerceProduct({
    required String title,
    required String price,
    @JsonKey(name: 'imageUrl') required String imageUrl,
  }) = _EcommerceProduct;

  factory EcommerceProduct.fromJson(Map<String, dynamic> json) =>
      _$EcommerceProductFromJson(json);
}
