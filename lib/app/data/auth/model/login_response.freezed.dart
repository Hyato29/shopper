// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  LoginDataResponse get data => throw _privateConstructorUsedError;

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call({LoginDataResponse data});

  $LoginDataResponseCopyWith<$Res> get data;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginDataResponse,
    ) as $Val);
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginDataResponseCopyWith<$Res> get data {
    return $LoginDataResponseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoginDataResponse data});

  @override
  $LoginDataResponseCopyWith<$Res> get data;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoginResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginDataResponse,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl({required this.data});

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final LoginDataResponse data;

  @override
  String toString() {
    return 'LoginResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse({required final LoginDataResponse data}) =
      _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  LoginDataResponse get data;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginDataResponse _$LoginDataResponseFromJson(Map<String, dynamic> json) {
  return _LoginDataResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginDataResponse {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<dynamic> get resource => throw _privateConstructorUsedError;

  /// Serializes this LoginDataResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginDataResponseCopyWith<LoginDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataResponseCopyWith<$Res> {
  factory $LoginDataResponseCopyWith(
          LoginDataResponse value, $Res Function(LoginDataResponse) then) =
      _$LoginDataResponseCopyWithImpl<$Res, LoginDataResponse>;
  @useResult
  $Res call({bool status, String message, List<dynamic> resource});
}

/// @nodoc
class _$LoginDataResponseCopyWithImpl<$Res, $Val extends LoginDataResponse>
    implements $LoginDataResponseCopyWith<$Res> {
  _$LoginDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? resource = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      resource: null == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginDataResponseImplCopyWith<$Res>
    implements $LoginDataResponseCopyWith<$Res> {
  factory _$$LoginDataResponseImplCopyWith(_$LoginDataResponseImpl value,
          $Res Function(_$LoginDataResponseImpl) then) =
      __$$LoginDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, List<dynamic> resource});
}

/// @nodoc
class __$$LoginDataResponseImplCopyWithImpl<$Res>
    extends _$LoginDataResponseCopyWithImpl<$Res, _$LoginDataResponseImpl>
    implements _$$LoginDataResponseImplCopyWith<$Res> {
  __$$LoginDataResponseImplCopyWithImpl(_$LoginDataResponseImpl _value,
      $Res Function(_$LoginDataResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? resource = null,
  }) {
    return _then(_$LoginDataResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      resource: null == resource
          ? _value._resource
          : resource // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$LoginDataResponseImpl implements _LoginDataResponse {
  const _$LoginDataResponseImpl(
      {this.status = false,
      this.message = '',
      final List<dynamic> resource = const []})
      : _resource = resource;

  factory _$LoginDataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDataResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool status;
  @override
  @JsonKey()
  final String message;
  final List<dynamic> _resource;
  @override
  @JsonKey()
  List<dynamic> get resource {
    if (_resource is EqualUnmodifiableListView) return _resource;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resource);
  }

  @override
  String toString() {
    return 'LoginDataResponse(status: $status, message: $message, resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDataResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._resource, _resource));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message,
      const DeepCollectionEquality().hash(_resource));

  /// Create a copy of LoginDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDataResponseImplCopyWith<_$LoginDataResponseImpl> get copyWith =>
      __$$LoginDataResponseImplCopyWithImpl<_$LoginDataResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDataResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginDataResponse implements LoginDataResponse {
  const factory _LoginDataResponse(
      {final bool status,
      final String message,
      final List<dynamic> resource}) = _$LoginDataResponseImpl;

  factory _LoginDataResponse.fromJson(Map<String, dynamic> json) =
      _$LoginDataResponseImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  List<dynamic> get resource;

  /// Create a copy of LoginDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginDataResponseImplCopyWith<_$LoginDataResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginResourceResponse _$LoginResourceResponseFromJson(
    Map<String, dynamic> json) {
  return _LoginResourceResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResourceResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get emailVerifiedAt => throw _privateConstructorUsedError;
  int get roleId => throw _privateConstructorUsedError;

  /// Serializes this LoginResourceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResourceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResourceResponseCopyWith<LoginResourceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResourceResponseCopyWith<$Res> {
  factory $LoginResourceResponseCopyWith(LoginResourceResponse value,
          $Res Function(LoginResourceResponse) then) =
      _$LoginResourceResponseCopyWithImpl<$Res, LoginResourceResponse>;
  @useResult
  $Res call(
      {int id,
      String name,
      String username,
      String email,
      String emailVerifiedAt,
      int roleId});
}

/// @nodoc
class _$LoginResourceResponseCopyWithImpl<$Res,
        $Val extends LoginResourceResponse>
    implements $LoginResourceResponseCopyWith<$Res> {
  _$LoginResourceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResourceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? emailVerifiedAt = null,
    Object? roleId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerifiedAt: null == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginResourceResponseImplCopyWith<$Res>
    implements $LoginResourceResponseCopyWith<$Res> {
  factory _$$LoginResourceResponseImplCopyWith(
          _$LoginResourceResponseImpl value,
          $Res Function(_$LoginResourceResponseImpl) then) =
      __$$LoginResourceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String username,
      String email,
      String emailVerifiedAt,
      int roleId});
}

/// @nodoc
class __$$LoginResourceResponseImplCopyWithImpl<$Res>
    extends _$LoginResourceResponseCopyWithImpl<$Res,
        _$LoginResourceResponseImpl>
    implements _$$LoginResourceResponseImplCopyWith<$Res> {
  __$$LoginResourceResponseImplCopyWithImpl(_$LoginResourceResponseImpl _value,
      $Res Function(_$LoginResourceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginResourceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? emailVerifiedAt = null,
    Object? roleId = null,
  }) {
    return _then(_$LoginResourceResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerifiedAt: null == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$LoginResourceResponseImpl implements _LoginResourceResponse {
  const _$LoginResourceResponseImpl(
      {this.id = 0,
      this.name = '',
      this.username = '',
      this.email = '',
      this.emailVerifiedAt = '',
      this.roleId = 0});

  factory _$LoginResourceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResourceResponseImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String emailVerifiedAt;
  @override
  @JsonKey()
  final int roleId;

  @override
  String toString() {
    return 'LoginResourceResponse(id: $id, name: $name, username: $username, email: $email, emailVerifiedAt: $emailVerifiedAt, roleId: $roleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResourceResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.roleId, roleId) || other.roleId == roleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, username, email, emailVerifiedAt, roleId);

  /// Create a copy of LoginResourceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResourceResponseImplCopyWith<_$LoginResourceResponseImpl>
      get copyWith => __$$LoginResourceResponseImplCopyWithImpl<
          _$LoginResourceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResourceResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResourceResponse implements LoginResourceResponse {
  const factory _LoginResourceResponse(
      {final int id,
      final String name,
      final String username,
      final String email,
      final String emailVerifiedAt,
      final int roleId}) = _$LoginResourceResponseImpl;

  factory _LoginResourceResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResourceResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get username;
  @override
  String get email;
  @override
  String get emailVerifiedAt;
  @override
  int get roleId;

  /// Create a copy of LoginResourceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResourceResponseImplCopyWith<_$LoginResourceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
