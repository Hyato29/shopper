import 'package:freezed_annotation/freezed_annotation.dart';

part 'wms_category.freezed.dart';
part 'wms_category.g.dart';

@freezed
class WmsCategoryResponse with _$WmsCategoryResponse {
  const factory WmsCategoryResponse({
    required WmsCategoryData data,
  }) = _WmsCategoryResponse;

  factory WmsCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$WmsCategoryResponseFromJson(json);
}

@freezed
class WmsCategoryData with _$WmsCategoryData {
  const factory WmsCategoryData({
    required bool status,
    required String message,
    required List<Category> resource,
  }) = _WmsCategoryData;

  factory WmsCategoryData.fromJson(Map<String, dynamic> json) =>
      _$WmsCategoryDataFromJson(json);
}

@freezed
class Category with _$Category {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Category({
    required int id,
    @JsonKey(name: 'name_category') required String name,
    int? discountCategory,
    String? maxPriceCategory,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
