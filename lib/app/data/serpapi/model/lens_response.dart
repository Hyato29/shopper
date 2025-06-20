import 'package:freezed_annotation/freezed_annotation.dart';

part 'lens_response.freezed.dart';

part 'lens_response.g.dart';

@freezed
class LensResponse with _$LensResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LensResponse({
    @Default(null) SearchMetadata? searchMetadata,
    @Default(null) SearchParameters? searchParameters,
    @Default([]) List<VisualMatches> visualMatches,
  }) = _LensResponse;

  factory LensResponse.fromJson(Map<String, dynamic> json) =>
      _$LensResponseFromJson(json);
}

@freezed
class SearchMetadata with _$SearchMetadata {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SearchMetadata({
    @Default('') String gl,
    @Default('') String q,
  }) = _SearchMetadata;

  factory SearchMetadata.fromJson(Map<String, dynamic> json) =>
      _$SearchMetadataFromJson(json);
}

@freezed
class SearchParameters with _$SearchParameters {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SearchParameters({
    @Default('') String engine,
    @Default('') String q,
    @Default('') String locationRequested,
    @Default('') String locationUsed,
    @Default('') String googleDomain,
    @Default('') String hl,
    @Default('') String gl,
    @Default(0) double start,
    @Default('') String device,
  }) = _SearchParameters;

  factory SearchParameters.fromJson(Map<String, dynamic> json) =>
      _$SearchParametersFromJson(json);
}

@freezed
class VisualMatches with _$VisualMatches {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory VisualMatches({
    @Default(0) int position,
    @Default('') String title,
    @Default('') String link,
  }) = _VisualMatches;

  factory VisualMatches.fromJson(Map<String, dynamic> json) =>
      _$VisualMatchesFromJson(json);
}
