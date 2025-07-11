// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bundle_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductBundleState {
  AsyncValue<List<WmsProduct>> get products =>
      throw _privateConstructorUsedError;
  Set<int> get selectedProductIds => throw _privateConstructorUsedError;
  bool get isInserting => throw _privateConstructorUsedError;
  Event<bool>? get insertionSuccess => throw _privateConstructorUsedError;
  String get searchKey => throw _privateConstructorUsedError;
  bool get nextPageLoading => throw _privateConstructorUsedError;

  /// Create a copy of ProductBundleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductBundleStateCopyWith<ProductBundleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductBundleStateCopyWith<$Res> {
  factory $ProductBundleStateCopyWith(
          ProductBundleState value, $Res Function(ProductBundleState) then) =
      _$ProductBundleStateCopyWithImpl<$Res, ProductBundleState>;
  @useResult
  $Res call(
      {AsyncValue<List<WmsProduct>> products,
      Set<int> selectedProductIds,
      bool isInserting,
      Event<bool>? insertionSuccess,
      String searchKey,
      bool nextPageLoading});
}

/// @nodoc
class _$ProductBundleStateCopyWithImpl<$Res, $Val extends ProductBundleState>
    implements $ProductBundleStateCopyWith<$Res> {
  _$ProductBundleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductBundleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? selectedProductIds = null,
    Object? isInserting = null,
    Object? insertionSuccess = freezed,
    Object? searchKey = null,
    Object? nextPageLoading = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WmsProduct>>,
      selectedProductIds: null == selectedProductIds
          ? _value.selectedProductIds
          : selectedProductIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      isInserting: null == isInserting
          ? _value.isInserting
          : isInserting // ignore: cast_nullable_to_non_nullable
              as bool,
      insertionSuccess: freezed == insertionSuccess
          ? _value.insertionSuccess
          : insertionSuccess // ignore: cast_nullable_to_non_nullable
              as Event<bool>?,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      nextPageLoading: null == nextPageLoading
          ? _value.nextPageLoading
          : nextPageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductBundleStateImplCopyWith<$Res>
    implements $ProductBundleStateCopyWith<$Res> {
  factory _$$ProductBundleStateImplCopyWith(_$ProductBundleStateImpl value,
          $Res Function(_$ProductBundleStateImpl) then) =
      __$$ProductBundleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<WmsProduct>> products,
      Set<int> selectedProductIds,
      bool isInserting,
      Event<bool>? insertionSuccess,
      String searchKey,
      bool nextPageLoading});
}

/// @nodoc
class __$$ProductBundleStateImplCopyWithImpl<$Res>
    extends _$ProductBundleStateCopyWithImpl<$Res, _$ProductBundleStateImpl>
    implements _$$ProductBundleStateImplCopyWith<$Res> {
  __$$ProductBundleStateImplCopyWithImpl(_$ProductBundleStateImpl _value,
      $Res Function(_$ProductBundleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductBundleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? selectedProductIds = null,
    Object? isInserting = null,
    Object? insertionSuccess = freezed,
    Object? searchKey = null,
    Object? nextPageLoading = null,
  }) {
    return _then(_$ProductBundleStateImpl(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WmsProduct>>,
      selectedProductIds: null == selectedProductIds
          ? _value._selectedProductIds
          : selectedProductIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      isInserting: null == isInserting
          ? _value.isInserting
          : isInserting // ignore: cast_nullable_to_non_nullable
              as bool,
      insertionSuccess: freezed == insertionSuccess
          ? _value.insertionSuccess
          : insertionSuccess // ignore: cast_nullable_to_non_nullable
              as Event<bool>?,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      nextPageLoading: null == nextPageLoading
          ? _value.nextPageLoading
          : nextPageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProductBundleStateImpl implements _ProductBundleState {
  const _$ProductBundleStateImpl(
      {this.products = const AsyncData([]),
      final Set<int> selectedProductIds = const {},
      this.isInserting = false,
      this.insertionSuccess,
      this.searchKey = '',
      this.nextPageLoading = false})
      : _selectedProductIds = selectedProductIds;

  @override
  @JsonKey()
  final AsyncValue<List<WmsProduct>> products;
  final Set<int> _selectedProductIds;
  @override
  @JsonKey()
  Set<int> get selectedProductIds {
    if (_selectedProductIds is EqualUnmodifiableSetView)
      return _selectedProductIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedProductIds);
  }

  @override
  @JsonKey()
  final bool isInserting;
  @override
  final Event<bool>? insertionSuccess;
  @override
  @JsonKey()
  final String searchKey;
  @override
  @JsonKey()
  final bool nextPageLoading;

  @override
  String toString() {
    return 'ProductBundleState(products: $products, selectedProductIds: $selectedProductIds, isInserting: $isInserting, insertionSuccess: $insertionSuccess, searchKey: $searchKey, nextPageLoading: $nextPageLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductBundleStateImpl &&
            (identical(other.products, products) ||
                other.products == products) &&
            const DeepCollectionEquality()
                .equals(other._selectedProductIds, _selectedProductIds) &&
            (identical(other.isInserting, isInserting) ||
                other.isInserting == isInserting) &&
            (identical(other.insertionSuccess, insertionSuccess) ||
                other.insertionSuccess == insertionSuccess) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.nextPageLoading, nextPageLoading) ||
                other.nextPageLoading == nextPageLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      products,
      const DeepCollectionEquality().hash(_selectedProductIds),
      isInserting,
      insertionSuccess,
      searchKey,
      nextPageLoading);

  /// Create a copy of ProductBundleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductBundleStateImplCopyWith<_$ProductBundleStateImpl> get copyWith =>
      __$$ProductBundleStateImplCopyWithImpl<_$ProductBundleStateImpl>(
          this, _$identity);
}

abstract class _ProductBundleState implements ProductBundleState {
  const factory _ProductBundleState(
      {final AsyncValue<List<WmsProduct>> products,
      final Set<int> selectedProductIds,
      final bool isInserting,
      final Event<bool>? insertionSuccess,
      final String searchKey,
      final bool nextPageLoading}) = _$ProductBundleStateImpl;

  @override
  AsyncValue<List<WmsProduct>> get products;
  @override
  Set<int> get selectedProductIds;
  @override
  bool get isInserting;
  @override
  Event<bool>? get insertionSuccess;
  @override
  String get searchKey;
  @override
  bool get nextPageLoading;

  /// Create a copy of ProductBundleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductBundleStateImplCopyWith<_$ProductBundleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
