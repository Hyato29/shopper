// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_screen_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultScreenParams {
  String get keyword => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  SavedSearch? get savedSearch => throw _privateConstructorUsedError;

  /// Create a copy of ResultScreenParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultScreenParamsCopyWith<ResultScreenParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultScreenParamsCopyWith<$Res> {
  factory $ResultScreenParamsCopyWith(
          ResultScreenParams value, $Res Function(ResultScreenParams) then) =
      _$ResultScreenParamsCopyWithImpl<$Res, ResultScreenParams>;
  @useResult
  $Res call(
      {String keyword, String fileUrl, String image, SavedSearch? savedSearch});

  $SavedSearchCopyWith<$Res>? get savedSearch;
}

/// @nodoc
class _$ResultScreenParamsCopyWithImpl<$Res, $Val extends ResultScreenParams>
    implements $ResultScreenParamsCopyWith<$Res> {
  _$ResultScreenParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultScreenParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? fileUrl = null,
    Object? image = null,
    Object? savedSearch = freezed,
  }) {
    return _then(_value.copyWith(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
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

  /// Create a copy of ResultScreenParams
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
abstract class _$$ResultScreenParamsImplCopyWith<$Res>
    implements $ResultScreenParamsCopyWith<$Res> {
  factory _$$ResultScreenParamsImplCopyWith(_$ResultScreenParamsImpl value,
          $Res Function(_$ResultScreenParamsImpl) then) =
      __$$ResultScreenParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String keyword, String fileUrl, String image, SavedSearch? savedSearch});

  @override
  $SavedSearchCopyWith<$Res>? get savedSearch;
}

/// @nodoc
class __$$ResultScreenParamsImplCopyWithImpl<$Res>
    extends _$ResultScreenParamsCopyWithImpl<$Res, _$ResultScreenParamsImpl>
    implements _$$ResultScreenParamsImplCopyWith<$Res> {
  __$$ResultScreenParamsImplCopyWithImpl(_$ResultScreenParamsImpl _value,
      $Res Function(_$ResultScreenParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResultScreenParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? fileUrl = null,
    Object? image = null,
    Object? savedSearch = freezed,
  }) {
    return _then(_$ResultScreenParamsImpl(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$ResultScreenParamsImpl implements _ResultScreenParams {
  const _$ResultScreenParamsImpl(
      {required this.keyword,
      required this.fileUrl,
      required this.image,
      this.savedSearch = null});

  @override
  final String keyword;
  @override
  final String fileUrl;
  @override
  final String image;
  @override
  @JsonKey()
  final SavedSearch? savedSearch;

  @override
  String toString() {
    return 'ResultScreenParams(keyword: $keyword, fileUrl: $fileUrl, image: $image, savedSearch: $savedSearch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultScreenParamsImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.savedSearch, savedSearch) ||
                other.savedSearch == savedSearch));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, keyword, fileUrl, image, savedSearch);

  /// Create a copy of ResultScreenParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultScreenParamsImplCopyWith<_$ResultScreenParamsImpl> get copyWith =>
      __$$ResultScreenParamsImplCopyWithImpl<_$ResultScreenParamsImpl>(
          this, _$identity);
}

abstract class _ResultScreenParams implements ResultScreenParams {
  const factory _ResultScreenParams(
      {required final String keyword,
      required final String fileUrl,
      required final String image,
      final SavedSearch? savedSearch}) = _$ResultScreenParamsImpl;

  @override
  String get keyword;
  @override
  String get fileUrl;
  @override
  String get image;
  @override
  SavedSearch? get savedSearch;

  /// Create a copy of ResultScreenParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultScreenParamsImplCopyWith<_$ResultScreenParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
