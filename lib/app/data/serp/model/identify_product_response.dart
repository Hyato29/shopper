import 'package:freezed_annotation/freezed_annotation.dart';

part 'identify_product_response.freezed.dart';
part 'identify_product_response.g.dart';

@freezed
class IdentifyProductResponse with _$IdentifyProductResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory IdentifyProductResponse({
    @Default(false) bool success,
    @Default('') String message,
    ProductScanData? data,
  }) = _IdentifyProductResponse;

  factory IdentifyProductResponse.fromJson(Map<String, dynamic> json) =>
      _$IdentifyProductResponseFromJson(json);
}

@freezed
class ProductScanData with _$ProductScanData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProductScanData({
    @Default('') String productName,
    @Default(0.0) double productPrice,
    String? imageUrl,
    @Default([]) List<String> listEcomerce,
  }) = _ProductScanData;

  factory ProductScanData.fromJson(Map<String, dynamic> json) =>
      _$ProductScanDataFromJson(json);
}