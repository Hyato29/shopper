import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @Default('') String code,
    @Default('') String title,
    @Default('') String price,
    @Default('') String imageUrl,
  }) = _ProductModel;
}
