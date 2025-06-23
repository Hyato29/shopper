import 'package:freezed_annotation/freezed_annotation.dart';

part 'wms_user.freezed.dart';
part 'wms_user.g.dart';

@freezed
class WmsUser with _$WmsUser {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsUser({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String username,
    String? formatBarcodeName, // Mengizinkan nilai null
  }) = _WmsUser;

  factory WmsUser.fromJson(Map<String, dynamic> json) =>
      _$WmsUserFromJson(json);
}