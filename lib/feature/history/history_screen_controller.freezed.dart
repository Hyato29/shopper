// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryScreenUiState {
  AsyncValue<List<WmsProduct>> get products =>
      throw _privateConstructorUsedError;
  AsyncValue<List<WmsBundle>> get bundles => throw _privateConstructorUsedError;
  String get searchKey => throw _privateConstructorUsedError;
  Event<bool>? get nextPageLoading => throw _privateConstructorUsedError;
  WmsProduct? get selectedProduct => throw _privateConstructorUsedError;
  WmsBundle? get selectedBundle => throw _privateConstructorUsedError;
  Event<bool>? get bundleCreated => throw _privateConstructorUsedError;

  /// Create a copy of HistoryScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryScreenUiStateCopyWith<HistoryScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryScreenUiStateCopyWith<$Res> {
  factory $HistoryScreenUiStateCopyWith(HistoryScreenUiState value,
          $Res Function(HistoryScreenUiState) then) =
      _$HistoryScreenUiStateCopyWithImpl<$Res, HistoryScreenUiState>;
  @useResult
  $Res call(
      {AsyncValue<List<WmsProduct>> products,
      AsyncValue<List<WmsBundle>> bundles,
      String searchKey,
      Event<bool>? nextPageLoading,
      WmsProduct? selectedProduct,
      WmsBundle? selectedBundle,
      Event<bool>? bundleCreated});

  $WmsProductCopyWith<$Res>? get selectedProduct;
  $WmsBundleCopyWith<$Res>? get selectedBundle;
}

/// @nodoc
class _$HistoryScreenUiStateCopyWithImpl<$Res,
        $Val extends HistoryScreenUiState>
    implements $HistoryScreenUiStateCopyWith<$Res> {
  _$HistoryScreenUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? bundles = null,
    Object? searchKey = null,
    Object? nextPageLoading = freezed,
    Object? selectedProduct = freezed,
    Object? selectedBundle = freezed,
    Object? bundleCreated = freezed,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WmsProduct>>,
      bundles: null == bundles
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WmsBundle>>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      nextPageLoading: freezed == nextPageLoading
          ? _value.nextPageLoading
          : nextPageLoading // ignore: cast_nullable_to_non_nullable
              as Event<bool>?,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as WmsProduct?,
      selectedBundle: freezed == selectedBundle
          ? _value.selectedBundle
          : selectedBundle // ignore: cast_nullable_to_non_nullable
              as WmsBundle?,
      bundleCreated: freezed == bundleCreated
          ? _value.bundleCreated
          : bundleCreated // ignore: cast_nullable_to_non_nullable
              as Event<bool>?,
    ) as $Val);
  }

  /// Create a copy of HistoryScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WmsProductCopyWith<$Res>? get selectedProduct {
    if (_value.selectedProduct == null) {
      return null;
    }

    return $WmsProductCopyWith<$Res>(_value.selectedProduct!, (value) {
      return _then(_value.copyWith(selectedProduct: value) as $Val);
    });
  }

  /// Create a copy of HistoryScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WmsBundleCopyWith<$Res>? get selectedBundle {
    if (_value.selectedBundle == null) {
      return null;
    }

    return $WmsBundleCopyWith<$Res>(_value.selectedBundle!, (value) {
      return _then(_value.copyWith(selectedBundle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HistoryScreenUiStateImplCopyWith<$Res>
    implements $HistoryScreenUiStateCopyWith<$Res> {
  factory _$$HistoryScreenUiStateImplCopyWith(_$HistoryScreenUiStateImpl value,
          $Res Function(_$HistoryScreenUiStateImpl) then) =
      __$$HistoryScreenUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<WmsProduct>> products,
      AsyncValue<List<WmsBundle>> bundles,
      String searchKey,
      Event<bool>? nextPageLoading,
      WmsProduct? selectedProduct,
      WmsBundle? selectedBundle,
      Event<bool>? bundleCreated});

  @override
  $WmsProductCopyWith<$Res>? get selectedProduct;
  @override
  $WmsBundleCopyWith<$Res>? get selectedBundle;
}

/// @nodoc
class __$$HistoryScreenUiStateImplCopyWithImpl<$Res>
    extends _$HistoryScreenUiStateCopyWithImpl<$Res, _$HistoryScreenUiStateImpl>
    implements _$$HistoryScreenUiStateImplCopyWith<$Res> {
  __$$HistoryScreenUiStateImplCopyWithImpl(_$HistoryScreenUiStateImpl _value,
      $Res Function(_$HistoryScreenUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? bundles = null,
    Object? searchKey = null,
    Object? nextPageLoading = freezed,
    Object? selectedProduct = freezed,
    Object? selectedBundle = freezed,
    Object? bundleCreated = freezed,
  }) {
    return _then(_$HistoryScreenUiStateImpl(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WmsProduct>>,
      bundles: null == bundles
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WmsBundle>>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      nextPageLoading: freezed == nextPageLoading
          ? _value.nextPageLoading
          : nextPageLoading // ignore: cast_nullable_to_non_nullable
              as Event<bool>?,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as WmsProduct?,
      selectedBundle: freezed == selectedBundle
          ? _value.selectedBundle
          : selectedBundle // ignore: cast_nullable_to_non_nullable
              as WmsBundle?,
      bundleCreated: freezed == bundleCreated
          ? _value.bundleCreated
          : bundleCreated // ignore: cast_nullable_to_non_nullable
              as Event<bool>?,
    ));
  }
}

/// @nodoc

class _$HistoryScreenUiStateImpl implements _HistoryScreenUiState {
  const _$HistoryScreenUiStateImpl(
      {this.products = const AsyncData([]),
      this.bundles = const AsyncData([]),
      this.searchKey = '',
      this.nextPageLoading = null,
      this.selectedProduct,
      this.selectedBundle,
      this.bundleCreated});

  @override
  @JsonKey()
  final AsyncValue<List<WmsProduct>> products;
  @override
  @JsonKey()
  final AsyncValue<List<WmsBundle>> bundles;
  @override
  @JsonKey()
  final String searchKey;
  @override
  @JsonKey()
  final Event<bool>? nextPageLoading;
  @override
  final WmsProduct? selectedProduct;
  @override
  final WmsBundle? selectedBundle;
  @override
  final Event<bool>? bundleCreated;

  @override
  String toString() {
    return 'HistoryScreenUiState(products: $products, bundles: $bundles, searchKey: $searchKey, nextPageLoading: $nextPageLoading, selectedProduct: $selectedProduct, selectedBundle: $selectedBundle, bundleCreated: $bundleCreated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryScreenUiStateImpl &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.bundles, bundles) || other.bundles == bundles) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.nextPageLoading, nextPageLoading) ||
                other.nextPageLoading == nextPageLoading) &&
            (identical(other.selectedProduct, selectedProduct) ||
                other.selectedProduct == selectedProduct) &&
            (identical(other.selectedBundle, selectedBundle) ||
                other.selectedBundle == selectedBundle) &&
            (identical(other.bundleCreated, bundleCreated) ||
                other.bundleCreated == bundleCreated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products, bundles, searchKey,
      nextPageLoading, selectedProduct, selectedBundle, bundleCreated);

  /// Create a copy of HistoryScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryScreenUiStateImplCopyWith<_$HistoryScreenUiStateImpl>
      get copyWith =>
          __$$HistoryScreenUiStateImplCopyWithImpl<_$HistoryScreenUiStateImpl>(
              this, _$identity);
}

abstract class _HistoryScreenUiState implements HistoryScreenUiState {
  const factory _HistoryScreenUiState(
      {final AsyncValue<List<WmsProduct>> products,
      final AsyncValue<List<WmsBundle>> bundles,
      final String searchKey,
      final Event<bool>? nextPageLoading,
      final WmsProduct? selectedProduct,
      final WmsBundle? selectedBundle,
      final Event<bool>? bundleCreated}) = _$HistoryScreenUiStateImpl;

  @override
  AsyncValue<List<WmsProduct>> get products;
  @override
  AsyncValue<List<WmsBundle>> get bundles;
  @override
  String get searchKey;
  @override
  Event<bool>? get nextPageLoading;
  @override
  WmsProduct? get selectedProduct;
  @override
  WmsBundle? get selectedBundle;
  @override
  Event<bool>? get bundleCreated;

  /// Create a copy of HistoryScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryScreenUiStateImplCopyWith<_$HistoryScreenUiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
