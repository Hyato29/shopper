import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/data/serpapi/model/shopping_response.dart';
import 'package:fskeleton/app/data/try_parse_date_time.dart';

part 'saved_search.freezed.dart';
part 'saved_search.g.dart';

@freezed
class SavedSearch with _$SavedSearch {
  const factory SavedSearch({
    required String image,
    required String keyword,
    required List<ShoppingResult> data,
    @TryParseDateTime() DateTime? createdAt,
  }) = _SavedSearch;

  factory SavedSearch.fromJson(Map<String, dynamic> json) =>
      _$SavedSearchFromJson(json);
}
