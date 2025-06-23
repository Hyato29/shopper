// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wms_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WmsUser _$WmsUserFromJson(Map<String, dynamic> json) {
  return _WmsUser.fromJson(json);
}

/// @nodoc
mixin _$WmsUser {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get formatBarcodeName => throw _privateConstructorUsedError;

  /// Serializes this WmsUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsUserCopyWith<WmsUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsUserCopyWith<$Res> {
  factory $WmsUserCopyWith(WmsUser value, $Res Function(WmsUser) then) =
      _$WmsUserCopyWithImpl<$Res, WmsUser>;
  @useResult
  $Res call({int id, String name, String username, String? formatBarcodeName});
}

/// @nodoc
class _$WmsUserCopyWithImpl<$Res, $Val extends WmsUser>
    implements $WmsUserCopyWith<$Res> {
  _$WmsUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? formatBarcodeName = freezed,
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
      formatBarcodeName: freezed == formatBarcodeName
          ? _value.formatBarcodeName
          : formatBarcodeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WmsUserImplCopyWith<$Res> implements $WmsUserCopyWith<$Res> {
  factory _$$WmsUserImplCopyWith(
          _$WmsUserImpl value, $Res Function(_$WmsUserImpl) then) =
      __$$WmsUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String username, String? formatBarcodeName});
}

/// @nodoc
class __$$WmsUserImplCopyWithImpl<$Res>
    extends _$WmsUserCopyWithImpl<$Res, _$WmsUserImpl>
    implements _$$WmsUserImplCopyWith<$Res> {
  __$$WmsUserImplCopyWithImpl(
      _$WmsUserImpl _value, $Res Function(_$WmsUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? formatBarcodeName = freezed,
  }) {
    return _then(_$WmsUserImpl(
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
      formatBarcodeName: freezed == formatBarcodeName
          ? _value.formatBarcodeName
          : formatBarcodeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WmsUserImpl implements _WmsUser {
  const _$WmsUserImpl(
      {this.id = 0,
      this.name = '',
      this.username = '',
      this.formatBarcodeName});

  factory _$WmsUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsUserImplFromJson(json);

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
  final String? formatBarcodeName;

  @override
  String toString() {
    return 'WmsUser(id: $id, name: $name, username: $username, formatBarcodeName: $formatBarcodeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.formatBarcodeName, formatBarcodeName) ||
                other.formatBarcodeName == formatBarcodeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, username, formatBarcodeName);

  /// Create a copy of WmsUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsUserImplCopyWith<_$WmsUserImpl> get copyWith =>
      __$$WmsUserImplCopyWithImpl<_$WmsUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsUserImplToJson(
      this,
    );
  }
}

abstract class _WmsUser implements WmsUser {
  const factory _WmsUser(
      {final int id,
      final String name,
      final String username,
      final String? formatBarcodeName}) = _$WmsUserImpl;

  factory _WmsUser.fromJson(Map<String, dynamic> json) = _$WmsUserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get username;
  @override
  String? get formatBarcodeName;

  /// Create a copy of WmsUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsUserImplCopyWith<_$WmsUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
