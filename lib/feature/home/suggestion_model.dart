import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion_model.freezed.dart';

@freezed
class SuggestionModel with _$SuggestionModel {
  const factory SuggestionModel({
    @Default('') String code,
    @Default('') String title,
  }) = _SuggestionModel;
}
