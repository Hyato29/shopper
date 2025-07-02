// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wms_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WmsUserImpl _$$WmsUserImplFromJson(Map<String, dynamic> json) =>
    _$WmsUserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      username: json['username'] as String,
      formatBarcodeName: json['format_barcode_name'] as String?,
    );

Map<String, dynamic> _$$WmsUserImplToJson(_$WmsUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'format_barcode_name': instance.formatBarcodeName,
    };
