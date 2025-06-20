// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommonScreenUiState {
  LoadingOverlayUiState get overlayUiState =>
      throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  dynamic Function()? get errorAction => throw _privateConstructorUsedError;

  /// Create a copy of CommonScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonScreenUiStateCopyWith<CommonScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonScreenUiStateCopyWith<$Res> {
  factory $CommonScreenUiStateCopyWith(
          CommonScreenUiState value, $Res Function(CommonScreenUiState) then) =
      _$CommonScreenUiStateCopyWithImpl<$Res, CommonScreenUiState>;
  @useResult
  $Res call(
      {LoadingOverlayUiState overlayUiState,
      Object? error,
      dynamic Function()? errorAction});
}

/// @nodoc
class _$CommonScreenUiStateCopyWithImpl<$Res, $Val extends CommonScreenUiState>
    implements $CommonScreenUiStateCopyWith<$Res> {
  _$CommonScreenUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overlayUiState = null,
    Object? error = freezed,
    Object? errorAction = freezed,
  }) {
    return _then(_value.copyWith(
      overlayUiState: null == overlayUiState
          ? _value.overlayUiState
          : overlayUiState // ignore: cast_nullable_to_non_nullable
              as LoadingOverlayUiState,
      error: freezed == error ? _value.error : error,
      errorAction: freezed == errorAction
          ? _value.errorAction
          : errorAction // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonScreenUiStateImplCopyWith<$Res>
    implements $CommonScreenUiStateCopyWith<$Res> {
  factory _$$CommonScreenUiStateImplCopyWith(_$CommonScreenUiStateImpl value,
          $Res Function(_$CommonScreenUiStateImpl) then) =
      __$$CommonScreenUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingOverlayUiState overlayUiState,
      Object? error,
      dynamic Function()? errorAction});
}

/// @nodoc
class __$$CommonScreenUiStateImplCopyWithImpl<$Res>
    extends _$CommonScreenUiStateCopyWithImpl<$Res, _$CommonScreenUiStateImpl>
    implements _$$CommonScreenUiStateImplCopyWith<$Res> {
  __$$CommonScreenUiStateImplCopyWithImpl(_$CommonScreenUiStateImpl _value,
      $Res Function(_$CommonScreenUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommonScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overlayUiState = null,
    Object? error = freezed,
    Object? errorAction = freezed,
  }) {
    return _then(_$CommonScreenUiStateImpl(
      overlayUiState: null == overlayUiState
          ? _value.overlayUiState
          : overlayUiState // ignore: cast_nullable_to_non_nullable
              as LoadingOverlayUiState,
      error: freezed == error ? _value.error : error,
      errorAction: freezed == errorAction
          ? _value.errorAction
          : errorAction // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
    ));
  }
}

/// @nodoc

class _$CommonScreenUiStateImpl implements _CommonScreenUiState {
  const _$CommonScreenUiStateImpl(
      {this.overlayUiState = LoadingOverlayUiState.hidden,
      this.error,
      this.errorAction});

  @override
  @JsonKey()
  final LoadingOverlayUiState overlayUiState;
  @override
  final Object? error;
  @override
  final dynamic Function()? errorAction;

  @override
  String toString() {
    return 'CommonScreenUiState(overlayUiState: $overlayUiState, error: $error, errorAction: $errorAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonScreenUiStateImpl &&
            (identical(other.overlayUiState, overlayUiState) ||
                other.overlayUiState == overlayUiState) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.errorAction, errorAction) ||
                other.errorAction == errorAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, overlayUiState,
      const DeepCollectionEquality().hash(error), errorAction);

  /// Create a copy of CommonScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonScreenUiStateImplCopyWith<_$CommonScreenUiStateImpl> get copyWith =>
      __$$CommonScreenUiStateImplCopyWithImpl<_$CommonScreenUiStateImpl>(
          this, _$identity);
}

abstract class _CommonScreenUiState implements CommonScreenUiState {
  const factory _CommonScreenUiState(
      {final LoadingOverlayUiState overlayUiState,
      final Object? error,
      final dynamic Function()? errorAction}) = _$CommonScreenUiStateImpl;

  @override
  LoadingOverlayUiState get overlayUiState;
  @override
  Object? get error;
  @override
  dynamic Function()? get errorAction;

  /// Create a copy of CommonScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonScreenUiStateImplCopyWith<_$CommonScreenUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
