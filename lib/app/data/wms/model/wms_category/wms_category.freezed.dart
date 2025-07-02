// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wms_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WmsCategoryResponse _$WmsCategoryResponseFromJson(Map<String, dynamic> json) {
  return _WmsCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$WmsCategoryResponse {
  WmsCategoryData get data => throw _privateConstructorUsedError;

  /// Serializes this WmsCategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsCategoryResponseCopyWith<WmsCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsCategoryResponseCopyWith<$Res> {
  factory $WmsCategoryResponseCopyWith(
          WmsCategoryResponse value, $Res Function(WmsCategoryResponse) then) =
      _$WmsCategoryResponseCopyWithImpl<$Res, WmsCategoryResponse>;
  @useResult
  $Res call({WmsCategoryData data});

  $WmsCategoryDataCopyWith<$Res> get data;
}

/// @nodoc
class _$WmsCategoryResponseCopyWithImpl<$Res, $Val extends WmsCategoryResponse>
    implements $WmsCategoryResponseCopyWith<$Res> {
  _$WmsCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsCategoryResponse
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
              as WmsCategoryData,
    ) as $Val);
  }

  /// Create a copy of WmsCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WmsCategoryDataCopyWith<$Res> get data {
    return $WmsCategoryDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WmsCategoryResponseImplCopyWith<$Res>
    implements $WmsCategoryResponseCopyWith<$Res> {
  factory _$$WmsCategoryResponseImplCopyWith(_$WmsCategoryResponseImpl value,
          $Res Function(_$WmsCategoryResponseImpl) then) =
      __$$WmsCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WmsCategoryData data});

  @override
  $WmsCategoryDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$WmsCategoryResponseImplCopyWithImpl<$Res>
    extends _$WmsCategoryResponseCopyWithImpl<$Res, _$WmsCategoryResponseImpl>
    implements _$$WmsCategoryResponseImplCopyWith<$Res> {
  __$$WmsCategoryResponseImplCopyWithImpl(_$WmsCategoryResponseImpl _value,
      $Res Function(_$WmsCategoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$WmsCategoryResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as WmsCategoryData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WmsCategoryResponseImpl implements _WmsCategoryResponse {
  const _$WmsCategoryResponseImpl({required this.data});

  factory _$WmsCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsCategoryResponseImplFromJson(json);

  @override
  final WmsCategoryData data;

  @override
  String toString() {
    return 'WmsCategoryResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsCategoryResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of WmsCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsCategoryResponseImplCopyWith<_$WmsCategoryResponseImpl> get copyWith =>
      __$$WmsCategoryResponseImplCopyWithImpl<_$WmsCategoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _WmsCategoryResponse implements WmsCategoryResponse {
  const factory _WmsCategoryResponse({required final WmsCategoryData data}) =
      _$WmsCategoryResponseImpl;

  factory _WmsCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$WmsCategoryResponseImpl.fromJson;

  @override
  WmsCategoryData get data;

  /// Create a copy of WmsCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsCategoryResponseImplCopyWith<_$WmsCategoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WmsCategoryData _$WmsCategoryDataFromJson(Map<String, dynamic> json) {
  return _WmsCategoryData.fromJson(json);
}

/// @nodoc
mixin _$WmsCategoryData {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Category> get resource => throw _privateConstructorUsedError;

  /// Serializes this WmsCategoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsCategoryDataCopyWith<WmsCategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsCategoryDataCopyWith<$Res> {
  factory $WmsCategoryDataCopyWith(
          WmsCategoryData value, $Res Function(WmsCategoryData) then) =
      _$WmsCategoryDataCopyWithImpl<$Res, WmsCategoryData>;
  @useResult
  $Res call({bool status, String message, List<Category> resource});
}

/// @nodoc
class _$WmsCategoryDataCopyWithImpl<$Res, $Val extends WmsCategoryData>
    implements $WmsCategoryDataCopyWith<$Res> {
  _$WmsCategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsCategoryData
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
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WmsCategoryDataImplCopyWith<$Res>
    implements $WmsCategoryDataCopyWith<$Res> {
  factory _$$WmsCategoryDataImplCopyWith(_$WmsCategoryDataImpl value,
          $Res Function(_$WmsCategoryDataImpl) then) =
      __$$WmsCategoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, List<Category> resource});
}

/// @nodoc
class __$$WmsCategoryDataImplCopyWithImpl<$Res>
    extends _$WmsCategoryDataCopyWithImpl<$Res, _$WmsCategoryDataImpl>
    implements _$$WmsCategoryDataImplCopyWith<$Res> {
  __$$WmsCategoryDataImplCopyWithImpl(
      _$WmsCategoryDataImpl _value, $Res Function(_$WmsCategoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? resource = null,
  }) {
    return _then(_$WmsCategoryDataImpl(
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
              as List<Category>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WmsCategoryDataImpl implements _WmsCategoryData {
  const _$WmsCategoryDataImpl(
      {required this.status,
      required this.message,
      required final List<Category> resource})
      : _resource = resource;

  factory _$WmsCategoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsCategoryDataImplFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  final List<Category> _resource;
  @override
  List<Category> get resource {
    if (_resource is EqualUnmodifiableListView) return _resource;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resource);
  }

  @override
  String toString() {
    return 'WmsCategoryData(status: $status, message: $message, resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsCategoryDataImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._resource, _resource));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message,
      const DeepCollectionEquality().hash(_resource));

  /// Create a copy of WmsCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsCategoryDataImplCopyWith<_$WmsCategoryDataImpl> get copyWith =>
      __$$WmsCategoryDataImplCopyWithImpl<_$WmsCategoryDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsCategoryDataImplToJson(
      this,
    );
  }
}

abstract class _WmsCategoryData implements WmsCategoryData {
  const factory _WmsCategoryData(
      {required final bool status,
      required final String message,
      required final List<Category> resource}) = _$WmsCategoryDataImpl;

  factory _WmsCategoryData.fromJson(Map<String, dynamic> json) =
      _$WmsCategoryDataImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  List<Category> get resource;

  /// Create a copy of WmsCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsCategoryDataImplCopyWith<_$WmsCategoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_category')
  String get name => throw _privateConstructorUsedError;
  int? get discountCategory => throw _privateConstructorUsedError;
  String? get maxPriceCategory => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name_category') String name,
      int? discountCategory,
      String? maxPriceCategory});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? discountCategory = freezed,
    Object? maxPriceCategory = freezed,
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
      discountCategory: freezed == discountCategory
          ? _value.discountCategory
          : discountCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      maxPriceCategory: freezed == maxPriceCategory
          ? _value.maxPriceCategory
          : maxPriceCategory // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name_category') String name,
      int? discountCategory,
      String? maxPriceCategory});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? discountCategory = freezed,
    Object? maxPriceCategory = freezed,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      discountCategory: freezed == discountCategory
          ? _value.discountCategory
          : discountCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      maxPriceCategory: freezed == maxPriceCategory
          ? _value.maxPriceCategory
          : maxPriceCategory // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {required this.id,
      @JsonKey(name: 'name_category') required this.name,
      this.discountCategory,
      this.maxPriceCategory});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'name_category')
  final String name;
  @override
  final int? discountCategory;
  @override
  final String? maxPriceCategory;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, discountCategory: $discountCategory, maxPriceCategory: $maxPriceCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.discountCategory, discountCategory) ||
                other.discountCategory == discountCategory) &&
            (identical(other.maxPriceCategory, maxPriceCategory) ||
                other.maxPriceCategory == maxPriceCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, discountCategory, maxPriceCategory);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {required final int id,
      @JsonKey(name: 'name_category') required final String name,
      final int? discountCategory,
      final String? maxPriceCategory}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'name_category')
  String get name;
  @override
  int? get discountCategory;
  @override
  String? get maxPriceCategory;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
