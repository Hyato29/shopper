// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavedSearch _$SavedSearchFromJson(Map<String, dynamic> json) {
  return _SavedSearch.fromJson(json);
}

/// @nodoc
mixin _$SavedSearch {
  String get image => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;
  List<ShoppingResult> get data => throw _privateConstructorUsedError;
  @TryParseDateTime()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this SavedSearch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedSearch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedSearchCopyWith<SavedSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedSearchCopyWith<$Res> {
  factory $SavedSearchCopyWith(
          SavedSearch value, $Res Function(SavedSearch) then) =
      _$SavedSearchCopyWithImpl<$Res, SavedSearch>;
  @useResult
  $Res call(
      {String image,
      String keyword,
      List<ShoppingResult> data,
      @TryParseDateTime() DateTime? createdAt});
}

/// @nodoc
class _$SavedSearchCopyWithImpl<$Res, $Val extends SavedSearch>
    implements $SavedSearchCopyWith<$Res> {
  _$SavedSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedSearch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? keyword = null,
    Object? data = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ShoppingResult>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedSearchImplCopyWith<$Res>
    implements $SavedSearchCopyWith<$Res> {
  factory _$$SavedSearchImplCopyWith(
          _$SavedSearchImpl value, $Res Function(_$SavedSearchImpl) then) =
      __$$SavedSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String image,
      String keyword,
      List<ShoppingResult> data,
      @TryParseDateTime() DateTime? createdAt});
}

/// @nodoc
class __$$SavedSearchImplCopyWithImpl<$Res>
    extends _$SavedSearchCopyWithImpl<$Res, _$SavedSearchImpl>
    implements _$$SavedSearchImplCopyWith<$Res> {
  __$$SavedSearchImplCopyWithImpl(
      _$SavedSearchImpl _value, $Res Function(_$SavedSearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavedSearch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? keyword = null,
    Object? data = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$SavedSearchImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ShoppingResult>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedSearchImpl implements _SavedSearch {
  const _$SavedSearchImpl(
      {required this.image,
      required this.keyword,
      required final List<ShoppingResult> data,
      @TryParseDateTime() this.createdAt})
      : _data = data;

  factory _$SavedSearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedSearchImplFromJson(json);

  @override
  final String image;
  @override
  final String keyword;
  final List<ShoppingResult> _data;
  @override
  List<ShoppingResult> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @TryParseDateTime()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'SavedSearch(image: $image, keyword: $keyword, data: $data, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedSearchImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, image, keyword,
      const DeepCollectionEquality().hash(_data), createdAt);

  /// Create a copy of SavedSearch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedSearchImplCopyWith<_$SavedSearchImpl> get copyWith =>
      __$$SavedSearchImplCopyWithImpl<_$SavedSearchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedSearchImplToJson(
      this,
    );
  }
}

abstract class _SavedSearch implements SavedSearch {
  const factory _SavedSearch(
      {required final String image,
      required final String keyword,
      required final List<ShoppingResult> data,
      @TryParseDateTime() final DateTime? createdAt}) = _$SavedSearchImpl;

  factory _SavedSearch.fromJson(Map<String, dynamic> json) =
      _$SavedSearchImpl.fromJson;

  @override
  String get image;
  @override
  String get keyword;
  @override
  List<ShoppingResult> get data;
  @override
  @TryParseDateTime()
  DateTime? get createdAt;

  /// Create a copy of SavedSearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedSearchImplCopyWith<_$SavedSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
