// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wms_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WmsGetProductBasicResponse _$WmsGetProductBasicResponseFromJson(
    Map<String, dynamic> json) {
  return _WmsGetProductBasicResponse.fromJson(json);
}

/// @nodoc
mixin _$WmsGetProductBasicResponse {
  WmsGetProductResponse get data => throw _privateConstructorUsedError;

  /// Serializes this WmsGetProductBasicResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsGetProductBasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsGetProductBasicResponseCopyWith<WmsGetProductBasicResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsGetProductBasicResponseCopyWith<$Res> {
  factory $WmsGetProductBasicResponseCopyWith(WmsGetProductBasicResponse value,
          $Res Function(WmsGetProductBasicResponse) then) =
      _$WmsGetProductBasicResponseCopyWithImpl<$Res,
          WmsGetProductBasicResponse>;
  @useResult
  $Res call({WmsGetProductResponse data});

  $WmsGetProductResponseCopyWith<$Res> get data;
}

/// @nodoc
class _$WmsGetProductBasicResponseCopyWithImpl<$Res,
        $Val extends WmsGetProductBasicResponse>
    implements $WmsGetProductBasicResponseCopyWith<$Res> {
  _$WmsGetProductBasicResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsGetProductBasicResponse
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
              as WmsGetProductResponse,
    ) as $Val);
  }

  /// Create a copy of WmsGetProductBasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WmsGetProductResponseCopyWith<$Res> get data {
    return $WmsGetProductResponseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WmsGetProductBasicResponseImplCopyWith<$Res>
    implements $WmsGetProductBasicResponseCopyWith<$Res> {
  factory _$$WmsGetProductBasicResponseImplCopyWith(
          _$WmsGetProductBasicResponseImpl value,
          $Res Function(_$WmsGetProductBasicResponseImpl) then) =
      __$$WmsGetProductBasicResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WmsGetProductResponse data});

  @override
  $WmsGetProductResponseCopyWith<$Res> get data;
}

/// @nodoc
class __$$WmsGetProductBasicResponseImplCopyWithImpl<$Res>
    extends _$WmsGetProductBasicResponseCopyWithImpl<$Res,
        _$WmsGetProductBasicResponseImpl>
    implements _$$WmsGetProductBasicResponseImplCopyWith<$Res> {
  __$$WmsGetProductBasicResponseImplCopyWithImpl(
      _$WmsGetProductBasicResponseImpl _value,
      $Res Function(_$WmsGetProductBasicResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsGetProductBasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$WmsGetProductBasicResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as WmsGetProductResponse,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WmsGetProductBasicResponseImpl implements _WmsGetProductBasicResponse {
  const _$WmsGetProductBasicResponseImpl({required this.data});

  factory _$WmsGetProductBasicResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$WmsGetProductBasicResponseImplFromJson(json);

  @override
  final WmsGetProductResponse data;

  @override
  String toString() {
    return 'WmsGetProductBasicResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsGetProductBasicResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of WmsGetProductBasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsGetProductBasicResponseImplCopyWith<_$WmsGetProductBasicResponseImpl>
      get copyWith => __$$WmsGetProductBasicResponseImplCopyWithImpl<
          _$WmsGetProductBasicResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsGetProductBasicResponseImplToJson(
      this,
    );
  }
}

abstract class _WmsGetProductBasicResponse
    implements WmsGetProductBasicResponse {
  const factory _WmsGetProductBasicResponse(
          {required final WmsGetProductResponse data}) =
      _$WmsGetProductBasicResponseImpl;

  factory _WmsGetProductBasicResponse.fromJson(Map<String, dynamic> json) =
      _$WmsGetProductBasicResponseImpl.fromJson;

  @override
  WmsGetProductResponse get data;

  /// Create a copy of WmsGetProductBasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsGetProductBasicResponseImplCopyWith<_$WmsGetProductBasicResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WmsGetProductResponse _$WmsGetProductResponseFromJson(
    Map<String, dynamic> json) {
  return _WmsGetProductResponse.fromJson(json);
}

/// @nodoc
mixin _$WmsGetProductResponse {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  WmsGetProductResource get resource => throw _privateConstructorUsedError;

  /// Serializes this WmsGetProductResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsGetProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsGetProductResponseCopyWith<WmsGetProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsGetProductResponseCopyWith<$Res> {
  factory $WmsGetProductResponseCopyWith(WmsGetProductResponse value,
          $Res Function(WmsGetProductResponse) then) =
      _$WmsGetProductResponseCopyWithImpl<$Res, WmsGetProductResponse>;
  @useResult
  $Res call({bool status, String message, WmsGetProductResource resource});

  $WmsGetProductResourceCopyWith<$Res> get resource;
}

/// @nodoc
class _$WmsGetProductResponseCopyWithImpl<$Res,
        $Val extends WmsGetProductResponse>
    implements $WmsGetProductResponseCopyWith<$Res> {
  _$WmsGetProductResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsGetProductResponse
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
              as WmsGetProductResource,
    ) as $Val);
  }

  /// Create a copy of WmsGetProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WmsGetProductResourceCopyWith<$Res> get resource {
    return $WmsGetProductResourceCopyWith<$Res>(_value.resource, (value) {
      return _then(_value.copyWith(resource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WmsGetProductResponseImplCopyWith<$Res>
    implements $WmsGetProductResponseCopyWith<$Res> {
  factory _$$WmsGetProductResponseImplCopyWith(
          _$WmsGetProductResponseImpl value,
          $Res Function(_$WmsGetProductResponseImpl) then) =
      __$$WmsGetProductResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, WmsGetProductResource resource});

  @override
  $WmsGetProductResourceCopyWith<$Res> get resource;
}

/// @nodoc
class __$$WmsGetProductResponseImplCopyWithImpl<$Res>
    extends _$WmsGetProductResponseCopyWithImpl<$Res,
        _$WmsGetProductResponseImpl>
    implements _$$WmsGetProductResponseImplCopyWith<$Res> {
  __$$WmsGetProductResponseImplCopyWithImpl(_$WmsGetProductResponseImpl _value,
      $Res Function(_$WmsGetProductResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsGetProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? resource = null,
  }) {
    return _then(_$WmsGetProductResponseImpl(
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
              as WmsGetProductResource,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WmsGetProductResponseImpl implements _WmsGetProductResponse {
  const _$WmsGetProductResponseImpl(
      {this.status = false, this.message = '', required this.resource});

  factory _$WmsGetProductResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsGetProductResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool status;
  @override
  @JsonKey()
  final String message;
  @override
  final WmsGetProductResource resource;

  @override
  String toString() {
    return 'WmsGetProductResponse(status: $status, message: $message, resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsGetProductResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, resource);

  /// Create a copy of WmsGetProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsGetProductResponseImplCopyWith<_$WmsGetProductResponseImpl>
      get copyWith => __$$WmsGetProductResponseImplCopyWithImpl<
          _$WmsGetProductResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsGetProductResponseImplToJson(
      this,
    );
  }
}

abstract class _WmsGetProductResponse implements WmsGetProductResponse {
  const factory _WmsGetProductResponse(
          {final bool status,
          final String message,
          required final WmsGetProductResource resource}) =
      _$WmsGetProductResponseImpl;

  factory _WmsGetProductResponse.fromJson(Map<String, dynamic> json) =
      _$WmsGetProductResponseImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  WmsGetProductResource get resource;

  /// Create a copy of WmsGetProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsGetProductResponseImplCopyWith<_$WmsGetProductResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WmsGetProductResource _$WmsGetProductResourceFromJson(
    Map<String, dynamic> json) {
  return _WmsGetProductResource.fromJson(json);
}

/// @nodoc
mixin _$WmsGetProductResource {
  int get currentPage => throw _privateConstructorUsedError;
  List<WmsProduct> get data => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;
  String? get nextPageUrl => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;

  /// Serializes this WmsGetProductResource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsGetProductResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsGetProductResourceCopyWith<WmsGetProductResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsGetProductResourceCopyWith<$Res> {
  factory $WmsGetProductResourceCopyWith(WmsGetProductResource value,
          $Res Function(WmsGetProductResource) then) =
      _$WmsGetProductResourceCopyWithImpl<$Res, WmsGetProductResource>;
  @useResult
  $Res call(
      {int currentPage,
      List<WmsProduct> data,
      int? from,
      int lastPage,
      String? nextPageUrl,
      int? to});
}

/// @nodoc
class _$WmsGetProductResourceCopyWithImpl<$Res,
        $Val extends WmsGetProductResource>
    implements $WmsGetProductResourceCopyWith<$Res> {
  _$WmsGetProductResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsGetProductResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? data = null,
    Object? from = freezed,
    Object? lastPage = null,
    Object? nextPageUrl = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WmsProduct>,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WmsGetProductResourceImplCopyWith<$Res>
    implements $WmsGetProductResourceCopyWith<$Res> {
  factory _$$WmsGetProductResourceImplCopyWith(
          _$WmsGetProductResourceImpl value,
          $Res Function(_$WmsGetProductResourceImpl) then) =
      __$$WmsGetProductResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPage,
      List<WmsProduct> data,
      int? from,
      int lastPage,
      String? nextPageUrl,
      int? to});
}

/// @nodoc
class __$$WmsGetProductResourceImplCopyWithImpl<$Res>
    extends _$WmsGetProductResourceCopyWithImpl<$Res,
        _$WmsGetProductResourceImpl>
    implements _$$WmsGetProductResourceImplCopyWith<$Res> {
  __$$WmsGetProductResourceImplCopyWithImpl(_$WmsGetProductResourceImpl _value,
      $Res Function(_$WmsGetProductResourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsGetProductResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? data = null,
    Object? from = freezed,
    Object? lastPage = null,
    Object? nextPageUrl = freezed,
    Object? to = freezed,
  }) {
    return _then(_$WmsGetProductResourceImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WmsProduct>,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WmsGetProductResourceImpl implements _WmsGetProductResource {
  const _$WmsGetProductResourceImpl(
      {this.currentPage = 0,
      final List<WmsProduct> data = const [],
      this.from = null,
      this.lastPage = 0,
      this.nextPageUrl = null,
      this.to = null})
      : _data = data;

  factory _$WmsGetProductResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsGetProductResourceImplFromJson(json);

  @override
  @JsonKey()
  final int currentPage;
  final List<WmsProduct> _data;
  @override
  @JsonKey()
  List<WmsProduct> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final int? from;
  @override
  @JsonKey()
  final int lastPage;
  @override
  @JsonKey()
  final String? nextPageUrl;
  @override
  @JsonKey()
  final int? to;

  @override
  String toString() {
    return 'WmsGetProductResource(currentPage: $currentPage, data: $data, from: $from, lastPage: $lastPage, nextPageUrl: $nextPageUrl, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsGetProductResourceImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                other.nextPageUrl == nextPageUrl) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      const DeepCollectionEquality().hash(_data),
      from,
      lastPage,
      nextPageUrl,
      to);

  /// Create a copy of WmsGetProductResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsGetProductResourceImplCopyWith<_$WmsGetProductResourceImpl>
      get copyWith => __$$WmsGetProductResourceImplCopyWithImpl<
          _$WmsGetProductResourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsGetProductResourceImplToJson(
      this,
    );
  }
}

abstract class _WmsGetProductResource implements WmsGetProductResource {
  const factory _WmsGetProductResource(
      {final int currentPage,
      final List<WmsProduct> data,
      final int? from,
      final int lastPage,
      final String? nextPageUrl,
      final int? to}) = _$WmsGetProductResourceImpl;

  factory _WmsGetProductResource.fromJson(Map<String, dynamic> json) =
      _$WmsGetProductResourceImpl.fromJson;

  @override
  int get currentPage;
  @override
  List<WmsProduct> get data;
  @override
  int? get from;
  @override
  int get lastPage;
  @override
  String? get nextPageUrl;
  @override
  int? get to;

  /// Create a copy of WmsGetProductResource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsGetProductResourceImplCopyWith<_$WmsGetProductResourceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WmsProduct _$WmsProductFromJson(Map<String, dynamic> json) {
  return _WmsProduct.fromJson(json);
}

/// @nodoc
mixin _$WmsProduct {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get productPrice => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  WmsUser? get user => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this WmsProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsProductCopyWith<WmsProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsProductCopyWith<$Res> {
  factory $WmsProductCopyWith(
          WmsProduct value, $Res Function(WmsProduct) then) =
      _$WmsProductCopyWithImpl<$Res, WmsProduct>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String productName,
      String productPrice,
      String createdAt,
      String updatedAt,
      String? image,
      WmsUser? user,
      String? status});

  $WmsUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$WmsProductCopyWithImpl<$Res, $Val extends WmsProduct>
    implements $WmsProductCopyWith<$Res> {
  _$WmsProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? productName = null,
    Object? productPrice = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? image = freezed,
    Object? user = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as WmsUser?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of WmsProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WmsUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $WmsUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WmsProductImplCopyWith<$Res>
    implements $WmsProductCopyWith<$Res> {
  factory _$$WmsProductImplCopyWith(
          _$WmsProductImpl value, $Res Function(_$WmsProductImpl) then) =
      __$$WmsProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String productName,
      String productPrice,
      String createdAt,
      String updatedAt,
      String? image,
      WmsUser? user,
      String? status});

  @override
  $WmsUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$WmsProductImplCopyWithImpl<$Res>
    extends _$WmsProductCopyWithImpl<$Res, _$WmsProductImpl>
    implements _$$WmsProductImplCopyWith<$Res> {
  __$$WmsProductImplCopyWithImpl(
      _$WmsProductImpl _value, $Res Function(_$WmsProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? productName = null,
    Object? productPrice = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? image = freezed,
    Object? user = freezed,
    Object? status = freezed,
  }) {
    return _then(_$WmsProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as WmsUser?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WmsProductImpl implements _WmsProduct {
  const _$WmsProductImpl(
      {this.id = 0,
      this.userId = 0,
      this.productName = '',
      this.productPrice = '',
      this.createdAt = '',
      this.updatedAt = '',
      this.image,
      this.user,
      this.status});

  factory _$WmsProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsProductImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int userId;
  @override
  @JsonKey()
  final String productName;
  @override
  @JsonKey()
  final String productPrice;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String updatedAt;
  @override
  final String? image;
  @override
  final WmsUser? user;
  @override
  final String? status;

  @override
  String toString() {
    return 'WmsProduct(id: $id, userId: $userId, productName: $productName, productPrice: $productPrice, createdAt: $createdAt, updatedAt: $updatedAt, image: $image, user: $user, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, productName,
      productPrice, createdAt, updatedAt, image, user, status);

  /// Create a copy of WmsProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsProductImplCopyWith<_$WmsProductImpl> get copyWith =>
      __$$WmsProductImplCopyWithImpl<_$WmsProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsProductImplToJson(
      this,
    );
  }
}

abstract class _WmsProduct implements WmsProduct {
  const factory _WmsProduct(
      {final int id,
      final int userId,
      final String productName,
      final String productPrice,
      final String createdAt,
      final String updatedAt,
      final String? image,
      final WmsUser? user,
      final String? status}) = _$WmsProductImpl;

  factory _WmsProduct.fromJson(Map<String, dynamic> json) =
      _$WmsProductImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get productName;
  @override
  String get productPrice;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String? get image;
  @override
  WmsUser? get user;
  @override
  String? get status;

  /// Create a copy of WmsProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsProductImplCopyWith<_$WmsProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
