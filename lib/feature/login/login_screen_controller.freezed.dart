// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginScreenUiState {
  bool? get isLoggedIn => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  AsyncValue<LoginResourceResponse> get loginResponse =>
      throw _privateConstructorUsedError;
  bool get rememberMe => throw _privateConstructorUsedError;
  bool get buttonEnable => throw _privateConstructorUsedError;

  /// Create a copy of LoginScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginScreenUiStateCopyWith<LoginScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginScreenUiStateCopyWith<$Res> {
  factory $LoginScreenUiStateCopyWith(
          LoginScreenUiState value, $Res Function(LoginScreenUiState) then) =
      _$LoginScreenUiStateCopyWithImpl<$Res, LoginScreenUiState>;
  @useResult
  $Res call(
      {bool? isLoggedIn,
      String email,
      String password,
      AsyncValue<LoginResourceResponse> loginResponse,
      bool rememberMe,
      bool buttonEnable});
}

/// @nodoc
class _$LoginScreenUiStateCopyWithImpl<$Res, $Val extends LoginScreenUiState>
    implements $LoginScreenUiStateCopyWith<$Res> {
  _$LoginScreenUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = freezed,
    Object? email = null,
    Object? password = null,
    Object? loginResponse = null,
    Object? rememberMe = null,
    Object? buttonEnable = null,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: freezed == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      loginResponse: null == loginResponse
          ? _value.loginResponse
          : loginResponse // ignore: cast_nullable_to_non_nullable
              as AsyncValue<LoginResourceResponse>,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      buttonEnable: null == buttonEnable
          ? _value.buttonEnable
          : buttonEnable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginScreenUiStateImplCopyWith<$Res>
    implements $LoginScreenUiStateCopyWith<$Res> {
  factory _$$LoginScreenUiStateImplCopyWith(_$LoginScreenUiStateImpl value,
          $Res Function(_$LoginScreenUiStateImpl) then) =
      __$$LoginScreenUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isLoggedIn,
      String email,
      String password,
      AsyncValue<LoginResourceResponse> loginResponse,
      bool rememberMe,
      bool buttonEnable});
}

/// @nodoc
class __$$LoginScreenUiStateImplCopyWithImpl<$Res>
    extends _$LoginScreenUiStateCopyWithImpl<$Res, _$LoginScreenUiStateImpl>
    implements _$$LoginScreenUiStateImplCopyWith<$Res> {
  __$$LoginScreenUiStateImplCopyWithImpl(_$LoginScreenUiStateImpl _value,
      $Res Function(_$LoginScreenUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = freezed,
    Object? email = null,
    Object? password = null,
    Object? loginResponse = null,
    Object? rememberMe = null,
    Object? buttonEnable = null,
  }) {
    return _then(_$LoginScreenUiStateImpl(
      isLoggedIn: freezed == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      loginResponse: null == loginResponse
          ? _value.loginResponse
          : loginResponse // ignore: cast_nullable_to_non_nullable
              as AsyncValue<LoginResourceResponse>,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      buttonEnable: null == buttonEnable
          ? _value.buttonEnable
          : buttonEnable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginScreenUiStateImpl implements _LoginScreenUiState {
  const _$LoginScreenUiStateImpl(
      {this.isLoggedIn = null,
      this.email = '',
      this.password = '',
      this.loginResponse = const AsyncValue.loading(),
      this.rememberMe = false,
      this.buttonEnable = false});

  @override
  @JsonKey()
  final bool? isLoggedIn;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final AsyncValue<LoginResourceResponse> loginResponse;
  @override
  @JsonKey()
  final bool rememberMe;
  @override
  @JsonKey()
  final bool buttonEnable;

  @override
  String toString() {
    return 'LoginScreenUiState(isLoggedIn: $isLoggedIn, email: $email, password: $password, loginResponse: $loginResponse, rememberMe: $rememberMe, buttonEnable: $buttonEnable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginScreenUiStateImpl &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.loginResponse, loginResponse) ||
                other.loginResponse == loginResponse) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe) &&
            (identical(other.buttonEnable, buttonEnable) ||
                other.buttonEnable == buttonEnable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoggedIn, email, password,
      loginResponse, rememberMe, buttonEnable);

  /// Create a copy of LoginScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginScreenUiStateImplCopyWith<_$LoginScreenUiStateImpl> get copyWith =>
      __$$LoginScreenUiStateImplCopyWithImpl<_$LoginScreenUiStateImpl>(
          this, _$identity);
}

abstract class _LoginScreenUiState implements LoginScreenUiState {
  const factory _LoginScreenUiState(
      {final bool? isLoggedIn,
      final String email,
      final String password,
      final AsyncValue<LoginResourceResponse> loginResponse,
      final bool rememberMe,
      final bool buttonEnable}) = _$LoginScreenUiStateImpl;

  @override
  bool? get isLoggedIn;
  @override
  String get email;
  @override
  String get password;
  @override
  AsyncValue<LoginResourceResponse> get loginResponse;
  @override
  bool get rememberMe;
  @override
  bool get buttonEnable;

  /// Create a copy of LoginScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginScreenUiStateImplCopyWith<_$LoginScreenUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
