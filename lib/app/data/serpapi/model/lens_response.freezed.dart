// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lens_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LensResponse _$LensResponseFromJson(Map<String, dynamic> json) {
  return _LensResponse.fromJson(json);
}

/// @nodoc
mixin _$LensResponse {
  SearchMetadata? get searchMetadata => throw _privateConstructorUsedError;
  SearchParameters? get searchParameters => throw _privateConstructorUsedError;
  List<VisualMatches> get visualMatches => throw _privateConstructorUsedError;

  /// Serializes this LensResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LensResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LensResponseCopyWith<LensResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LensResponseCopyWith<$Res> {
  factory $LensResponseCopyWith(
          LensResponse value, $Res Function(LensResponse) then) =
      _$LensResponseCopyWithImpl<$Res, LensResponse>;
  @useResult
  $Res call(
      {SearchMetadata? searchMetadata,
      SearchParameters? searchParameters,
      List<VisualMatches> visualMatches});

  $SearchMetadataCopyWith<$Res>? get searchMetadata;
  $SearchParametersCopyWith<$Res>? get searchParameters;
}

/// @nodoc
class _$LensResponseCopyWithImpl<$Res, $Val extends LensResponse>
    implements $LensResponseCopyWith<$Res> {
  _$LensResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LensResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchMetadata = freezed,
    Object? searchParameters = freezed,
    Object? visualMatches = null,
  }) {
    return _then(_value.copyWith(
      searchMetadata: freezed == searchMetadata
          ? _value.searchMetadata
          : searchMetadata // ignore: cast_nullable_to_non_nullable
              as SearchMetadata?,
      searchParameters: freezed == searchParameters
          ? _value.searchParameters
          : searchParameters // ignore: cast_nullable_to_non_nullable
              as SearchParameters?,
      visualMatches: null == visualMatches
          ? _value.visualMatches
          : visualMatches // ignore: cast_nullable_to_non_nullable
              as List<VisualMatches>,
    ) as $Val);
  }

  /// Create a copy of LensResponse
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

  /// Create a copy of LensResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchParametersCopyWith<$Res>? get searchParameters {
    if (_value.searchParameters == null) {
      return null;
    }

    return $SearchParametersCopyWith<$Res>(_value.searchParameters!, (value) {
      return _then(_value.copyWith(searchParameters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LensResponseImplCopyWith<$Res>
    implements $LensResponseCopyWith<$Res> {
  factory _$$LensResponseImplCopyWith(
          _$LensResponseImpl value, $Res Function(_$LensResponseImpl) then) =
      __$$LensResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SearchMetadata? searchMetadata,
      SearchParameters? searchParameters,
      List<VisualMatches> visualMatches});

  @override
  $SearchMetadataCopyWith<$Res>? get searchMetadata;
  @override
  $SearchParametersCopyWith<$Res>? get searchParameters;
}

/// @nodoc
class __$$LensResponseImplCopyWithImpl<$Res>
    extends _$LensResponseCopyWithImpl<$Res, _$LensResponseImpl>
    implements _$$LensResponseImplCopyWith<$Res> {
  __$$LensResponseImplCopyWithImpl(
      _$LensResponseImpl _value, $Res Function(_$LensResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LensResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchMetadata = freezed,
    Object? searchParameters = freezed,
    Object? visualMatches = null,
  }) {
    return _then(_$LensResponseImpl(
      searchMetadata: freezed == searchMetadata
          ? _value.searchMetadata
          : searchMetadata // ignore: cast_nullable_to_non_nullable
              as SearchMetadata?,
      searchParameters: freezed == searchParameters
          ? _value.searchParameters
          : searchParameters // ignore: cast_nullable_to_non_nullable
              as SearchParameters?,
      visualMatches: null == visualMatches
          ? _value._visualMatches
          : visualMatches // ignore: cast_nullable_to_non_nullable
              as List<VisualMatches>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$LensResponseImpl implements _LensResponse {
  const _$LensResponseImpl(
      {this.searchMetadata = null,
      this.searchParameters = null,
      final List<VisualMatches> visualMatches = const []})
      : _visualMatches = visualMatches;

  factory _$LensResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LensResponseImplFromJson(json);

  @override
  @JsonKey()
  final SearchMetadata? searchMetadata;
  @override
  @JsonKey()
  final SearchParameters? searchParameters;
  final List<VisualMatches> _visualMatches;
  @override
  @JsonKey()
  List<VisualMatches> get visualMatches {
    if (_visualMatches is EqualUnmodifiableListView) return _visualMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visualMatches);
  }

  @override
  String toString() {
    return 'LensResponse(searchMetadata: $searchMetadata, searchParameters: $searchParameters, visualMatches: $visualMatches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LensResponseImpl &&
            (identical(other.searchMetadata, searchMetadata) ||
                other.searchMetadata == searchMetadata) &&
            (identical(other.searchParameters, searchParameters) ||
                other.searchParameters == searchParameters) &&
            const DeepCollectionEquality()
                .equals(other._visualMatches, _visualMatches));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, searchMetadata, searchParameters,
      const DeepCollectionEquality().hash(_visualMatches));

  /// Create a copy of LensResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LensResponseImplCopyWith<_$LensResponseImpl> get copyWith =>
      __$$LensResponseImplCopyWithImpl<_$LensResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LensResponseImplToJson(
      this,
    );
  }
}

abstract class _LensResponse implements LensResponse {
  const factory _LensResponse(
      {final SearchMetadata? searchMetadata,
      final SearchParameters? searchParameters,
      final List<VisualMatches> visualMatches}) = _$LensResponseImpl;

  factory _LensResponse.fromJson(Map<String, dynamic> json) =
      _$LensResponseImpl.fromJson;

  @override
  SearchMetadata? get searchMetadata;
  @override
  SearchParameters? get searchParameters;
  @override
  List<VisualMatches> get visualMatches;

  /// Create a copy of LensResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LensResponseImplCopyWith<_$LensResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchMetadata _$SearchMetadataFromJson(Map<String, dynamic> json) {
  return _SearchMetadata.fromJson(json);
}

/// @nodoc
mixin _$SearchMetadata {
  String get gl => throw _privateConstructorUsedError;
  String get q => throw _privateConstructorUsedError;

  /// Serializes this SearchMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchMetadataCopyWith<SearchMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchMetadataCopyWith<$Res> {
  factory $SearchMetadataCopyWith(
          SearchMetadata value, $Res Function(SearchMetadata) then) =
      _$SearchMetadataCopyWithImpl<$Res, SearchMetadata>;
  @useResult
  $Res call({String gl, String q});
}

/// @nodoc
class _$SearchMetadataCopyWithImpl<$Res, $Val extends SearchMetadata>
    implements $SearchMetadataCopyWith<$Res> {
  _$SearchMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gl = null,
    Object? q = null,
  }) {
    return _then(_value.copyWith(
      gl: null == gl
          ? _value.gl
          : gl // ignore: cast_nullable_to_non_nullable
              as String,
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchMetadataImplCopyWith<$Res>
    implements $SearchMetadataCopyWith<$Res> {
  factory _$$SearchMetadataImplCopyWith(_$SearchMetadataImpl value,
          $Res Function(_$SearchMetadataImpl) then) =
      __$$SearchMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String gl, String q});
}

/// @nodoc
class __$$SearchMetadataImplCopyWithImpl<$Res>
    extends _$SearchMetadataCopyWithImpl<$Res, _$SearchMetadataImpl>
    implements _$$SearchMetadataImplCopyWith<$Res> {
  __$$SearchMetadataImplCopyWithImpl(
      _$SearchMetadataImpl _value, $Res Function(_$SearchMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gl = null,
    Object? q = null,
  }) {
    return _then(_$SearchMetadataImpl(
      gl: null == gl
          ? _value.gl
          : gl // ignore: cast_nullable_to_non_nullable
              as String,
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SearchMetadataImpl implements _SearchMetadata {
  const _$SearchMetadataImpl({this.gl = '', this.q = ''});

  factory _$SearchMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchMetadataImplFromJson(json);

  @override
  @JsonKey()
  final String gl;
  @override
  @JsonKey()
  final String q;

  @override
  String toString() {
    return 'SearchMetadata(gl: $gl, q: $q)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchMetadataImpl &&
            (identical(other.gl, gl) || other.gl == gl) &&
            (identical(other.q, q) || other.q == q));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gl, q);

  /// Create a copy of SearchMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchMetadataImplCopyWith<_$SearchMetadataImpl> get copyWith =>
      __$$SearchMetadataImplCopyWithImpl<_$SearchMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchMetadataImplToJson(
      this,
    );
  }
}

abstract class _SearchMetadata implements SearchMetadata {
  const factory _SearchMetadata({final String gl, final String q}) =
      _$SearchMetadataImpl;

  factory _SearchMetadata.fromJson(Map<String, dynamic> json) =
      _$SearchMetadataImpl.fromJson;

  @override
  String get gl;
  @override
  String get q;

  /// Create a copy of SearchMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchMetadataImplCopyWith<_$SearchMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchParameters _$SearchParametersFromJson(Map<String, dynamic> json) {
  return _SearchParameters.fromJson(json);
}

/// @nodoc
mixin _$SearchParameters {
  String get engine => throw _privateConstructorUsedError;
  String get q => throw _privateConstructorUsedError;
  String get locationRequested => throw _privateConstructorUsedError;
  String get locationUsed => throw _privateConstructorUsedError;
  String get googleDomain => throw _privateConstructorUsedError;
  String get hl => throw _privateConstructorUsedError;
  String get gl => throw _privateConstructorUsedError;
  double get start => throw _privateConstructorUsedError;
  String get device => throw _privateConstructorUsedError;

  /// Serializes this SearchParameters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchParameters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchParametersCopyWith<SearchParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchParametersCopyWith<$Res> {
  factory $SearchParametersCopyWith(
          SearchParameters value, $Res Function(SearchParameters) then) =
      _$SearchParametersCopyWithImpl<$Res, SearchParameters>;
  @useResult
  $Res call(
      {String engine,
      String q,
      String locationRequested,
      String locationUsed,
      String googleDomain,
      String hl,
      String gl,
      double start,
      String device});
}

/// @nodoc
class _$SearchParametersCopyWithImpl<$Res, $Val extends SearchParameters>
    implements $SearchParametersCopyWith<$Res> {
  _$SearchParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchParameters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? engine = null,
    Object? q = null,
    Object? locationRequested = null,
    Object? locationUsed = null,
    Object? googleDomain = null,
    Object? hl = null,
    Object? gl = null,
    Object? start = null,
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      engine: null == engine
          ? _value.engine
          : engine // ignore: cast_nullable_to_non_nullable
              as String,
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      locationRequested: null == locationRequested
          ? _value.locationRequested
          : locationRequested // ignore: cast_nullable_to_non_nullable
              as String,
      locationUsed: null == locationUsed
          ? _value.locationUsed
          : locationUsed // ignore: cast_nullable_to_non_nullable
              as String,
      googleDomain: null == googleDomain
          ? _value.googleDomain
          : googleDomain // ignore: cast_nullable_to_non_nullable
              as String,
      hl: null == hl
          ? _value.hl
          : hl // ignore: cast_nullable_to_non_nullable
              as String,
      gl: null == gl
          ? _value.gl
          : gl // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchParametersImplCopyWith<$Res>
    implements $SearchParametersCopyWith<$Res> {
  factory _$$SearchParametersImplCopyWith(_$SearchParametersImpl value,
          $Res Function(_$SearchParametersImpl) then) =
      __$$SearchParametersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String engine,
      String q,
      String locationRequested,
      String locationUsed,
      String googleDomain,
      String hl,
      String gl,
      double start,
      String device});
}

/// @nodoc
class __$$SearchParametersImplCopyWithImpl<$Res>
    extends _$SearchParametersCopyWithImpl<$Res, _$SearchParametersImpl>
    implements _$$SearchParametersImplCopyWith<$Res> {
  __$$SearchParametersImplCopyWithImpl(_$SearchParametersImpl _value,
      $Res Function(_$SearchParametersImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchParameters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? engine = null,
    Object? q = null,
    Object? locationRequested = null,
    Object? locationUsed = null,
    Object? googleDomain = null,
    Object? hl = null,
    Object? gl = null,
    Object? start = null,
    Object? device = null,
  }) {
    return _then(_$SearchParametersImpl(
      engine: null == engine
          ? _value.engine
          : engine // ignore: cast_nullable_to_non_nullable
              as String,
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      locationRequested: null == locationRequested
          ? _value.locationRequested
          : locationRequested // ignore: cast_nullable_to_non_nullable
              as String,
      locationUsed: null == locationUsed
          ? _value.locationUsed
          : locationUsed // ignore: cast_nullable_to_non_nullable
              as String,
      googleDomain: null == googleDomain
          ? _value.googleDomain
          : googleDomain // ignore: cast_nullable_to_non_nullable
              as String,
      hl: null == hl
          ? _value.hl
          : hl // ignore: cast_nullable_to_non_nullable
              as String,
      gl: null == gl
          ? _value.gl
          : gl // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SearchParametersImpl implements _SearchParameters {
  const _$SearchParametersImpl(
      {this.engine = '',
      this.q = '',
      this.locationRequested = '',
      this.locationUsed = '',
      this.googleDomain = '',
      this.hl = '',
      this.gl = '',
      this.start = 0,
      this.device = ''});

  factory _$SearchParametersImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchParametersImplFromJson(json);

  @override
  @JsonKey()
  final String engine;
  @override
  @JsonKey()
  final String q;
  @override
  @JsonKey()
  final String locationRequested;
  @override
  @JsonKey()
  final String locationUsed;
  @override
  @JsonKey()
  final String googleDomain;
  @override
  @JsonKey()
  final String hl;
  @override
  @JsonKey()
  final String gl;
  @override
  @JsonKey()
  final double start;
  @override
  @JsonKey()
  final String device;

  @override
  String toString() {
    return 'SearchParameters(engine: $engine, q: $q, locationRequested: $locationRequested, locationUsed: $locationUsed, googleDomain: $googleDomain, hl: $hl, gl: $gl, start: $start, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchParametersImpl &&
            (identical(other.engine, engine) || other.engine == engine) &&
            (identical(other.q, q) || other.q == q) &&
            (identical(other.locationRequested, locationRequested) ||
                other.locationRequested == locationRequested) &&
            (identical(other.locationUsed, locationUsed) ||
                other.locationUsed == locationUsed) &&
            (identical(other.googleDomain, googleDomain) ||
                other.googleDomain == googleDomain) &&
            (identical(other.hl, hl) || other.hl == hl) &&
            (identical(other.gl, gl) || other.gl == gl) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, engine, q, locationRequested,
      locationUsed, googleDomain, hl, gl, start, device);

  /// Create a copy of SearchParameters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchParametersImplCopyWith<_$SearchParametersImpl> get copyWith =>
      __$$SearchParametersImplCopyWithImpl<_$SearchParametersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchParametersImplToJson(
      this,
    );
  }
}

abstract class _SearchParameters implements SearchParameters {
  const factory _SearchParameters(
      {final String engine,
      final String q,
      final String locationRequested,
      final String locationUsed,
      final String googleDomain,
      final String hl,
      final String gl,
      final double start,
      final String device}) = _$SearchParametersImpl;

  factory _SearchParameters.fromJson(Map<String, dynamic> json) =
      _$SearchParametersImpl.fromJson;

  @override
  String get engine;
  @override
  String get q;
  @override
  String get locationRequested;
  @override
  String get locationUsed;
  @override
  String get googleDomain;
  @override
  String get hl;
  @override
  String get gl;
  @override
  double get start;
  @override
  String get device;

  /// Create a copy of SearchParameters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchParametersImplCopyWith<_$SearchParametersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VisualMatches _$VisualMatchesFromJson(Map<String, dynamic> json) {
  return _VisualMatches.fromJson(json);
}

/// @nodoc
mixin _$VisualMatches {
  int get position => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  /// Serializes this VisualMatches to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisualMatches
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisualMatchesCopyWith<VisualMatches> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisualMatchesCopyWith<$Res> {
  factory $VisualMatchesCopyWith(
          VisualMatches value, $Res Function(VisualMatches) then) =
      _$VisualMatchesCopyWithImpl<$Res, VisualMatches>;
  @useResult
  $Res call({int position, String title, String link});
}

/// @nodoc
class _$VisualMatchesCopyWithImpl<$Res, $Val extends VisualMatches>
    implements $VisualMatchesCopyWith<$Res> {
  _$VisualMatchesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisualMatches
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? title = null,
    Object? link = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisualMatchesImplCopyWith<$Res>
    implements $VisualMatchesCopyWith<$Res> {
  factory _$$VisualMatchesImplCopyWith(
          _$VisualMatchesImpl value, $Res Function(_$VisualMatchesImpl) then) =
      __$$VisualMatchesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int position, String title, String link});
}

/// @nodoc
class __$$VisualMatchesImplCopyWithImpl<$Res>
    extends _$VisualMatchesCopyWithImpl<$Res, _$VisualMatchesImpl>
    implements _$$VisualMatchesImplCopyWith<$Res> {
  __$$VisualMatchesImplCopyWithImpl(
      _$VisualMatchesImpl _value, $Res Function(_$VisualMatchesImpl) _then)
      : super(_value, _then);

  /// Create a copy of VisualMatches
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? title = null,
    Object? link = null,
  }) {
    return _then(_$VisualMatchesImpl(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$VisualMatchesImpl implements _VisualMatches {
  const _$VisualMatchesImpl(
      {this.position = 0, this.title = '', this.link = ''});

  factory _$VisualMatchesImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisualMatchesImplFromJson(json);

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
  String toString() {
    return 'VisualMatches(position: $position, title: $title, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisualMatchesImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, position, title, link);

  /// Create a copy of VisualMatches
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisualMatchesImplCopyWith<_$VisualMatchesImpl> get copyWith =>
      __$$VisualMatchesImplCopyWithImpl<_$VisualMatchesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisualMatchesImplToJson(
      this,
    );
  }
}

abstract class _VisualMatches implements VisualMatches {
  const factory _VisualMatches(
      {final int position,
      final String title,
      final String link}) = _$VisualMatchesImpl;

  factory _VisualMatches.fromJson(Map<String, dynamic> json) =
      _$VisualMatchesImpl.fromJson;

  @override
  int get position;
  @override
  String get title;
  @override
  String get link;

  /// Create a copy of VisualMatches
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisualMatchesImplCopyWith<_$VisualMatchesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
