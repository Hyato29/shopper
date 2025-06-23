// lib/app/data/wms/model/identify_product_response.dart

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
    @Default(0) int id,
    @Default('') String productName,
    @Default(0.0) double productPrice,
  }) = _ProductScanData;

  factory ProductScanData.fromJson(Map<String, dynamic> json) =>
      _$ProductScanDataFromJson(json);
}