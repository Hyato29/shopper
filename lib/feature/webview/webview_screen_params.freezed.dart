// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webview_screen_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WebViewScreenParams {
  String get fileUrl => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  SavedSearch? get savedSearch => throw _privateConstructorUsedError;

  /// Create a copy of WebViewScreenParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WebViewScreenParamsCopyWith<WebViewScreenParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebViewScreenParamsCopyWith<$Res> {
  factory $WebViewScreenParamsCopyWith(
          WebViewScreenParams value, $Res Function(WebViewScreenParams) then) =
      _$WebViewScreenParamsCopyWithImpl<$Res, WebViewScreenParams>;
  @useResult
  $Res call({String fileUrl, String image, SavedSearch? savedSearch});

  $SavedSearchCopyWith<$Res>? get savedSearch;
}

/// @nodoc
class _$WebViewScreenParamsCopyWithImpl<$Res, $Val extends WebViewScreenParams>
    implements $WebViewScreenParamsCopyWith<$Res> {
  _$WebViewScreenParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WebViewScreenParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUrl = null,
    Object? image = null,
    Object? savedSearch = freezed,
  }) {
    return _then(_value.copyWith(
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      savedSearch: freezed == savedSearch
          ? _value.savedSearch
          : savedSearch // ignore: cast_nullable_to_non_nullable
              as SavedSearch?,
    ) as $Val);
  }

  /// Create a copy of WebViewScreenParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SavedSearchCopyWith<$Res>? get savedSearch {
    if (_value.savedSearch == null) {
      return null;
    }

    return $SavedSearchCopyWith<$Res>(_value.savedSearch!, (value) {
      return _then(_value.copyWith(savedSearch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WebViewScreenParamsImplCopyWith<$Res>
    implements $WebViewScreenParamsCopyWith<$Res> {
  factory _$$WebViewScreenParamsImplCopyWith(_$WebViewScreenParamsImpl value,
          $Res Function(_$WebViewScreenParamsImpl) then) =
      __$$WebViewScreenParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fileUrl, String image, SavedSearch? savedSearch});

  @override
  $SavedSearchCopyWith<$Res>? get savedSearch;
}

/// @nodoc
class __$$WebViewScreenParamsImplCopyWithImpl<$Res>
    extends _$WebViewScreenParamsCopyWithImpl<$Res, _$WebViewScreenParamsImpl>
    implements _$$WebViewScreenParamsImplCopyWith<$Res> {
  __$$WebViewScreenParamsImplCopyWithImpl(_$WebViewScreenParamsImpl _value,
      $Res Function(_$WebViewScreenParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of WebViewScreenParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUrl = null,
    Object? image = null,
    Object? savedSearch = freezed,
  }) {
    return _then(_$WebViewScreenParamsImpl(
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      savedSearch: freezed == savedSearch
          ? _value.savedSearch
          : savedSearch // ignore: cast_nullable_to_non_nullable
              as SavedSearch?,
    ));
  }
}

/// @nodoc

class _$WebViewScreenParamsImpl implements _WebViewScreenParams {
  const _$WebViewScreenParamsImpl(
      {required this.fileUrl, required this.image, this.savedSearch = null});

  @override
  final String fileUrl;
  @override
  final String image;
  @override
  @JsonKey()
  final SavedSearch? savedSearch;

  @override
  String toString() {
    return 'WebViewScreenParams(fileUrl: $fileUrl, image: $image, savedSearch: $savedSearch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebViewScreenParamsImpl &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.savedSearch, savedSearch) ||
                other.savedSearch == savedSearch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileUrl, image, savedSearch);

  /// Create a copy of WebViewScreenParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebViewScreenParamsImplCopyWith<_$WebViewScreenParamsImpl> get copyWith =>
      __$$WebViewScreenParamsImplCopyWithImpl<_$WebViewScreenParamsImpl>(
          this, _$identity);
}

abstract class _WebViewScreenParams implements WebViewScreenParams {
  const factory _WebViewScreenParams(
      {required final String fileUrl,
      required final String image,
      final SavedSearch? savedSearch}) = _$WebViewScreenParamsImpl;

  @override
  String get fileUrl;
  @override
  String get image;
  @override
  SavedSearch? get savedSearch;

  /// Create a copy of WebViewScreenParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebViewScreenParamsImplCopyWith<_$WebViewScreenParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
