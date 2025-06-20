import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';

part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LoginResponse({
    required LoginDataResponse data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class LoginDataResponse with _$LoginDataResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LoginDataResponse({
    @Default(false) bool status,
    @Default('') String message,
    @Default([]) List<dynamic> resource,
  }) = _LoginDataResponse;

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDataResponseFromJson(json);
}

@freezed
class LoginResourceResponse with _$LoginResourceResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LoginResourceResponse({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String username,
    @Default('') String email,
    @Default('') String emailVerifiedAt,
    @Default(0) int roleId,
  }) = _LoginResourceResponse;

  factory LoginResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResourceResponseFromJson(json);
}
