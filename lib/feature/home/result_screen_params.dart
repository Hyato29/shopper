import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/data/my_search_preferences/saved_search.dart';

part 'result_screen_params.freezed.dart';

@freezed
class ResultScreenParams with _$ResultScreenParams {
  const factory ResultScreenParams({
    required String keyword,
    required String fileUrl,
    required String image,
    @Default(null) SavedSearch? savedSearch,
  }) = _ResultScreenParams;
}
