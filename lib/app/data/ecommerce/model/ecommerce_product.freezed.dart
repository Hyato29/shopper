// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ecommerce_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EcommerceSearchResult _$EcommerceSearchResultFromJson(
    Map<String, dynamic> json) {
  return _EcommerceSearchResult.fromJson(json);
}

/// @nodoc
mixin _$EcommerceSearchResult {
  List<EcommerceProduct> get tokopedia => throw _privateConstructorUsedError;
  List<EcommerceProduct> get shopee => throw _privateConstructorUsedError;
  List<EcommerceProduct> get lazada => throw _privateConstructorUsedError;

  /// Serializes this EcommerceSearchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EcommerceSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EcommerceSearchResultCopyWith<EcommerceSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EcommerceSearchResultCopyWith<$Res> {
  factory $EcommerceSearchResultCopyWith(EcommerceSearchResult value,
          $Res Function(EcommerceSearchResult) then) =
      _$EcommerceSearchResultCopyWithImpl<$Res, EcommerceSearchResult>;
  @useResult
  $Res call(
      {List<EcommerceProduct> tokopedia,
      List<EcommerceProduct> shopee,
      List<EcommerceProduct> lazada});
}

/// @nodoc
class _$EcommerceSearchResultCopyWithImpl<$Res,
        $Val extends EcommerceSearchResult>
    implements $EcommerceSearchResultCopyWith<$Res> {
  _$EcommerceSearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EcommerceSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokopedia = null,
    Object? shopee = null,
    Object? lazada = null,
  }) {
    return _then(_value.copyWith(
      tokopedia: null == tokopedia
          ? _value.tokopedia
          : tokopedia // ignore: cast_nullable_to_non_nullable
              as List<EcommerceProduct>,
      shopee: null == shopee
          ? _value.shopee
          : shopee // ignore: cast_nullable_to_non_nullable
              as List<EcommerceProduct>,
      lazada: null == lazada
          ? _value.lazada
          : lazada // ignore: cast_nullable_to_non_nullable
              as List<EcommerceProduct>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EcommerceSearchResultImplCopyWith<$Res>
    implements $EcommerceSearchResultCopyWith<$Res> {
  factory _$$EcommerceSearchResultImplCopyWith(
          _$EcommerceSearchResultImpl value,
          $Res Function(_$EcommerceSearchResultImpl) then) =
      __$$EcommerceSearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EcommerceProduct> tokopedia,
      List<EcommerceProduct> shopee,
      List<EcommerceProduct> lazada});
}

/// @nodoc
class __$$EcommerceSearchResultImplCopyWithImpl<$Res>
    extends _$EcommerceSearchResultCopyWithImpl<$Res,
        _$EcommerceSearchResultImpl>
    implements _$$EcommerceSearchResultImplCopyWith<$Res> {
  __$$EcommerceSearchResultImplCopyWithImpl(_$EcommerceSearchResultImpl _value,
      $Res Function(_$EcommerceSearchResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of EcommerceSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokopedia = null,
    Object? shopee = null,
    Object? lazada = null,
  }) {
    return _then(_$EcommerceSearchResultImpl(
      tokopedia: null == tokopedia
          ? _value._tokopedia
          : tokopedia // ignore: cast_nullable_to_non_nullable
              as List<EcommerceProduct>,
      shopee: null == shopee
          ? _value._shopee
          : shopee // ignore: cast_nullable_to_non_nullable
              as List<EcommerceProduct>,
      lazada: null == lazada
          ? _value._lazada
          : lazada // ignore: cast_nullable_to_non_nullable
              as List<EcommerceProduct>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EcommerceSearchResultImpl implements _EcommerceSearchResult {
  const _$EcommerceSearchResultImpl(
      {final List<EcommerceProduct> tokopedia = const [],
      final List<EcommerceProduct> shopee = const [],
      final List<EcommerceProduct> lazada = const []})
      : _tokopedia = tokopedia,
        _shopee = shopee,
        _lazada = lazada;

  factory _$EcommerceSearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$EcommerceSearchResultImplFromJson(json);

  final List<EcommerceProduct> _tokopedia;
  @override
  @JsonKey()
  List<EcommerceProduct> get tokopedia {
    if (_tokopedia is EqualUnmodifiableListView) return _tokopedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokopedia);
  }

  final List<EcommerceProduct> _shopee;
  @override
  @JsonKey()
  List<EcommerceProduct> get shopee {
    if (_shopee is EqualUnmodifiableListView) return _shopee;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopee);
  }

  final List<EcommerceProduct> _lazada;
  @override
  @JsonKey()
  List<EcommerceProduct> get lazada {
    if (_lazada is EqualUnmodifiableListView) return _lazada;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lazada);
  }

  @override
  String toString() {
    return 'EcommerceSearchResult(tokopedia: $tokopedia, shopee: $shopee, lazada: $lazada)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcommerceSearchResultImpl &&
            const DeepCollectionEquality()
                .equals(other._tokopedia, _tokopedia) &&
            const DeepCollectionEquality().equals(other._shopee, _shopee) &&
            const DeepCollectionEquality().equals(other._lazada, _lazada));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tokopedia),
      const DeepCollectionEquality().hash(_shopee),
      const DeepCollectionEquality().hash(_lazada));

  /// Create a copy of EcommerceSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EcommerceSearchResultImplCopyWith<_$EcommerceSearchResultImpl>
      get copyWith => __$$EcommerceSearchResultImplCopyWithImpl<
          _$EcommerceSearchResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EcommerceSearchResultImplToJson(
      this,
    );
  }
}

abstract class _EcommerceSearchResult implements EcommerceSearchResult {
  const factory _EcommerceSearchResult(
      {final List<EcommerceProduct> tokopedia,
      final List<EcommerceProduct> shopee,
      final List<EcommerceProduct> lazada}) = _$EcommerceSearchResultImpl;

  factory _EcommerceSearchResult.fromJson(Map<String, dynamic> json) =
      _$EcommerceSearchResultImpl.fromJson;

  @override
  List<EcommerceProduct> get tokopedia;
  @override
  List<EcommerceProduct> get shopee;
  @override
  List<EcommerceProduct> get lazada;

  /// Create a copy of EcommerceSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcommerceSearchResultImplCopyWith<_$EcommerceSearchResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EcommerceProduct _$EcommerceProductFromJson(Map<String, dynamic> json) {
  return _EcommerceProduct.fromJson(json);
}

/// @nodoc
mixin _$EcommerceProduct {
  String get title => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this EcommerceProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EcommerceProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EcommerceProductCopyWith<EcommerceProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EcommerceProductCopyWith<$Res> {
  factory $EcommerceProductCopyWith(
          EcommerceProduct value, $Res Function(EcommerceProduct) then) =
      _$EcommerceProductCopyWithImpl<$Res, EcommerceProduct>;
  @useResult
  $Res call(
      {String title, String price, @JsonKey(name: 'imageUrl') String imageUrl});
}

/// @nodoc
class _$EcommerceProductCopyWithImpl<$Res, $Val extends EcommerceProduct>
    implements $EcommerceProductCopyWith<$Res> {
  _$EcommerceProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EcommerceProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EcommerceProductImplCopyWith<$Res>
    implements $EcommerceProductCopyWith<$Res> {
  factory _$$EcommerceProductImplCopyWith(_$EcommerceProductImpl value,
          $Res Function(_$EcommerceProductImpl) then) =
      __$$EcommerceProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String price, @JsonKey(name: 'imageUrl') String imageUrl});
}

/// @nodoc
class __$$EcommerceProductImplCopyWithImpl<$Res>
    extends _$EcommerceProductCopyWithImpl<$Res, _$EcommerceProductImpl>
    implements _$$EcommerceProductImplCopyWith<$Res> {
  __$$EcommerceProductImplCopyWithImpl(_$EcommerceProductImpl _value,
      $Res Function(_$EcommerceProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of EcommerceProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? imageUrl = null,
  }) {
    return _then(_$EcommerceProductImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EcommerceProductImpl implements _EcommerceProduct {
  const _$EcommerceProductImpl(
      {required this.title,
      required this.price,
      @JsonKey(name: 'imageUrl') required this.imageUrl});

  factory _$EcommerceProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$EcommerceProductImplFromJson(json);

  @override
  final String title;
  @override
  final String price;
  @override
  @JsonKey(name: 'imageUrl')
  final String imageUrl;

  @override
  String toString() {
    return 'EcommerceProduct(title: $title, price: $price, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcommerceProductImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, price, imageUrl);

  /// Create a copy of EcommerceProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EcommerceProductImplCopyWith<_$EcommerceProductImpl> get copyWith =>
      __$$EcommerceProductImplCopyWithImpl<_$EcommerceProductImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EcommerceProductImplToJson(
      this,
    );
  }
}

abstract class _EcommerceProduct implements EcommerceProduct {
  const factory _EcommerceProduct(
          {required final String title,
          required final String price,
          @JsonKey(name: 'imageUrl') required final String imageUrl}) =
      _$EcommerceProductImpl;

  factory _EcommerceProduct.fromJson(Map<String, dynamic> json) =
      _$EcommerceProductImpl.fromJson;

  @override
  String get title;
  @override
  String get price;
  @override
  @JsonKey(name: 'imageUrl')
  String get imageUrl;

  /// Create a copy of EcommerceProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcommerceProductImplCopyWith<_$EcommerceProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
