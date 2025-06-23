// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wms_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WmsGetBundleBasicResponse _$WmsGetBundleBasicResponseFromJson(
    Map<String, dynamic> json) {
  return _WmsGetBundleBasicResponse.fromJson(json);
}

/// @nodoc
mixin _$WmsGetBundleBasicResponse {
  WmsGetBundleResponse get data => throw _privateConstructorUsedError;

  /// Serializes this WmsGetBundleBasicResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsGetBundleBasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsGetBundleBasicResponseCopyWith<WmsGetBundleBasicResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsGetBundleBasicResponseCopyWith<$Res> {
  factory $WmsGetBundleBasicResponseCopyWith(WmsGetBundleBasicResponse value,
          $Res Function(WmsGetBundleBasicResponse) then) =
      _$WmsGetBundleBasicResponseCopyWithImpl<$Res, WmsGetBundleBasicResponse>;
  @useResult
  $Res call({WmsGetBundleResponse data});

  $WmsGetBundleResponseCopyWith<$Res> get data;
}

/// @nodoc
class _$WmsGetBundleBasicResponseCopyWithImpl<$Res,
        $Val extends WmsGetBundleBasicResponse>
    implements $WmsGetBundleBasicResponseCopyWith<$Res> {
  _$WmsGetBundleBasicResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsGetBundleBasicResponse
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
              as WmsGetBundleResponse,
    ) as $Val);
  }

  /// Create a copy of WmsGetBundleBasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WmsGetBundleResponseCopyWith<$Res> get data {
    return $WmsGetBundleResponseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WmsGetBundleBasicResponseImplCopyWith<$Res>
    implements $WmsGetBundleBasicResponseCopyWith<$Res> {
  factory _$$WmsGetBundleBasicResponseImplCopyWith(
          _$WmsGetBundleBasicResponseImpl value,
          $Res Function(_$WmsGetBundleBasicResponseImpl) then) =
      __$$WmsGetBundleBasicResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WmsGetBundleResponse data});

  @override
  $WmsGetBundleResponseCopyWith<$Res> get data;
}

/// @nodoc
class __$$WmsGetBundleBasicResponseImplCopyWithImpl<$Res>
    extends _$WmsGetBundleBasicResponseCopyWithImpl<$Res,
        _$WmsGetBundleBasicResponseImpl>
    implements _$$WmsGetBundleBasicResponseImplCopyWith<$Res> {
  __$$WmsGetBundleBasicResponseImplCopyWithImpl(
      _$WmsGetBundleBasicResponseImpl _value,
      $Res Function(_$WmsGetBundleBasicResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsGetBundleBasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$WmsGetBundleBasicResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as WmsGetBundleResponse,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WmsGetBundleBasicResponseImpl implements _WmsGetBundleBasicResponse {
  const _$WmsGetBundleBasicResponseImpl({required this.data});

  factory _$WmsGetBundleBasicResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsGetBundleBasicResponseImplFromJson(json);

  @override
  final WmsGetBundleResponse data;

  @override
  String toString() {
    return 'WmsGetBundleBasicResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsGetBundleBasicResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of WmsGetBundleBasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsGetBundleBasicResponseImplCopyWith<_$WmsGetBundleBasicResponseImpl>
      get copyWith => __$$WmsGetBundleBasicResponseImplCopyWithImpl<
          _$WmsGetBundleBasicResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsGetBundleBasicResponseImplToJson(
      this,
    );
  }
}

abstract class _WmsGetBundleBasicResponse implements WmsGetBundleBasicResponse {
  const factory _WmsGetBundleBasicResponse(
          {required final WmsGetBundleResponse data}) =
      _$WmsGetBundleBasicResponseImpl;

  factory _WmsGetBundleBasicResponse.fromJson(Map<String, dynamic> json) =
      _$WmsGetBundleBasicResponseImpl.fromJson;

  @override
  WmsGetBundleResponse get data;

  /// Create a copy of WmsGetBundleBasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsGetBundleBasicResponseImplCopyWith<_$WmsGetBundleBasicResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WmsGetBundleResponse _$WmsGetBundleResponseFromJson(Map<String, dynamic> json) {
  return _WmsGetBundleResponse.fromJson(json);
}

/// @nodoc
mixin _$WmsGetBundleResponse {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  WmsGetBundleResource get resource => throw _privateConstructorUsedError;

  /// Serializes this WmsGetBundleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsGetBundleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsGetBundleResponseCopyWith<WmsGetBundleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsGetBundleResponseCopyWith<$Res> {
  factory $WmsGetBundleResponseCopyWith(WmsGetBundleResponse value,
          $Res Function(WmsGetBundleResponse) then) =
      _$WmsGetBundleResponseCopyWithImpl<$Res, WmsGetBundleResponse>;
  @useResult
  $Res call({bool status, String message, WmsGetBundleResource resource});

  $WmsGetBundleResourceCopyWith<$Res> get resource;
}

/// @nodoc
class _$WmsGetBundleResponseCopyWithImpl<$Res,
        $Val extends WmsGetBundleResponse>
    implements $WmsGetBundleResponseCopyWith<$Res> {
  _$WmsGetBundleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsGetBundleResponse
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
              as WmsGetBundleResource,
    ) as $Val);
  }

  /// Create a copy of WmsGetBundleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WmsGetBundleResourceCopyWith<$Res> get resource {
    return $WmsGetBundleResourceCopyWith<$Res>(_value.resource, (value) {
      return _then(_value.copyWith(resource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WmsGetBundleResponseImplCopyWith<$Res>
    implements $WmsGetBundleResponseCopyWith<$Res> {
  factory _$$WmsGetBundleResponseImplCopyWith(_$WmsGetBundleResponseImpl value,
          $Res Function(_$WmsGetBundleResponseImpl) then) =
      __$$WmsGetBundleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, WmsGetBundleResource resource});

  @override
  $WmsGetBundleResourceCopyWith<$Res> get resource;
}

/// @nodoc
class __$$WmsGetBundleResponseImplCopyWithImpl<$Res>
    extends _$WmsGetBundleResponseCopyWithImpl<$Res, _$WmsGetBundleResponseImpl>
    implements _$$WmsGetBundleResponseImplCopyWith<$Res> {
  __$$WmsGetBundleResponseImplCopyWithImpl(_$WmsGetBundleResponseImpl _value,
      $Res Function(_$WmsGetBundleResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsGetBundleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? resource = null,
  }) {
    return _then(_$WmsGetBundleResponseImpl(
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
              as WmsGetBundleResource,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WmsGetBundleResponseImpl implements _WmsGetBundleResponse {
  const _$WmsGetBundleResponseImpl(
      {this.status = false, this.message = '', required this.resource});

  factory _$WmsGetBundleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsGetBundleResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool status;
  @override
  @JsonKey()
  final String message;
  @override
  final WmsGetBundleResource resource;

  @override
  String toString() {
    return 'WmsGetBundleResponse(status: $status, message: $message, resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsGetBundleResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, resource);

  /// Create a copy of WmsGetBundleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsGetBundleResponseImplCopyWith<_$WmsGetBundleResponseImpl>
      get copyWith =>
          __$$WmsGetBundleResponseImplCopyWithImpl<_$WmsGetBundleResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsGetBundleResponseImplToJson(
      this,
    );
  }
}

abstract class _WmsGetBundleResponse implements WmsGetBundleResponse {
  const factory _WmsGetBundleResponse(
          {final bool status,
          final String message,
          required final WmsGetBundleResource resource}) =
      _$WmsGetBundleResponseImpl;

  factory _WmsGetBundleResponse.fromJson(Map<String, dynamic> json) =
      _$WmsGetBundleResponseImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  WmsGetBundleResource get resource;

  /// Create a copy of WmsGetBundleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsGetBundleResponseImplCopyWith<_$WmsGetBundleResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WmsGetBundleResource _$WmsGetBundleResourceFromJson(Map<String, dynamic> json) {
  return _WmsGetBundleResource.fromJson(json);
}

/// @nodoc
mixin _$WmsGetBundleResource {
  int get currentPage => throw _privateConstructorUsedError;
  List<WmsBundle> get data => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;

  /// Serializes this WmsGetBundleResource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsGetBundleResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsGetBundleResourceCopyWith<WmsGetBundleResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsGetBundleResourceCopyWith<$Res> {
  factory $WmsGetBundleResourceCopyWith(WmsGetBundleResource value,
          $Res Function(WmsGetBundleResource) then) =
      _$WmsGetBundleResourceCopyWithImpl<$Res, WmsGetBundleResource>;
  @useResult
  $Res call({int currentPage, List<WmsBundle> data, int lastPage});
}

/// @nodoc
class _$WmsGetBundleResourceCopyWithImpl<$Res,
        $Val extends WmsGetBundleResource>
    implements $WmsGetBundleResourceCopyWith<$Res> {
  _$WmsGetBundleResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsGetBundleResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? data = null,
    Object? lastPage = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WmsBundle>,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WmsGetBundleResourceImplCopyWith<$Res>
    implements $WmsGetBundleResourceCopyWith<$Res> {
  factory _$$WmsGetBundleResourceImplCopyWith(_$WmsGetBundleResourceImpl value,
          $Res Function(_$WmsGetBundleResourceImpl) then) =
      __$$WmsGetBundleResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPage, List<WmsBundle> data, int lastPage});
}

/// @nodoc
class __$$WmsGetBundleResourceImplCopyWithImpl<$Res>
    extends _$WmsGetBundleResourceCopyWithImpl<$Res, _$WmsGetBundleResourceImpl>
    implements _$$WmsGetBundleResourceImplCopyWith<$Res> {
  __$$WmsGetBundleResourceImplCopyWithImpl(_$WmsGetBundleResourceImpl _value,
      $Res Function(_$WmsGetBundleResourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsGetBundleResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? data = null,
    Object? lastPage = null,
  }) {
    return _then(_$WmsGetBundleResourceImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WmsBundle>,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WmsGetBundleResourceImpl implements _WmsGetBundleResource {
  const _$WmsGetBundleResourceImpl(
      {this.currentPage = 0,
      final List<WmsBundle> data = const [],
      this.lastPage = 0})
      : _data = data;

  factory _$WmsGetBundleResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsGetBundleResourceImplFromJson(json);

  @override
  @JsonKey()
  final int currentPage;
  final List<WmsBundle> _data;
  @override
  @JsonKey()
  List<WmsBundle> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final int lastPage;

  @override
  String toString() {
    return 'WmsGetBundleResource(currentPage: $currentPage, data: $data, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsGetBundleResourceImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage,
      const DeepCollectionEquality().hash(_data), lastPage);

  /// Create a copy of WmsGetBundleResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsGetBundleResourceImplCopyWith<_$WmsGetBundleResourceImpl>
      get copyWith =>
          __$$WmsGetBundleResourceImplCopyWithImpl<_$WmsGetBundleResourceImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsGetBundleResourceImplToJson(
      this,
    );
  }
}

abstract class _WmsGetBundleResource implements WmsGetBundleResource {
  const factory _WmsGetBundleResource(
      {final int currentPage,
      final List<WmsBundle> data,
      final int lastPage}) = _$WmsGetBundleResourceImpl;

  factory _WmsGetBundleResource.fromJson(Map<String, dynamic> json) =
      _$WmsGetBundleResourceImpl.fromJson;

  @override
  int get currentPage;
  @override
  List<WmsBundle> get data;
  @override
  int get lastPage;

  /// Create a copy of WmsGetBundleResource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsGetBundleResourceImplCopyWith<_$WmsGetBundleResourceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WmsBundle _$WmsBundleFromJson(Map<String, dynamic> json) {
  return _WmsBundle.fromJson(json);
}

/// @nodoc
mixin _$WmsBundle {
  int get id => throw _privateConstructorUsedError;
  String get nameBundle => throw _privateConstructorUsedError;
  String get barcodeBundle => throw _privateConstructorUsedError;
  int get totalProductBundle => throw _privateConstructorUsedError;
  String get totalPriceBundle => throw _privateConstructorUsedError;
  String get totalPriceCustomBundle => throw _privateConstructorUsedError;
  List<ProductInBundle> get productBundles =>
      throw _privateConstructorUsedError;

  /// Serializes this WmsBundle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WmsBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WmsBundleCopyWith<WmsBundle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WmsBundleCopyWith<$Res> {
  factory $WmsBundleCopyWith(WmsBundle value, $Res Function(WmsBundle) then) =
      _$WmsBundleCopyWithImpl<$Res, WmsBundle>;
  @useResult
  $Res call(
      {int id,
      String nameBundle,
      String barcodeBundle,
      int totalProductBundle,
      String totalPriceBundle,
      String totalPriceCustomBundle,
      List<ProductInBundle> productBundles});
}

/// @nodoc
class _$WmsBundleCopyWithImpl<$Res, $Val extends WmsBundle>
    implements $WmsBundleCopyWith<$Res> {
  _$WmsBundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WmsBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameBundle = null,
    Object? barcodeBundle = null,
    Object? totalProductBundle = null,
    Object? totalPriceBundle = null,
    Object? totalPriceCustomBundle = null,
    Object? productBundles = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameBundle: null == nameBundle
          ? _value.nameBundle
          : nameBundle // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeBundle: null == barcodeBundle
          ? _value.barcodeBundle
          : barcodeBundle // ignore: cast_nullable_to_non_nullable
              as String,
      totalProductBundle: null == totalProductBundle
          ? _value.totalProductBundle
          : totalProductBundle // ignore: cast_nullable_to_non_nullable
              as int,
      totalPriceBundle: null == totalPriceBundle
          ? _value.totalPriceBundle
          : totalPriceBundle // ignore: cast_nullable_to_non_nullable
              as String,
      totalPriceCustomBundle: null == totalPriceCustomBundle
          ? _value.totalPriceCustomBundle
          : totalPriceCustomBundle // ignore: cast_nullable_to_non_nullable
              as String,
      productBundles: null == productBundles
          ? _value.productBundles
          : productBundles // ignore: cast_nullable_to_non_nullable
              as List<ProductInBundle>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WmsBundleImplCopyWith<$Res>
    implements $WmsBundleCopyWith<$Res> {
  factory _$$WmsBundleImplCopyWith(
          _$WmsBundleImpl value, $Res Function(_$WmsBundleImpl) then) =
      __$$WmsBundleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nameBundle,
      String barcodeBundle,
      int totalProductBundle,
      String totalPriceBundle,
      String totalPriceCustomBundle,
      List<ProductInBundle> productBundles});
}

/// @nodoc
class __$$WmsBundleImplCopyWithImpl<$Res>
    extends _$WmsBundleCopyWithImpl<$Res, _$WmsBundleImpl>
    implements _$$WmsBundleImplCopyWith<$Res> {
  __$$WmsBundleImplCopyWithImpl(
      _$WmsBundleImpl _value, $Res Function(_$WmsBundleImpl) _then)
      : super(_value, _then);

  /// Create a copy of WmsBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameBundle = null,
    Object? barcodeBundle = null,
    Object? totalProductBundle = null,
    Object? totalPriceBundle = null,
    Object? totalPriceCustomBundle = null,
    Object? productBundles = null,
  }) {
    return _then(_$WmsBundleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameBundle: null == nameBundle
          ? _value.nameBundle
          : nameBundle // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeBundle: null == barcodeBundle
          ? _value.barcodeBundle
          : barcodeBundle // ignore: cast_nullable_to_non_nullable
              as String,
      totalProductBundle: null == totalProductBundle
          ? _value.totalProductBundle
          : totalProductBundle // ignore: cast_nullable_to_non_nullable
              as int,
      totalPriceBundle: null == totalPriceBundle
          ? _value.totalPriceBundle
          : totalPriceBundle // ignore: cast_nullable_to_non_nullable
              as String,
      totalPriceCustomBundle: null == totalPriceCustomBundle
          ? _value.totalPriceCustomBundle
          : totalPriceCustomBundle // ignore: cast_nullable_to_non_nullable
              as String,
      productBundles: null == productBundles
          ? _value._productBundles
          : productBundles // ignore: cast_nullable_to_non_nullable
              as List<ProductInBundle>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WmsBundleImpl implements _WmsBundle {
  const _$WmsBundleImpl(
      {this.id = 0,
      this.nameBundle = '',
      this.barcodeBundle = '',
      this.totalProductBundle = 0,
      this.totalPriceBundle = "0.00",
      this.totalPriceCustomBundle = "0.00",
      final List<ProductInBundle> productBundles = const []})
      : _productBundles = productBundles;

  factory _$WmsBundleImpl.fromJson(Map<String, dynamic> json) =>
      _$$WmsBundleImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String nameBundle;
  @override
  @JsonKey()
  final String barcodeBundle;
  @override
  @JsonKey()
  final int totalProductBundle;
  @override
  @JsonKey()
  final String totalPriceBundle;
  @override
  @JsonKey()
  final String totalPriceCustomBundle;
  final List<ProductInBundle> _productBundles;
  @override
  @JsonKey()
  List<ProductInBundle> get productBundles {
    if (_productBundles is EqualUnmodifiableListView) return _productBundles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productBundles);
  }

  @override
  String toString() {
    return 'WmsBundle(id: $id, nameBundle: $nameBundle, barcodeBundle: $barcodeBundle, totalProductBundle: $totalProductBundle, totalPriceBundle: $totalPriceBundle, totalPriceCustomBundle: $totalPriceCustomBundle, productBundles: $productBundles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WmsBundleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameBundle, nameBundle) ||
                other.nameBundle == nameBundle) &&
            (identical(other.barcodeBundle, barcodeBundle) ||
                other.barcodeBundle == barcodeBundle) &&
            (identical(other.totalProductBundle, totalProductBundle) ||
                other.totalProductBundle == totalProductBundle) &&
            (identical(other.totalPriceBundle, totalPriceBundle) ||
                other.totalPriceBundle == totalPriceBundle) &&
            (identical(other.totalPriceCustomBundle, totalPriceCustomBundle) ||
                other.totalPriceCustomBundle == totalPriceCustomBundle) &&
            const DeepCollectionEquality()
                .equals(other._productBundles, _productBundles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nameBundle,
      barcodeBundle,
      totalProductBundle,
      totalPriceBundle,
      totalPriceCustomBundle,
      const DeepCollectionEquality().hash(_productBundles));

  /// Create a copy of WmsBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WmsBundleImplCopyWith<_$WmsBundleImpl> get copyWith =>
      __$$WmsBundleImplCopyWithImpl<_$WmsBundleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WmsBundleImplToJson(
      this,
    );
  }
}

abstract class _WmsBundle implements WmsBundle {
  const factory _WmsBundle(
      {final int id,
      final String nameBundle,
      final String barcodeBundle,
      final int totalProductBundle,
      final String totalPriceBundle,
      final String totalPriceCustomBundle,
      final List<ProductInBundle> productBundles}) = _$WmsBundleImpl;

  factory _WmsBundle.fromJson(Map<String, dynamic> json) =
      _$WmsBundleImpl.fromJson;

  @override
  int get id;
  @override
  String get nameBundle;
  @override
  String get barcodeBundle;
  @override
  int get totalProductBundle;
  @override
  String get totalPriceBundle;
  @override
  String get totalPriceCustomBundle;
  @override
  List<ProductInBundle> get productBundles;

  /// Create a copy of WmsBundle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WmsBundleImplCopyWith<_$WmsBundleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductInBundle _$ProductInBundleFromJson(Map<String, dynamic> json) {
  return _ProductInBundle.fromJson(json);
}

/// @nodoc
mixin _$ProductInBundle {
  int get id => throw _privateConstructorUsedError;
  String get newNameProduct => throw _privateConstructorUsedError;
  String get displayPrice => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this ProductInBundle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductInBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductInBundleCopyWith<ProductInBundle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductInBundleCopyWith<$Res> {
  factory $ProductInBundleCopyWith(
          ProductInBundle value, $Res Function(ProductInBundle) then) =
      _$ProductInBundleCopyWithImpl<$Res, ProductInBundle>;
  @useResult
  $Res call(
      {int id, String newNameProduct, String displayPrice, String? image});
}

/// @nodoc
class _$ProductInBundleCopyWithImpl<$Res, $Val extends ProductInBundle>
    implements $ProductInBundleCopyWith<$Res> {
  _$ProductInBundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductInBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? newNameProduct = null,
    Object? displayPrice = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      newNameProduct: null == newNameProduct
          ? _value.newNameProduct
          : newNameProduct // ignore: cast_nullable_to_non_nullable
              as String,
      displayPrice: null == displayPrice
          ? _value.displayPrice
          : displayPrice // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductInBundleImplCopyWith<$Res>
    implements $ProductInBundleCopyWith<$Res> {
  factory _$$ProductInBundleImplCopyWith(_$ProductInBundleImpl value,
          $Res Function(_$ProductInBundleImpl) then) =
      __$$ProductInBundleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String newNameProduct, String displayPrice, String? image});
}

/// @nodoc
class __$$ProductInBundleImplCopyWithImpl<$Res>
    extends _$ProductInBundleCopyWithImpl<$Res, _$ProductInBundleImpl>
    implements _$$ProductInBundleImplCopyWith<$Res> {
  __$$ProductInBundleImplCopyWithImpl(
      _$ProductInBundleImpl _value, $Res Function(_$ProductInBundleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductInBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? newNameProduct = null,
    Object? displayPrice = null,
    Object? image = freezed,
  }) {
    return _then(_$ProductInBundleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      newNameProduct: null == newNameProduct
          ? _value.newNameProduct
          : newNameProduct // ignore: cast_nullable_to_non_nullable
              as String,
      displayPrice: null == displayPrice
          ? _value.displayPrice
          : displayPrice // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProductInBundleImpl implements _ProductInBundle {
  const _$ProductInBundleImpl(
      {this.id = 0,
      this.newNameProduct = '',
      this.displayPrice = "0.00",
      this.image});

  factory _$ProductInBundleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductInBundleImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String newNameProduct;
  @override
  @JsonKey()
  final String displayPrice;
  @override
  final String? image;

  @override
  String toString() {
    return 'ProductInBundle(id: $id, newNameProduct: $newNameProduct, displayPrice: $displayPrice, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductInBundleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.newNameProduct, newNameProduct) ||
                other.newNameProduct == newNameProduct) &&
            (identical(other.displayPrice, displayPrice) ||
                other.displayPrice == displayPrice) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, newNameProduct, displayPrice, image);

  /// Create a copy of ProductInBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductInBundleImplCopyWith<_$ProductInBundleImpl> get copyWith =>
      __$$ProductInBundleImplCopyWithImpl<_$ProductInBundleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductInBundleImplToJson(
      this,
    );
  }
}

abstract class _ProductInBundle implements ProductInBundle {
  const factory _ProductInBundle(
      {final int id,
      final String newNameProduct,
      final String displayPrice,
      final String? image}) = _$ProductInBundleImpl;

  factory _ProductInBundle.fromJson(Map<String, dynamic> json) =
      _$ProductInBundleImpl.fromJson;

  @override
  int get id;
  @override
  String get newNameProduct;
  @override
  String get displayPrice;
  @override
  String? get image;

  /// Create a copy of ProductInBundle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductInBundleImplCopyWith<_$ProductInBundleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
