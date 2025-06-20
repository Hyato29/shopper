// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      data: LoginDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$LoginDataResponseImpl _$$LoginDataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginDataResponseImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      resource: json['resource'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$LoginDataResponseImplToJson(
        _$LoginDataResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'resource': instance.resource,
    };

_$LoginResourceResponseImpl _$$LoginResourceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResourceResponseImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      emailVerifiedAt: json['email_verified_at'] as String? ?? '',
      roleId: (json['role_id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LoginResourceResponseImplToJson(
        _$LoginResourceResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'role_id': instance.roleId,
    };
