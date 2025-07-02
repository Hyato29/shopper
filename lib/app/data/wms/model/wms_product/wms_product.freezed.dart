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

WmsProductScanResponse _$WmsProductScanResponseFromJson(
    Map<String, dynamic> json) {
  return _WmsProductScanResponse.fromJson(json);
}

/// @nodoc
mixin _$WmsProductScanResponse {
  WmsProductScanData get data => throw _privateConstructorUsedError;

  /// Serializes this WmsProductScanResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsProductScanResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsProductScanResponseCopyWith<WmsProductScanResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsProductScanResponseCopyWith<$Res> {
  factory $WmsProductScanResponseCopyWith(WmsProductScanResponse value,
          $Res Function(WmsProductScanResponse) then) =
      _$WmsProductScanResponseCopyWithImpl<$Res, WmsProductScanResponse>;
  @useResult
  $Res call({WmsProductScanData data});

  $WmsProductScanDataCopyWith<$Res> get data;
}

/// @nodoc
class _$WmsProductScanResponseCopyWithImpl<$Res,
        $Val extends WmsProductScanResponse>
    implements $WmsProductScanResponseCopyWith<$Res> {
  _$WmsProductScanResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsProductScanResponse
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
              as WmsProductScanData,
    ) as $Val);
  }

  /// Create a copy of WmsProductScanResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WmsProductScanDataCopyWith<$Res> get data {
    return $WmsProductScanDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WmsProductScanResponseImplCopyWith<$Res>
    implements $WmsProductScanResponseCopyWith<$Res> {
  factory _$$WmsProductScanResponseImplCopyWith(
          _$WmsProductScanResponseImpl value,
          $Res Function(_$WmsProductScanResponseImpl) then) =
      __$$WmsProductScanResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WmsProductScanData data});

  @override
  $WmsProductScanDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$WmsProductScanResponseImplCopyWithImpl<$Res>
    extends _$WmsProductScanResponseCopyWithImpl<$Res,
        _$WmsProductScanResponseImpl>
    implements _$$WmsProductScanResponseImplCopyWith<$Res> {
  __$$WmsProductScanResponseImplCopyWithImpl(
      _$WmsProductScanResponseImpl _value,
      $Res Function(_$WmsProductScanResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsProductScanResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$WmsProductScanResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as WmsProductScanData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WmsProductScanResponseImpl implements _WmsProductScanResponse {
  const _$WmsProductScanResponseImpl({required this.data});

  factory _$WmsProductScanResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsProductScanResponseImplFromJson(json);

  @override
  final WmsProductScanData data;

  @override
  String toString() {
    return 'WmsProductScanResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsProductScanResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of WmsProductScanResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsProductScanResponseImplCopyWith<_$WmsProductScanResponseImpl>
      get copyWith => __$$WmsProductScanResponseImplCopyWithImpl<
          _$WmsProductScanResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsProductScanResponseImplToJson(
      this,
    );
  }
}

abstract class _WmsProductScanResponse implements WmsProductScanResponse {
  const factory _WmsProductScanResponse(
      {required final WmsProductScanData data}) = _$WmsProductScanResponseImpl;

  factory _WmsProductScanResponse.fromJson(Map<String, dynamic> json) =
      _$WmsProductScanResponseImpl.fromJson;

  @override
  WmsProductScanData get data;

  /// Create a copy of WmsProductScanResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsProductScanResponseImplCopyWith<_$WmsProductScanResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WmsProductScanData _$WmsProductScanDataFromJson(Map<String, dynamic> json) {
  return _WmsProductScanData.fromJson(json);
}

/// @nodoc
mixin _$WmsProductScanData {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  WmsProductScanResource get resource => throw _privateConstructorUsedError;

  /// Serializes this WmsProductScanData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsProductScanData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsProductScanDataCopyWith<WmsProductScanData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsProductScanDataCopyWith<$Res> {
  factory $WmsProductScanDataCopyWith(
          WmsProductScanData value, $Res Function(WmsProductScanData) then) =
      _$WmsProductScanDataCopyWithImpl<$Res, WmsProductScanData>;
  @useResult
  $Res call({bool status, String message, WmsProductScanResource resource});

  $WmsProductScanResourceCopyWith<$Res> get resource;
}

/// @nodoc
class _$WmsProductScanDataCopyWithImpl<$Res, $Val extends WmsProductScanData>
    implements $WmsProductScanDataCopyWith<$Res> {
  _$WmsProductScanDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsProductScanData
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
              as WmsProductScanResource,
    ) as $Val);
  }

  /// Create a copy of WmsProductScanData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WmsProductScanResourceCopyWith<$Res> get resource {
    return $WmsProductScanResourceCopyWith<$Res>(_value.resource, (value) {
      return _then(_value.copyWith(resource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WmsProductScanDataImplCopyWith<$Res>
    implements $WmsProductScanDataCopyWith<$Res> {
  factory _$$WmsProductScanDataImplCopyWith(_$WmsProductScanDataImpl value,
          $Res Function(_$WmsProductScanDataImpl) then) =
      __$$WmsProductScanDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, WmsProductScanResource resource});

  @override
  $WmsProductScanResourceCopyWith<$Res> get resource;
}

/// @nodoc
class __$$WmsProductScanDataImplCopyWithImpl<$Res>
    extends _$WmsProductScanDataCopyWithImpl<$Res, _$WmsProductScanDataImpl>
    implements _$$WmsProductScanDataImplCopyWith<$Res> {
  __$$WmsProductScanDataImplCopyWithImpl(_$WmsProductScanDataImpl _value,
      $Res Function(_$WmsProductScanDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsProductScanData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? resource = null,
  }) {
    return _then(_$WmsProductScanDataImpl(
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
              as WmsProductScanResource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WmsProductScanDataImpl implements _WmsProductScanData {
  const _$WmsProductScanDataImpl(
      {required this.status, required this.message, required this.resource});

  factory _$WmsProductScanDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsProductScanDataImplFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final WmsProductScanResource resource;

  @override
  String toString() {
    return 'WmsProductScanData(status: $status, message: $message, resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsProductScanDataImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, resource);

  /// Create a copy of WmsProductScanData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsProductScanDataImplCopyWith<_$WmsProductScanDataImpl> get copyWith =>
      __$$WmsProductScanDataImplCopyWithImpl<_$WmsProductScanDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsProductScanDataImplToJson(
      this,
    );
  }
}

abstract class _WmsProductScanData implements WmsProductScanData {
  const factory _WmsProductScanData(
          {required final bool status,
          required final String message,
          required final WmsProductScanResource resource}) =
      _$WmsProductScanDataImpl;

  factory _WmsProductScanData.fromJson(Map<String, dynamic> json) =
      _$WmsProductScanDataImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  WmsProductScanResource get resource;

  /// Create a copy of WmsProductScanData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsProductScanDataImplCopyWith<_$WmsProductScanDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WmsProductScanResource _$WmsProductScanResourceFromJson(
    Map<String, dynamic> json) {
  return _WmsProductScanResource.fromJson(json);
}

/// @nodoc
mixin _$WmsProductScanResource {
  int get currentPage => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<WmsProduct> get data => throw _privateConstructorUsedError;

  /// Serializes this WmsProductScanResource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsProductScanResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsProductScanResourceCopyWith<WmsProductScanResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsProductScanResourceCopyWith<$Res> {
  factory $WmsProductScanResourceCopyWith(WmsProductScanResource value,
          $Res Function(WmsProductScanResource) then) =
      _$WmsProductScanResourceCopyWithImpl<$Res, WmsProductScanResource>;
  @useResult
  $Res call({int currentPage, int lastPage, int total, List<WmsProduct> data});
}

/// @nodoc
class _$WmsProductScanResourceCopyWithImpl<$Res,
        $Val extends WmsProductScanResource>
    implements $WmsProductScanResourceCopyWith<$Res> {
  _$WmsProductScanResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsProductScanResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? total = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WmsProduct>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WmsProductScanResourceImplCopyWith<$Res>
    implements $WmsProductScanResourceCopyWith<$Res> {
  factory _$$WmsProductScanResourceImplCopyWith(
          _$WmsProductScanResourceImpl value,
          $Res Function(_$WmsProductScanResourceImpl) then) =
      __$$WmsProductScanResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPage, int lastPage, int total, List<WmsProduct> data});
}

/// @nodoc
class __$$WmsProductScanResourceImplCopyWithImpl<$Res>
    extends _$WmsProductScanResourceCopyWithImpl<$Res,
        _$WmsProductScanResourceImpl>
    implements _$$WmsProductScanResourceImplCopyWith<$Res> {
  __$$WmsProductScanResourceImplCopyWithImpl(
      _$WmsProductScanResourceImpl _value,
      $Res Function(_$WmsProductScanResourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsProductScanResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? total = null,
    Object? data = null,
  }) {
    return _then(_$WmsProductScanResourceImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WmsProduct>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WmsProductScanResourceImpl implements _WmsProductScanResource {
  const _$WmsProductScanResourceImpl(
      {required this.currentPage,
      required this.lastPage,
      required this.total,
      final List<WmsProduct> data = const []})
      : _data = data;

  factory _$WmsProductScanResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsProductScanResourceImplFromJson(json);

  @override
  final int currentPage;
  @override
  final int lastPage;
  @override
  final int total;
  final List<WmsProduct> _data;
  @override
  @JsonKey()
  List<WmsProduct> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'WmsProductScanResource(currentPage: $currentPage, lastPage: $lastPage, total: $total, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsProductScanResourceImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, lastPage, total,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of WmsProductScanResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsProductScanResourceImplCopyWith<_$WmsProductScanResourceImpl>
      get copyWith => __$$WmsProductScanResourceImplCopyWithImpl<
          _$WmsProductScanResourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsProductScanResourceImplToJson(
      this,
    );
  }
}

abstract class _WmsProductScanResource implements WmsProductScanResource {
  const factory _WmsProductScanResource(
      {required final int currentPage,
      required final int lastPage,
      required final int total,
      final List<WmsProduct> data}) = _$WmsProductScanResourceImpl;

  factory _WmsProductScanResource.fromJson(Map<String, dynamic> json) =
      _$WmsProductScanResourceImpl.fromJson;

  @override
  int get currentPage;
  @override
  int get lastPage;
  @override
  int get total;
  @override
  List<WmsProduct> get data;

  /// Create a copy of WmsProductScanResource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsProductScanResourceImplCopyWith<_$WmsProductScanResourceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WmsProduct _$WmsProductFromJson(Map<String, dynamic> json) {
  return _WmsProduct.fromJson(json);
}

/// @nodoc
mixin _$WmsProduct {
  int get id => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get productPrice => throw _privateConstructorUsedError;
  String? get image =>
      throw _privateConstructorUsedError; // Ini bisa berupa URL lengkap atau null
  String? get imageUrl =>
      throw _privateConstructorUsedError; // Ini path storage
  String get createdAt => throw _privateConstructorUsedError;
  WmsUser? get user => throw _privateConstructorUsedError;

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
      String productName,
      String productPrice,
      String? image,
      String? imageUrl,
      String createdAt,
      WmsUser? user});

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
    Object? productName = null,
    Object? productPrice = null,
    Object? image = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as WmsUser?,
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
      String productName,
      String productPrice,
      String? image,
      String? imageUrl,
      String createdAt,
      WmsUser? user});

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
    Object? productName = null,
    Object? productPrice = null,
    Object? image = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = null,
    Object? user = freezed,
  }) {
    return _then(_$WmsProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as WmsUser?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WmsProductImpl implements _WmsProduct {
  const _$WmsProductImpl(
      {required this.id,
      required this.productName,
      required this.productPrice,
      this.image,
      this.imageUrl,
      required this.createdAt,
      this.user});

  factory _$WmsProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsProductImplFromJson(json);

  @override
  final int id;
  @override
  final String productName;
  @override
  final String productPrice;
  @override
  final String? image;
// Ini bisa berupa URL lengkap atau null
  @override
  final String? imageUrl;
// Ini path storage
  @override
  final String createdAt;
  @override
  final WmsUser? user;

  @override
  String toString() {
    return 'WmsProduct(id: $id, productName: $productName, productPrice: $productPrice, image: $image, imageUrl: $imageUrl, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productName, productPrice,
      image, imageUrl, createdAt, user);

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
      {required final int id,
      required final String productName,
      required final String productPrice,
      final String? image,
      final String? imageUrl,
      required final String createdAt,
      final WmsUser? user}) = _$WmsProductImpl;

  factory _WmsProduct.fromJson(Map<String, dynamic> json) =
      _$WmsProductImpl.fromJson;

  @override
  int get id;
  @override
  String get productName;
  @override
  String get productPrice;
  @override
  String? get image; // Ini bisa berupa URL lengkap atau null
  @override
  String? get imageUrl; // Ini path storage
  @override
  String get createdAt;
  @override
  WmsUser? get user;

  /// Create a copy of WmsProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsProductImplCopyWith<_$WmsProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
