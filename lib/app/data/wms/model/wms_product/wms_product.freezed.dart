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

ProductScanApiResponse _$ProductScanApiResponseFromJson(
    Map<String, dynamic> json) {
  return _ProductScanApiResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductScanApiResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  PaginationData get pagination => throw _privateConstructorUsedError;
  List<WmsProduct> get data => throw _privateConstructorUsedError;

  /// Serializes this ProductScanApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductScanApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductScanApiResponseCopyWith<ProductScanApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductScanApiResponseCopyWith<$Res> {
  factory $ProductScanApiResponseCopyWith(ProductScanApiResponse value,
          $Res Function(ProductScanApiResponse) then) =
      _$ProductScanApiResponseCopyWithImpl<$Res, ProductScanApiResponse>;
  @useResult
  $Res call(
      {bool success,
      String message,
      PaginationData pagination,
      List<WmsProduct> data});

  $PaginationDataCopyWith<$Res> get pagination;
}

/// @nodoc
class _$ProductScanApiResponseCopyWithImpl<$Res,
        $Val extends ProductScanApiResponse>
    implements $ProductScanApiResponseCopyWith<$Res> {
  _$ProductScanApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductScanApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? pagination = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WmsProduct>,
    ) as $Val);
  }

  /// Create a copy of ProductScanApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationDataCopyWith<$Res> get pagination {
    return $PaginationDataCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductScanApiResponseImplCopyWith<$Res>
    implements $ProductScanApiResponseCopyWith<$Res> {
  factory _$$ProductScanApiResponseImplCopyWith(
          _$ProductScanApiResponseImpl value,
          $Res Function(_$ProductScanApiResponseImpl) then) =
      __$$ProductScanApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String message,
      PaginationData pagination,
      List<WmsProduct> data});

  @override
  $PaginationDataCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$ProductScanApiResponseImplCopyWithImpl<$Res>
    extends _$ProductScanApiResponseCopyWithImpl<$Res,
        _$ProductScanApiResponseImpl>
    implements _$$ProductScanApiResponseImplCopyWith<$Res> {
  __$$ProductScanApiResponseImplCopyWithImpl(
      _$ProductScanApiResponseImpl _value,
      $Res Function(_$ProductScanApiResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductScanApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? pagination = null,
    Object? data = null,
  }) {
    return _then(_$ProductScanApiResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WmsProduct>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductScanApiResponseImpl implements _ProductScanApiResponse {
  const _$ProductScanApiResponseImpl(
      {this.success = false,
      this.message = '',
      required this.pagination,
      final List<WmsProduct> data = const []})
      : _data = data;

  factory _$ProductScanApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductScanApiResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final PaginationData pagination;
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
    return 'ProductScanApiResponse(success: $success, message: $message, pagination: $pagination, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductScanApiResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, pagination,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of ProductScanApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductScanApiResponseImplCopyWith<_$ProductScanApiResponseImpl>
      get copyWith => __$$ProductScanApiResponseImplCopyWithImpl<
          _$ProductScanApiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductScanApiResponseImplToJson(
      this,
    );
  }
}

abstract class _ProductScanApiResponse implements ProductScanApiResponse {
  const factory _ProductScanApiResponse(
      {final bool success,
      final String message,
      required final PaginationData pagination,
      final List<WmsProduct> data}) = _$ProductScanApiResponseImpl;

  factory _ProductScanApiResponse.fromJson(Map<String, dynamic> json) =
      _$ProductScanApiResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  PaginationData get pagination;
  @override
  List<WmsProduct> get data;

  /// Create a copy of ProductScanApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductScanApiResponseImplCopyWith<_$ProductScanApiResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaginationData _$PaginationDataFromJson(Map<String, dynamic> json) {
  return _PaginationData.fromJson(json);
}

/// @nodoc
mixin _$PaginationData {
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;

  /// Serializes this PaginationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationDataCopyWith<PaginationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationDataCopyWith<$Res> {
  factory $PaginationDataCopyWith(
          PaginationData value, $Res Function(PaginationData) then) =
      _$PaginationDataCopyWithImpl<$Res, PaginationData>;
  @useResult
  $Res call({int currentPage, int totalPages, int totalItems});
}

/// @nodoc
class _$PaginationDataCopyWithImpl<$Res, $Val extends PaginationData>
    implements $PaginationDataCopyWith<$Res> {
  _$PaginationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalItems = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationDataImplCopyWith<$Res>
    implements $PaginationDataCopyWith<$Res> {
  factory _$$PaginationDataImplCopyWith(_$PaginationDataImpl value,
          $Res Function(_$PaginationDataImpl) then) =
      __$$PaginationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPage, int totalPages, int totalItems});
}

/// @nodoc
class __$$PaginationDataImplCopyWithImpl<$Res>
    extends _$PaginationDataCopyWithImpl<$Res, _$PaginationDataImpl>
    implements _$$PaginationDataImplCopyWith<$Res> {
  __$$PaginationDataImplCopyWithImpl(
      _$PaginationDataImpl _value, $Res Function(_$PaginationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalItems = null,
  }) {
    return _then(_$PaginationDataImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationDataImpl implements _PaginationData {
  const _$PaginationDataImpl(
      {required this.currentPage,
      required this.totalPages,
      required this.totalItems});

  factory _$PaginationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationDataImplFromJson(json);

  @override
  final int currentPage;
  @override
  final int totalPages;
  @override
  final int totalItems;

  @override
  String toString() {
    return 'PaginationData(currentPage: $currentPage, totalPages: $totalPages, totalItems: $totalItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationDataImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, totalPages, totalItems);

  /// Create a copy of PaginationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationDataImplCopyWith<_$PaginationDataImpl> get copyWith =>
      __$$PaginationDataImplCopyWithImpl<_$PaginationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationDataImplToJson(
      this,
    );
  }
}

abstract class _PaginationData implements PaginationData {
  const factory _PaginationData(
      {required final int currentPage,
      required final int totalPages,
      required final int totalItems}) = _$PaginationDataImpl;

  factory _PaginationData.fromJson(Map<String, dynamic> json) =
      _$PaginationDataImpl.fromJson;

  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  int get totalItems;

  /// Create a copy of PaginationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationDataImplCopyWith<_$PaginationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WmsProduct _$WmsProductFromJson(Map<String, dynamic> json) {
  return _WmsProduct.fromJson(json);
}

/// @nodoc
mixin _$WmsProduct {
  int get id => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get productPrice => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get fixedPrice => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get scannedAt => throw _privateConstructorUsedError;

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
      int? quantity,
      String? status,
      String? fixedPrice,
      String? imageUrl,
      String scannedAt});
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
    Object? quantity = freezed,
    Object? status = freezed,
    Object? fixedPrice = freezed,
    Object? imageUrl = freezed,
    Object? scannedAt = null,
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
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      fixedPrice: freezed == fixedPrice
          ? _value.fixedPrice
          : fixedPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      scannedAt: null == scannedAt
          ? _value.scannedAt
          : scannedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
      int? quantity,
      String? status,
      String? fixedPrice,
      String? imageUrl,
      String scannedAt});
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
    Object? quantity = freezed,
    Object? status = freezed,
    Object? fixedPrice = freezed,
    Object? imageUrl = freezed,
    Object? scannedAt = null,
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
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      fixedPrice: freezed == fixedPrice
          ? _value.fixedPrice
          : fixedPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      scannedAt: null == scannedAt
          ? _value.scannedAt
          : scannedAt // ignore: cast_nullable_to_non_nullable
              as String,
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
      this.quantity,
      this.status,
      this.fixedPrice,
      this.imageUrl,
      required this.scannedAt});

  factory _$WmsProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsProductImplFromJson(json);

  @override
  final int id;
  @override
  final String productName;
  @override
  final String productPrice;
  @override
  final int? quantity;
  @override
  final String? status;
  @override
  final String? fixedPrice;
  @override
  final String? imageUrl;
  @override
  final String scannedAt;

  @override
  String toString() {
    return 'WmsProduct(id: $id, productName: $productName, productPrice: $productPrice, quantity: $quantity, status: $status, fixedPrice: $fixedPrice, imageUrl: $imageUrl, scannedAt: $scannedAt)';
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
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fixedPrice, fixedPrice) ||
                other.fixedPrice == fixedPrice) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.scannedAt, scannedAt) ||
                other.scannedAt == scannedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productName, productPrice,
      quantity, status, fixedPrice, imageUrl, scannedAt);

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
      final int? quantity,
      final String? status,
      final String? fixedPrice,
      final String? imageUrl,
      required final String scannedAt}) = _$WmsProductImpl;

  factory _WmsProduct.fromJson(Map<String, dynamic> json) =
      _$WmsProductImpl.fromJson;

  @override
  int get id;
  @override
  String get productName;
  @override
  String get productPrice;
  @override
  int? get quantity;
  @override
  String? get status;
  @override
  String? get fixedPrice;
  @override
  String? get imageUrl;
  @override
  String get scannedAt;

  /// Create a copy of WmsProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsProductImplCopyWith<_$WmsProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
