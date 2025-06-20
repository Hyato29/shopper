// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingResponse _$ShoppingResponseFromJson(Map<String, dynamic> json) {
  return _ShoppingResponse.fromJson(json);
}

/// @nodoc
mixin _$ShoppingResponse {
  SearchMetadata? get searchMetadata => throw _privateConstructorUsedError;
  List<ShoppingResult> get shoppingResults =>
      throw _privateConstructorUsedError;
  SerpapiPagination? get pagination => throw _privateConstructorUsedError;

  /// Serializes this ShoppingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingResponseCopyWith<ShoppingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingResponseCopyWith<$Res> {
  factory $ShoppingResponseCopyWith(
          ShoppingResponse value, $Res Function(ShoppingResponse) then) =
      _$ShoppingResponseCopyWithImpl<$Res, ShoppingResponse>;
  @useResult
  $Res call(
      {SearchMetadata? searchMetadata,
      List<ShoppingResult> shoppingResults,
      SerpapiPagination? pagination});

  $SearchMetadataCopyWith<$Res>? get searchMetadata;
  $SerpapiPaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$ShoppingResponseCopyWithImpl<$Res, $Val extends ShoppingResponse>
    implements $ShoppingResponseCopyWith<$Res> {
  _$ShoppingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchMetadata = freezed,
    Object? shoppingResults = null,
    Object? pagination = freezed,
  }) {
    return _then(_value.copyWith(
      searchMetadata: freezed == searchMetadata
          ? _value.searchMetadata
          : searchMetadata // ignore: cast_nullable_to_non_nullable
              as SearchMetadata?,
      shoppingResults: null == shoppingResults
          ? _value.shoppingResults
          : shoppingResults // ignore: cast_nullable_to_non_nullable
              as List<ShoppingResult>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as SerpapiPagination?,
    ) as $Val);
  }

  /// Create a copy of ShoppingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchMetadataCopyWith<$Res>? get searchMetadata {
    if (_value.searchMetadata == null) {
      return null;
    }

    return $SearchMetadataCopyWith<$Res>(_value.searchMetadata!, (value) {
      return _then(_value.copyWith(searchMetadata: value) as $Val);
    });
  }

  /// Create a copy of ShoppingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SerpapiPaginationCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $SerpapiPaginationCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShoppingResponseImplCopyWith<$Res>
    implements $ShoppingResponseCopyWith<$Res> {
  factory _$$ShoppingResponseImplCopyWith(_$ShoppingResponseImpl value,
          $Res Function(_$ShoppingResponseImpl) then) =
      __$$ShoppingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SearchMetadata? searchMetadata,
      List<ShoppingResult> shoppingResults,
      SerpapiPagination? pagination});

  @override
  $SearchMetadataCopyWith<$Res>? get searchMetadata;
  @override
  $SerpapiPaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$ShoppingResponseImplCopyWithImpl<$Res>
    extends _$ShoppingResponseCopyWithImpl<$Res, _$ShoppingResponseImpl>
    implements _$$ShoppingResponseImplCopyWith<$Res> {
  __$$ShoppingResponseImplCopyWithImpl(_$ShoppingResponseImpl _value,
      $Res Function(_$ShoppingResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchMetadata = freezed,
    Object? shoppingResults = null,
    Object? pagination = freezed,
  }) {
    return _then(_$ShoppingResponseImpl(
      searchMetadata: freezed == searchMetadata
          ? _value.searchMetadata
          : searchMetadata // ignore: cast_nullable_to_non_nullable
              as SearchMetadata?,
      shoppingResults: null == shoppingResults
          ? _value._shoppingResults
          : shoppingResults // ignore: cast_nullable_to_non_nullable
              as List<ShoppingResult>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as SerpapiPagination?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ShoppingResponseImpl implements _ShoppingResponse {
  const _$ShoppingResponseImpl(
      {this.searchMetadata = null,
      final List<ShoppingResult> shoppingResults = const [],
      this.pagination = null})
      : _shoppingResults = shoppingResults;

  factory _$ShoppingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingResponseImplFromJson(json);

  @override
  @JsonKey()
  final SearchMetadata? searchMetadata;
  final List<ShoppingResult> _shoppingResults;
  @override
  @JsonKey()
  List<ShoppingResult> get shoppingResults {
    if (_shoppingResults is EqualUnmodifiableListView) return _shoppingResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingResults);
  }

  @override
  @JsonKey()
  final SerpapiPagination? pagination;

  @override
  String toString() {
    return 'ShoppingResponse(searchMetadata: $searchMetadata, shoppingResults: $shoppingResults, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingResponseImpl &&
            (identical(other.searchMetadata, searchMetadata) ||
                other.searchMetadata == searchMetadata) &&
            const DeepCollectionEquality()
                .equals(other._shoppingResults, _shoppingResults) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, searchMetadata,
      const DeepCollectionEquality().hash(_shoppingResults), pagination);

  /// Create a copy of ShoppingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingResponseImplCopyWith<_$ShoppingResponseImpl> get copyWith =>
      __$$ShoppingResponseImplCopyWithImpl<_$ShoppingResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingResponseImplToJson(
      this,
    );
  }
}

abstract class _ShoppingResponse implements ShoppingResponse {
  const factory _ShoppingResponse(
      {final SearchMetadata? searchMetadata,
      final List<ShoppingResult> shoppingResults,
      final SerpapiPagination? pagination}) = _$ShoppingResponseImpl;

  factory _ShoppingResponse.fromJson(Map<String, dynamic> json) =
      _$ShoppingResponseImpl.fromJson;

  @override
  SearchMetadata? get searchMetadata;
  @override
  List<ShoppingResult> get shoppingResults;
  @override
  SerpapiPagination? get pagination;

  /// Create a copy of ShoppingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingResponseImplCopyWith<_$ShoppingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShoppingResult _$ShoppingResultFromJson(Map<String, dynamic> json) {
  return _ShoppingResult.fromJson(json);
}

/// @nodoc
mixin _$ShoppingResult {
  int get position => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get productLink => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get delivery => throw _privateConstructorUsedError;

  /// Serializes this ShoppingResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingResultCopyWith<ShoppingResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingResultCopyWith<$Res> {
  factory $ShoppingResultCopyWith(
          ShoppingResult value, $Res Function(ShoppingResult) then) =
      _$ShoppingResultCopyWithImpl<$Res, ShoppingResult>;
  @useResult
  $Res call(
      {int position,
      String title,
      String link,
      String thumbnail,
      String source,
      String price,
      String productLink,
      String productId,
      String delivery});
}

/// @nodoc
class _$ShoppingResultCopyWithImpl<$Res, $Val extends ShoppingResult>
    implements $ShoppingResultCopyWith<$Res> {
  _$ShoppingResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? title = null,
    Object? link = null,
    Object? thumbnail = null,
    Object? source = null,
    Object? price = null,
    Object? productLink = null,
    Object? productId = null,
    Object? delivery = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      productLink: null == productLink
          ? _value.productLink
          : productLink // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingResultImplCopyWith<$Res>
    implements $ShoppingResultCopyWith<$Res> {
  factory _$$ShoppingResultImplCopyWith(_$ShoppingResultImpl value,
          $Res Function(_$ShoppingResultImpl) then) =
      __$$ShoppingResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int position,
      String title,
      String link,
      String thumbnail,
      String source,
      String price,
      String productLink,
      String productId,
      String delivery});
}

/// @nodoc
class __$$ShoppingResultImplCopyWithImpl<$Res>
    extends _$ShoppingResultCopyWithImpl<$Res, _$ShoppingResultImpl>
    implements _$$ShoppingResultImplCopyWith<$Res> {
  __$$ShoppingResultImplCopyWithImpl(
      _$ShoppingResultImpl _value, $Res Function(_$ShoppingResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? title = null,
    Object? link = null,
    Object? thumbnail = null,
    Object? source = null,
    Object? price = null,
    Object? productLink = null,
    Object? productId = null,
    Object? delivery = null,
  }) {
    return _then(_$ShoppingResultImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      productLink: null == productLink
          ? _value.productLink
          : productLink // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ShoppingResultImpl implements _ShoppingResult {
  const _$ShoppingResultImpl(
      {this.position = 0,
      this.title = '',
      this.link = '',
      this.thumbnail = '',
      this.source = '',
      this.price = '',
      this.productLink = '',
      this.productId = '',
      this.delivery = ''});

  factory _$ShoppingResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingResultImplFromJson(json);

  @override
  @JsonKey()
  final int position;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String link;
  @override
  @JsonKey()
  final String thumbnail;
  @override
  @JsonKey()
  final String source;
  @override
  @JsonKey()
  final String price;
  @override
  @JsonKey()
  final String productLink;
  @override
  @JsonKey()
  final String productId;
  @override
  @JsonKey()
  final String delivery;

  @override
  String toString() {
    return 'ShoppingResult(position: $position, title: $title, link: $link, thumbnail: $thumbnail, source: $source, price: $price, productLink: $productLink, productId: $productId, delivery: $delivery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingResultImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.productLink, productLink) ||
                other.productLink == productLink) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, position, title, link, thumbnail,
      source, price, productLink, productId, delivery);

  /// Create a copy of ShoppingResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingResultImplCopyWith<_$ShoppingResultImpl> get copyWith =>
      __$$ShoppingResultImplCopyWithImpl<_$ShoppingResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingResultImplToJson(
      this,
    );
  }
}

abstract class _ShoppingResult implements ShoppingResult {
  const factory _ShoppingResult(
      {final int position,
      final String title,
      final String link,
      final String thumbnail,
      final String source,
      final String price,
      final String productLink,
      final String productId,
      final String delivery}) = _$ShoppingResultImpl;

  factory _ShoppingResult.fromJson(Map<String, dynamic> json) =
      _$ShoppingResultImpl.fromJson;

  @override
  int get position;
  @override
  String get title;
  @override
  String get link;
  @override
  String get thumbnail;
  @override
  String get source;
  @override
  String get price;
  @override
  String get productLink;
  @override
  String get productId;
  @override
  String get delivery;

  /// Create a copy of ShoppingResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingResultImplCopyWith<_$ShoppingResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SerpapiPagination _$SerpapiPaginationFromJson(Map<String, dynamic> json) {
  return _SerpapiPagination.fromJson(json);
}

/// @nodoc
mixin _$SerpapiPagination {
  @JsonStringToInt()
  int get current => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;

  /// Serializes this SerpapiPagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SerpapiPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SerpapiPaginationCopyWith<SerpapiPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SerpapiPaginationCopyWith<$Res> {
  factory $SerpapiPaginationCopyWith(
          SerpapiPagination value, $Res Function(SerpapiPagination) then) =
      _$SerpapiPaginationCopyWithImpl<$Res, SerpapiPagination>;
  @useResult
  $Res call({@JsonStringToInt() int current, String next});
}

/// @nodoc
class _$SerpapiPaginationCopyWithImpl<$Res, $Val extends SerpapiPagination>
    implements $SerpapiPaginationCopyWith<$Res> {
  _$SerpapiPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SerpapiPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? next = null,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SerpapiPaginationImplCopyWith<$Res>
    implements $SerpapiPaginationCopyWith<$Res> {
  factory _$$SerpapiPaginationImplCopyWith(_$SerpapiPaginationImpl value,
          $Res Function(_$SerpapiPaginationImpl) then) =
      __$$SerpapiPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonStringToInt() int current, String next});
}

/// @nodoc
class __$$SerpapiPaginationImplCopyWithImpl<$Res>
    extends _$SerpapiPaginationCopyWithImpl<$Res, _$SerpapiPaginationImpl>
    implements _$$SerpapiPaginationImplCopyWith<$Res> {
  __$$SerpapiPaginationImplCopyWithImpl(_$SerpapiPaginationImpl _value,
      $Res Function(_$SerpapiPaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SerpapiPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? next = null,
  }) {
    return _then(_$SerpapiPaginationImpl(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SerpapiPaginationImpl implements _SerpapiPagination {
  const _$SerpapiPaginationImpl(
      {@JsonStringToInt() this.current = 0, this.next = ''});

  factory _$SerpapiPaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SerpapiPaginationImplFromJson(json);

  @override
  @JsonKey()
  @JsonStringToInt()
  final int current;
  @override
  @JsonKey()
  final String next;

  @override
  String toString() {
    return 'SerpapiPagination(current: $current, next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SerpapiPaginationImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, current, next);

  /// Create a copy of SerpapiPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SerpapiPaginationImplCopyWith<_$SerpapiPaginationImpl> get copyWith =>
      __$$SerpapiPaginationImplCopyWithImpl<_$SerpapiPaginationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SerpapiPaginationImplToJson(
      this,
    );
  }
}

abstract class _SerpapiPagination implements SerpapiPagination {
  const factory _SerpapiPagination(
      {@JsonStringToInt() final int current,
      final String next}) = _$SerpapiPaginationImpl;

  factory _SerpapiPagination.fromJson(Map<String, dynamic> json) =
      _$SerpapiPaginationImpl.fromJson;

  @override
  @JsonStringToInt()
  int get current;
  @override
  String get next;

  /// Create a copy of SerpapiPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SerpapiPaginationImplCopyWith<_$SerpapiPaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
