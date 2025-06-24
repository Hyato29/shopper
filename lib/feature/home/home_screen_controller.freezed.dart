// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeScreenUiState {
  AsyncValue<List<WmsProduct>> get products =>
      throw _privateConstructorUsedError;
  String get appVersion => throw _privateConstructorUsedError;

  /// Create a copy of HomeScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeScreenUiStateCopyWith<HomeScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenUiStateCopyWith<$Res> {
  factory $HomeScreenUiStateCopyWith(
          HomeScreenUiState value, $Res Function(HomeScreenUiState) then) =
      _$HomeScreenUiStateCopyWithImpl<$Res, HomeScreenUiState>;
  @useResult
  $Res call({AsyncValue<List<WmsProduct>> products, String appVersion});
}

/// @nodoc
class _$HomeScreenUiStateCopyWithImpl<$Res, $Val extends HomeScreenUiState>
    implements $HomeScreenUiStateCopyWith<$Res> {
  _$HomeScreenUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? appVersion = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WmsProduct>>,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeScreenUiStateImplCopyWith<$Res>
    implements $HomeScreenUiStateCopyWith<$Res> {
  factory _$$HomeScreenUiStateImplCopyWith(_$HomeScreenUiStateImpl value,
          $Res Function(_$HomeScreenUiStateImpl) then) =
      __$$HomeScreenUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<WmsProduct>> products, String appVersion});
}

/// @nodoc
class __$$HomeScreenUiStateImplCopyWithImpl<$Res>
    extends _$HomeScreenUiStateCopyWithImpl<$Res, _$HomeScreenUiStateImpl>
    implements _$$HomeScreenUiStateImplCopyWith<$Res> {
  __$$HomeScreenUiStateImplCopyWithImpl(_$HomeScreenUiStateImpl _value,
      $Res Function(_$HomeScreenUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? appVersion = null,
  }) {
    return _then(_$HomeScreenUiStateImpl(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WmsProduct>>,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeScreenUiStateImpl implements _HomeScreenUiState {
  const _$HomeScreenUiStateImpl(
      {this.products = const AsyncData([]), this.appVersion = ''});

  @override
  @JsonKey()
  final AsyncValue<List<WmsProduct>> products;
  @override
  @JsonKey()
  final String appVersion;

  @override
  String toString() {
    return 'HomeScreenUiState(products: $products, appVersion: $appVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeScreenUiStateImpl &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products, appVersion);

  /// Create a copy of HomeScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeScreenUiStateImplCopyWith<_$HomeScreenUiStateImpl> get copyWith =>
      __$$HomeScreenUiStateImplCopyWithImpl<_$HomeScreenUiStateImpl>(
          this, _$identity);
}

abstract class _HomeScreenUiState implements HomeScreenUiState {
  const factory _HomeScreenUiState(
      {final AsyncValue<List<WmsProduct>> products,
      final String appVersion}) = _$HomeScreenUiStateImpl;

  @override
  AsyncValue<List<WmsProduct>> get products;
  @override
  String get appVersion;

  /// Create a copy of HomeScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeScreenUiStateImplCopyWith<_$HomeScreenUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
