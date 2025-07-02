
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wms_bundle.freezed.dart';
part 'wms_bundle.g.dart';

@freezed
class WmsGetBundleBasicResponse with _$WmsGetBundleBasicResponse {
  const factory WmsGetBundleBasicResponse({
    required WmsGetBundleResponse data,
  }) = _WmsGetBundleBasicResponse;

  factory WmsGetBundleBasicResponse.fromJson(Map<String, dynamic> json) =>
      _$WmsGetBundleBasicResponseFromJson(json);
}

@freezed
class WmsGetBundleResponse with _$WmsGetBundleResponse {
  const factory WmsGetBundleResponse({
    required bool status,
    required String message,
    required WmsGetBundleResource resource,
  }) = _WmsGetBundleResponse;

  factory WmsGetBundleResponse.fromJson(Map<String, dynamic> json) =>
      _$WmsGetBundleResponseFromJson(json);
}

@freezed
class WmsGetBundleResource with _$WmsGetBundleResource {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsGetBundleResource({
    required int currentPage,
    required int lastPage,
    required int total,
    @Default([]) List<WmsBundle> data,
  }) = _WmsGetBundleResource;

  factory WmsGetBundleResource.fromJson(Map<String, dynamic> json) =>
      _$WmsGetBundleResourceFromJson(json);
}

@freezed
class WmsBundle with _$WmsBundle {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsBundle({
    required int id,
    required String nameBundle,
    required String barcodeBundle,
    required int totalProductBundle,
    required String totalPriceBundle,
    String? totalPriceCustomBundle,
    @Default([]) List<ProductInBundle> productBundles,
  }) = _WmsBundle;

  factory WmsBundle.fromJson(Map<String, dynamic> json) =>
      _$WmsBundleFromJson(json);
}

@freezed
class ProductInBundle with _$ProductInBundle {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProductInBundle({
    required int id,
    required String newNameProduct,
    String? image,
    @JsonKey(name: 'display_price') required String displayPrice,
  }) = _ProductInBundle;

  factory ProductInBundle.fromJson(Map<String, dynamic> json) =>
      _$ProductInBundleFromJson(json);
}