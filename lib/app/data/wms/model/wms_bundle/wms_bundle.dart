// lib/app/data/wms/model/wms_bundle.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wms_bundle.freezed.dart';
part 'wms_bundle.g.dart';

@freezed
class WmsGetBundleBasicResponse with _$WmsGetBundleBasicResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsGetBundleBasicResponse({
    required WmsGetBundleResponse data,
  }) = _WmsGetBundleBasicResponse;

  factory WmsGetBundleBasicResponse.fromJson(Map<String, dynamic> json) =>
      _$WmsGetBundleBasicResponseFromJson(json);
}

@freezed
class WmsGetBundleResponse with _$WmsGetBundleResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsGetBundleResponse({
    @Default(false) bool status,
    @Default('') String message,
    required WmsGetBundleResource resource,
  }) = _WmsGetBundleResponse;

  factory WmsGetBundleResponse.fromJson(Map<String, dynamic> json) =>
      _$WmsGetBundleResponseFromJson(json);
}

@freezed
class WmsGetBundleResource with _$WmsGetBundleResource {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsGetBundleResource({
    @Default(0) int currentPage,
    @Default([]) List<WmsBundle> data,
    @Default(0) int lastPage,
  }) = _WmsGetBundleResource;

  factory WmsGetBundleResource.fromJson(Map<String, dynamic> json) =>
      _$WmsGetBundleResourceFromJson(json);
}

@freezed
class WmsBundle with _$WmsBundle {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsBundle({
    @Default(0) int id,
    @Default('') String nameBundle,
    @Default('') String barcodeBundle,
    @Default(0) int totalProductBundle,
    @Default("0.00") String totalPriceBundle,
    @Default("0.00") String totalPriceCustomBundle,
    @Default([]) List<ProductInBundle> productBundles,
  }) = _WmsBundle;

  factory WmsBundle.fromJson(Map<String, dynamic> json) =>
      _$WmsBundleFromJson(json);
}

@freezed
class ProductInBundle with _$ProductInBundle {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProductInBundle({
    @Default(0) int id,
    @Default('') String newNameProduct,
    @Default("0.00") String displayPrice,
    String? image,
  }) = _ProductInBundle;

  factory ProductInBundle.fromJson(Map<String, dynamic> json) =>
      _$ProductInBundleFromJson(json);
}