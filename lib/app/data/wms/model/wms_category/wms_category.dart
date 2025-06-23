// lib/app/data/wms/model/category.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wms_category.freezed.dart';
part 'wms_category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}