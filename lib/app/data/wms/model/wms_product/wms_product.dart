// lib/app/data/wms/model/wms_product/wms_product.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wms_product.freezed.dart';
part 'wms_product.g.dart';

// Wrapper untuk seluruh respons API
@freezed
class ProductScanApiResponse with _$ProductScanApiResponse {
  const factory ProductScanApiResponse({
    @Default(false) bool success,
    @Default('') String message,
    required PaginationData pagination,
    @Default([]) List<WmsProduct> data,
  }) = _ProductScanApiResponse;

  factory ProductScanApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductScanApiResponseFromJson(json);
}

// Model untuk data paginasi
@freezed
class PaginationData with _$PaginationData {
  const factory PaginationData({
    required int currentPage,
    required int totalPages,
    required int totalItems,
  }) = _PaginationData;

  factory PaginationData.fromJson(Map<String, dynamic> json) =>
      _$PaginationDataFromJson(json);
}


// Model untuk satu item produk
@freezed
class WmsProduct with _$WmsProduct {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsProduct({
    required int id,
    required String productName,
    required String productPrice,
    int? quantity,
    String? status,
    String? fixedPrice,
    String? imageUrl,
    required String scannedAt,
  }) = _WmsProduct;

  factory WmsProduct.fromJson(Map<String, dynamic> json) =>
      _$WmsProductFromJson(json);
}