// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UiText {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) string,
    required TResult Function(LocalizationsBuilder builder) localized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? string,
    TResult? Function(LocalizationsBuilder builder)? localized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? string,
    TResult Function(LocalizationsBuilder builder)? localized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UiTextString value) string,
    required TResult Function(UiTextLocalizations value) localized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UiTextString value)? string,
    TResult? Function(UiTextLocalizations value)? localized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UiTextString value)? string,
    TResult Function(UiTextLocalizations value)? localized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiTextCopyWith<$Res> {
  factory $UiTextCopyWith(UiText value, $Res Function(UiText) then) =
      _$UiTextCopyWithImpl<$Res, UiText>;
}

/// @nodoc
class _$UiTextCopyWithImpl<$Res, $Val extends UiText>
    implements $UiTextCopyWith<$Res> {
  _$UiTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UiText
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UiTextStringImplCopyWith<$Res> {
  factory _$$UiTextStringImplCopyWith(
          _$UiTextStringImpl value, $Res Function(_$UiTextStringImpl) then) =
      __$$UiTextStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UiTextStringImplCopyWithImpl<$Res>
    extends _$UiTextCopyWithImpl<$Res, _$UiTextStringImpl>
    implements _$$UiTextStringImplCopyWith<$Res> {
  __$$UiTextStringImplCopyWithImpl(
      _$UiTextStringImpl _value, $Res Function(_$UiTextStringImpl) _then)
      : super(_value, _then);

  /// Create a copy of UiText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UiTextStringImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UiTextStringImpl implements UiTextString {
  const _$UiTextStringImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'UiText.string(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiTextStringImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of UiText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UiTextStringImplCopyWith<_$UiTextStringImpl> get copyWith =>
      __$$UiTextStringImplCopyWithImpl<_$UiTextStringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) string,
    required TResult Function(LocalizationsBuilder builder) localized,
  }) {
    return string(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? string,
    TResult? Function(LocalizationsBuilder builder)? localized,
  }) {
    return string?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? string,
    TResult Function(LocalizationsBuilder builder)? localized,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UiTextString value) string,
    required TResult Function(UiTextLocalizations value) localized,
  }) {
    return string(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UiTextString value)? string,
    TResult? Function(UiTextLocalizations value)? localized,
  }) {
    return string?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UiTextString value)? string,
    TResult Function(UiTextLocalizations value)? localized,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(this);
    }
    return orElse();
  }
}

abstract class UiTextString implements UiText {
  const factory UiTextString(final String value) = _$UiTextStringImpl;

  String get value;

  /// Create a copy of UiText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UiTextStringImplCopyWith<_$UiTextStringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UiTextLocalizationsImplCopyWith<$Res> {
  factory _$$UiTextLocalizationsImplCopyWith(_$UiTextLocalizationsImpl value,
          $Res Function(_$UiTextLocalizationsImpl) then) =
      __$$UiTextLocalizationsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LocalizationsBuilder builder});
}

/// @nodoc
class __$$UiTextLocalizationsImplCopyWithImpl<$Res>
    extends _$UiTextCopyWithImpl<$Res, _$UiTextLocalizationsImpl>
    implements _$$UiTextLocalizationsImplCopyWith<$Res> {
  __$$UiTextLocalizationsImplCopyWithImpl(_$UiTextLocalizationsImpl _value,
      $Res Function(_$UiTextLocalizationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UiText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? builder = null,
  }) {
    return _then(_$UiTextLocalizationsImpl(
      null == builder
          ? _value.builder
          : builder // ignore: cast_nullable_to_non_nullable
              as LocalizationsBuilder,
    ));
  }
}

/// @nodoc

class _$UiTextLocalizationsImpl implements UiTextLocalizations {
  const _$UiTextLocalizationsImpl(this.builder);

  @override
  final LocalizationsBuilder builder;

  @override
  String toString() {
    return 'UiText.localized(builder: $builder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiTextLocalizationsImpl &&
            (identical(other.builder, builder) || other.builder == builder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, builder);

  /// Create a copy of UiText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UiTextLocalizationsImplCopyWith<_$UiTextLocalizationsImpl> get copyWith =>
      __$$UiTextLocalizationsImplCopyWithImpl<_$UiTextLocalizationsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) string,
    required TResult Function(LocalizationsBuilder builder) localized,
  }) {
    return localized(builder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? string,
    TResult? Function(LocalizationsBuilder builder)? localized,
  }) {
    return localized?.call(builder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? string,
    TResult Function(LocalizationsBuilder builder)? localized,
    required TResult orElse(),
  }) {
    if (localized != null) {
      return localized(builder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UiTextString value) string,
    required TResult Function(UiTextLocalizations value) localized,
  }) {
    return localized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UiTextString value)? string,
    TResult? Function(UiTextLocalizations value)? localized,
  }) {
    return localized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UiTextString value)? string,
    TResult Function(UiTextLocalizations value)? localized,
    required TResult orElse(),
  }) {
    if (localized != null) {
      return localized(this);
    }
    return orElse();
  }
}

abstract class UiTextLocalizations implements UiText {
  const factory UiTextLocalizations(final LocalizationsBuilder builder) =
      _$UiTextLocalizationsImpl;

  LocalizationsBuilder get builder;

  /// Create a copy of UiText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UiTextLocalizationsImplCopyWith<_$UiTextLocalizationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
