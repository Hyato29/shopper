// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identify_product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IdentifyProductResponse _$IdentifyProductResponseFromJson(
    Map<String, dynamic> json) {
  return _IdentifyProductResponse.fromJson(json);
}

/// @nodoc
mixin _$IdentifyProductResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ProductScanData? get data => throw _privateConstructorUsedError;

  /// Serializes this IdentifyProductResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IdentifyProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IdentifyProductResponseCopyWith<IdentifyProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentifyProductResponseCopyWith<$Res> {
  factory $IdentifyProductResponseCopyWith(IdentifyProductResponse value,
          $Res Function(IdentifyProductResponse) then) =
      _$IdentifyProductResponseCopyWithImpl<$Res, IdentifyProductResponse>;
  @useResult
  $Res call({bool success, String message, ProductScanData? data});

  $ProductScanDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$IdentifyProductResponseCopyWithImpl<$Res,
        $Val extends IdentifyProductResponse>
    implements $IdentifyProductResponseCopyWith<$Res> {
  _$IdentifyProductResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IdentifyProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProductScanData?,
    ) as $Val);
  }

  /// Create a copy of IdentifyProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductScanDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ProductScanDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IdentifyProductResponseImplCopyWith<$Res>
    implements $IdentifyProductResponseCopyWith<$Res> {
  factory _$$IdentifyProductResponseImplCopyWith(
          _$IdentifyProductResponseImpl value,
          $Res Function(_$IdentifyProductResponseImpl) then) =
      __$$IdentifyProductResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, ProductScanData? data});

  @override
  $ProductScanDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$IdentifyProductResponseImplCopyWithImpl<$Res>
    extends _$IdentifyProductResponseCopyWithImpl<$Res,
        _$IdentifyProductResponseImpl>
    implements _$$IdentifyProductResponseImplCopyWith<$Res> {
  __$$IdentifyProductResponseImplCopyWithImpl(
      _$IdentifyProductResponseImpl _value,
      $Res Function(_$IdentifyProductResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of IdentifyProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$IdentifyProductResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProductScanData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$IdentifyProductResponseImpl implements _IdentifyProductResponse {
  const _$IdentifyProductResponseImpl(
      {this.success = false, this.message = '', this.data});

  factory _$IdentifyProductResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentifyProductResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final ProductScanData? data;

  @override
  String toString() {
    return 'IdentifyProductResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentifyProductResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of IdentifyProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentifyProductResponseImplCopyWith<_$IdentifyProductResponseImpl>
      get copyWith => __$$IdentifyProductResponseImplCopyWithImpl<
          _$IdentifyProductResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentifyProductResponseImplToJson(
      this,
    );
  }
}

abstract class _IdentifyProductResponse implements IdentifyProductResponse {
  const factory _IdentifyProductResponse(
      {final bool success,
      final String message,
      final ProductScanData? data}) = _$IdentifyProductResponseImpl;

  factory _IdentifyProductResponse.fromJson(Map<String, dynamic> json) =
      _$IdentifyProductResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  ProductScanData? get data;

  /// Create a copy of IdentifyProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdentifyProductResponseImplCopyWith<_$IdentifyProductResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProductScanData _$ProductScanDataFromJson(Map<String, dynamic> json) {
  return _ProductScanData.fromJson(json);
}

/// @nodoc
mixin _$ProductScanData {
  String get productName => throw _privateConstructorUsedError;
  double get productPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this ProductScanData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductScanData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductScanDataCopyWith<ProductScanData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductScanDataCopyWith<$Res> {
  factory $ProductScanDataCopyWith(
          ProductScanData value, $Res Function(ProductScanData) then) =
      _$ProductScanDataCopyWithImpl<$Res, ProductScanData>;
  @useResult
  $Res call(
      {String productName,
      double productPrice,
      @JsonKey(name: 'imageUrl') String? imageUrl});
}

/// @nodoc
class _$ProductScanDataCopyWithImpl<$Res, $Val extends ProductScanData>
    implements $ProductScanDataCopyWith<$Res> {
  _$ProductScanDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductScanData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? productPrice = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductScanDataImplCopyWith<$Res>
    implements $ProductScanDataCopyWith<$Res> {
  factory _$$ProductScanDataImplCopyWith(_$ProductScanDataImpl value,
          $Res Function(_$ProductScanDataImpl) then) =
      __$$ProductScanDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productName,
      double productPrice,
      @JsonKey(name: 'imageUrl') String? imageUrl});
}

/// @nodoc
class __$$ProductScanDataImplCopyWithImpl<$Res>
    extends _$ProductScanDataCopyWithImpl<$Res, _$ProductScanDataImpl>
    implements _$$ProductScanDataImplCopyWith<$Res> {
  __$$ProductScanDataImplCopyWithImpl(
      _$ProductScanDataImpl _value, $Res Function(_$ProductScanDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductScanData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? productPrice = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$ProductScanDataImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProductScanDataImpl implements _ProductScanData {
  const _$ProductScanDataImpl(
      {this.productName = '',
      this.productPrice = 0.0,
      @JsonKey(name: 'imageUrl') this.imageUrl});

  factory _$ProductScanDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductScanDataImplFromJson(json);

  @override
  @JsonKey()
  final String productName;
  @override
  @JsonKey()
  final double productPrice;
  @override
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;

  @override
  String toString() {
    return 'ProductScanData(productName: $productName, productPrice: $productPrice, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductScanDataImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productName, productPrice, imageUrl);

  /// Create a copy of ProductScanData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductScanDataImplCopyWith<_$ProductScanDataImpl> get copyWith =>
      __$$ProductScanDataImplCopyWithImpl<_$ProductScanDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductScanDataImplToJson(
      this,
    );
  }
}

abstract class _ProductScanData implements ProductScanData {
  const factory _ProductScanData(
          {final String productName,
          final double productPrice,
          @JsonKey(name: 'imageUrl') final String? imageUrl}) =
      _$ProductScanDataImpl;

  factory _ProductScanData.fromJson(Map<String, dynamic> json) =
      _$ProductScanDataImpl.fromJson;

  @override
  String get productName;
  @override
  double get productPrice;
  @override
  @JsonKey(name: 'imageUrl')
  String? get imageUrl;

  /// Create a copy of ProductScanData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductScanDataImplCopyWith<_$ProductScanDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
