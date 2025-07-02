// lib/app/data/wms/model/wms_product/wms_product.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/data/wms/model/wms_user/wms_user.dart';

part 'wms_product.freezed.dart';
part 'wms_product.g.dart';

// Wrapper level 1: { "data": { ... } }
@freezed
class WmsProductScanResponse with _$WmsProductScanResponse {
  const factory WmsProductScanResponse({
    required WmsProductScanData data,
  }) = _WmsProductScanResponse;

  factory WmsProductScanResponse.fromJson(Map<String, dynamic> json) =>
      _$WmsProductScanResponseFromJson(json);
}

// Wrapper level 2: { "status": ..., "message": ..., "resource": { ... } }
@freezed
class WmsProductScanData with _$WmsProductScanData {
  const factory WmsProductScanData({
    required bool status,
    required String message,
    required WmsProductScanResource resource,
  }) = _WmsProductScanData;

  factory WmsProductScanData.fromJson(Map<String, dynamic> json) =>
      _$WmsProductScanDataFromJson(json);
}

// Wrapper level 3: { "current_page": ..., "data": [ ... ], "last_page": ... }
@freezed
class WmsProductScanResource with _$WmsProductScanResource {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsProductScanResource({
    required int currentPage,
    required int lastPage,
    required int total,
    @Default([]) List<WmsProduct> data,
  }) = _WmsProductScanResource;

  factory WmsProductScanResource.fromJson(Map<String, dynamic> json) =>
      _$WmsProductScanResourceFromJson(json);
}

// Model utama untuk produk
@freezed
class WmsProduct with _$WmsProduct {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsProduct({
    required int id,
    required String productName,
    required String productPrice,
    String? image, // Ini bisa berupa URL lengkap atau null
    String? imageUrl, // Ini path storage
    required String createdAt,
    WmsUser? user,
    // Field `status`, `quantity`, `fixedPrice` tidak ada di respons ini
    // jadi kita hapus dari sini agar sesuai dengan data API
  }) = _WmsProduct;

  factory WmsProduct.fromJson(Map<String, dynamic> json) =>
      _$WmsProductFromJson(json);
}