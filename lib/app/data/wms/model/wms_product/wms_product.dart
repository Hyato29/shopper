import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/data/wms/model/wms_user/wms_user.dart';

part 'wms_product.freezed.dart';

part 'wms_product.g.dart';

@freezed
class WmsGetProductBasicResponse with _$WmsGetProductBasicResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsGetProductBasicResponse({
    required WmsGetProductResponse data,
  }) = _WmsGetProductBasicResponse;

  factory WmsGetProductBasicResponse.fromJson(Map<String, dynamic> json) =>
      _$WmsGetProductBasicResponseFromJson(json);
}

@freezed
class WmsGetProductResponse with _$WmsGetProductResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsGetProductResponse({
    @Default(false) bool status,
    @Default('') String message,
    required WmsGetProductResource resource,
  }) = _WmsGetProductResponse;

  factory WmsGetProductResponse.fromJson(Map<String, dynamic> json) =>
      _$WmsGetProductResponseFromJson(json);
}

@freezed
class WmsGetProductResource with _$WmsGetProductResource {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsGetProductResource({
    @Default(0) int currentPage,
    @Default([]) List<WmsProduct> data,
    @Default(null) int? from,
    @Default(0) int lastPage,
    @Default(null) String? nextPageUrl,
    @Default(null) int? to,
  }) = _WmsGetProductResource;

  factory WmsGetProductResource.fromJson(Map<String, dynamic> json) =>
      _$WmsGetProductResourceFromJson(json);
}

@freezed
class WmsProduct with _$WmsProduct {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsProduct({
    @Default(0) int id,
    @Default(0) int userId,
    @Default('') String productName,
    @Default('') String productPrice,
    @Default('') String createdAt,
    @Default('') String updatedAt,
    String? image,
    WmsUser? user,
    String? status,
  }) = _WmsProduct;

  factory WmsProduct.fromJson(Map<String, dynamic> json) =>
      _$WmsProductFromJson(json);
}
