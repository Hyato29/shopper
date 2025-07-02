// lib/app/data/wms/model/wms_user/wms_user.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wms_user.freezed.dart';
part 'wms_user.g.dart';

@freezed
class WmsUser with _$WmsUser {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WmsUser({
    required int id,
    required String name,
    required String username,
    String? formatBarcodeName,
  }) = _WmsUser;

  factory WmsUser.fromJson(Map<String, dynamic> json) => _$WmsUserFromJson(json);
}