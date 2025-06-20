import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/data/serpapi/model/lens_response.dart';

part 'shopping_response.freezed.dart';

part 'shopping_response.g.dart';

@freezed
class ShoppingResponse with _$ShoppingResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ShoppingResponse({
    @Default(null) SearchMetadata? searchMetadata,
    @Default([]) List<ShoppingResult> shoppingResults,
    @Default(null) SerpapiPagination? pagination,
  }) = _ShoppingResponse;

  factory ShoppingResponse.fromJson(Map<String, dynamic> json) =>
      _$ShoppingResponseFromJson(json);
}

@freezed
class ShoppingResult with _$ShoppingResult {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ShoppingResult({
    @Default(0) int position,
    @Default('') String title,
    @Default('') String link,
    @Default('') String thumbnail,
    @Default('') String source,
    @Default('') String price,
    @Default('') String productLink,
    @Default('') String productId,
    @Default('') String delivery,
  }) = _ShoppingResult;

  factory ShoppingResult.fromJson(Map<String, dynamic> json) =>
      _$ShoppingResultFromJson(json);
}

@freezed
class SerpapiPagination with _$SerpapiPagination {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SerpapiPagination({
    @Default(0) @JsonStringToInt() int current,
    @Default('') String next,
  }) = _SerpapiPagination;

  factory SerpapiPagination.fromJson(Map<String, dynamic> json) =>
      _$SerpapiPaginationFromJson(json);
}

class JsonStringToInt implements JsonConverter<int, dynamic> {
  const JsonStringToInt();

  @override
  int fromJson(dynamic json) {
    if (json is num) {
      return json.toInt();
    }
    return int.tryParse(json as String) ?? 0;
  }

  @override
  String toJson(int object) => object.toString();
}
