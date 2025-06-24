// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchScreenUiState {
  AsyncValue<List<WmsProduct>> get products =>
      throw _privateConstructorUsedError;
  String get searchKey => throw _privateConstructorUsedError;
  Event<bool>? get nextPageLoading => throw _privateConstructorUsedError;
  Event<dynamic>? get addProductSuccess => throw _privateConstructorUsedError;

  /// Create a copy of SearchScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchScreenUiStateCopyWith<SearchScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchScreenUiStateCopyWith<$Res> {
  factory $SearchScreenUiStateCopyWith(
          SearchScreenUiState value, $Res Function(SearchScreenUiState) then) =
      _$SearchScreenUiStateCopyWithImpl<$Res, SearchScreenUiState>;
  @useResult
  $Res call(
      {AsyncValue<List<WmsProduct>> products,
      String searchKey,
      Event<bool>? nextPageLoading,
      Event<dynamic>? addProductSuccess});
}

/// @nodoc
class _$SearchScreenUiStateCopyWithImpl<$Res, $Val extends SearchScreenUiState>
    implements $SearchScreenUiStateCopyWith<$Res> {
  _$SearchScreenUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? searchKey = null,
    Object? nextPageLoading = freezed,
    Object? addProductSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WmsProduct>>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      nextPageLoading: freezed == nextPageLoading
          ? _value.nextPageLoading
          : nextPageLoading // ignore: cast_nullable_to_non_nullable
              as Event<bool>?,
      addProductSuccess: freezed == addProductSuccess
          ? _value.addProductSuccess
          : addProductSuccess // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchScreenUiStateImplCopyWith<$Res>
    implements $SearchScreenUiStateCopyWith<$Res> {
  factory _$$SearchScreenUiStateImplCopyWith(_$SearchScreenUiStateImpl value,
          $Res Function(_$SearchScreenUiStateImpl) then) =
      __$$SearchScreenUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<WmsProduct>> products,
      String searchKey,
      Event<bool>? nextPageLoading,
      Event<dynamic>? addProductSuccess});
}

/// @nodoc
class __$$SearchScreenUiStateImplCopyWithImpl<$Res>
    extends _$SearchScreenUiStateCopyWithImpl<$Res, _$SearchScreenUiStateImpl>
    implements _$$SearchScreenUiStateImplCopyWith<$Res> {
  __$$SearchScreenUiStateImplCopyWithImpl(_$SearchScreenUiStateImpl _value,
      $Res Function(_$SearchScreenUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? searchKey = null,
    Object? nextPageLoading = freezed,
    Object? addProductSuccess = freezed,
  }) {
    return _then(_$SearchScreenUiStateImpl(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WmsProduct>>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      nextPageLoading: freezed == nextPageLoading
          ? _value.nextPageLoading
          : nextPageLoading // ignore: cast_nullable_to_non_nullable
              as Event<bool>?,
      addProductSuccess: freezed == addProductSuccess
          ? _value.addProductSuccess
          : addProductSuccess // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
    ));
  }
}

/// @nodoc

class _$SearchScreenUiStateImpl implements _SearchScreenUiState {
  const _$SearchScreenUiStateImpl(
      {this.products = const AsyncData([]),
      this.searchKey = '',
      this.nextPageLoading = null,
      this.addProductSuccess = null});

  @override
  @JsonKey()
  final AsyncValue<List<WmsProduct>> products;
  @override
  @JsonKey()
  final String searchKey;
  @override
  @JsonKey()
  final Event<bool>? nextPageLoading;
  @override
  @JsonKey()
  final Event<dynamic>? addProductSuccess;

  @override
  String toString() {
    return 'SearchScreenUiState(products: $products, searchKey: $searchKey, nextPageLoading: $nextPageLoading, addProductSuccess: $addProductSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchScreenUiStateImpl &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.nextPageLoading, nextPageLoading) ||
                other.nextPageLoading == nextPageLoading) &&
            (identical(other.addProductSuccess, addProductSuccess) ||
                other.addProductSuccess == addProductSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, products, searchKey, nextPageLoading, addProductSuccess);

  /// Create a copy of SearchScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchScreenUiStateImplCopyWith<_$SearchScreenUiStateImpl> get copyWith =>
      __$$SearchScreenUiStateImplCopyWithImpl<_$SearchScreenUiStateImpl>(
          this, _$identity);
}

abstract class _SearchScreenUiState implements SearchScreenUiState {
  const factory _SearchScreenUiState(
      {final AsyncValue<List<WmsProduct>> products,
      final String searchKey,
      final Event<bool>? nextPageLoading,
      final Event<dynamic>? addProductSuccess}) = _$SearchScreenUiStateImpl;

  @override
  AsyncValue<List<WmsProduct>> get products;
  @override
  String get searchKey;
  @override
  Event<bool>? get nextPageLoading;
  @override
  Event<dynamic>? get addProductSuccess;

  /// Create a copy of SearchScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchScreenUiStateImplCopyWith<_$SearchScreenUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
