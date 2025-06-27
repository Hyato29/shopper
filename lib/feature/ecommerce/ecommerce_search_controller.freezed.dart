// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ecommerce_search_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EcommerceSearchState {
  AsyncValue<EcommerceSearchResult> get searchResult =>
      throw _privateConstructorUsedError;

  /// Create a copy of EcommerceSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EcommerceSearchStateCopyWith<EcommerceSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EcommerceSearchStateCopyWith<$Res> {
  factory $EcommerceSearchStateCopyWith(EcommerceSearchState value,
          $Res Function(EcommerceSearchState) then) =
      _$EcommerceSearchStateCopyWithImpl<$Res, EcommerceSearchState>;
  @useResult
  $Res call({AsyncValue<EcommerceSearchResult> searchResult});
}

/// @nodoc
class _$EcommerceSearchStateCopyWithImpl<$Res,
        $Val extends EcommerceSearchState>
    implements $EcommerceSearchStateCopyWith<$Res> {
  _$EcommerceSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EcommerceSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResult = null,
  }) {
    return _then(_value.copyWith(
      searchResult: null == searchResult
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as AsyncValue<EcommerceSearchResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EcommerceSearchStateImplCopyWith<$Res>
    implements $EcommerceSearchStateCopyWith<$Res> {
  factory _$$EcommerceSearchStateImplCopyWith(_$EcommerceSearchStateImpl value,
          $Res Function(_$EcommerceSearchStateImpl) then) =
      __$$EcommerceSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<EcommerceSearchResult> searchResult});
}

/// @nodoc
class __$$EcommerceSearchStateImplCopyWithImpl<$Res>
    extends _$EcommerceSearchStateCopyWithImpl<$Res, _$EcommerceSearchStateImpl>
    implements _$$EcommerceSearchStateImplCopyWith<$Res> {
  __$$EcommerceSearchStateImplCopyWithImpl(_$EcommerceSearchStateImpl _value,
      $Res Function(_$EcommerceSearchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EcommerceSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResult = null,
  }) {
    return _then(_$EcommerceSearchStateImpl(
      searchResult: null == searchResult
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as AsyncValue<EcommerceSearchResult>,
    ));
  }
}

/// @nodoc

class _$EcommerceSearchStateImpl implements _EcommerceSearchState {
  const _$EcommerceSearchStateImpl(
      {this.searchResult = const AsyncValue.loading()});

  @override
  @JsonKey()
  final AsyncValue<EcommerceSearchResult> searchResult;

  @override
  String toString() {
    return 'EcommerceSearchState(searchResult: $searchResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcommerceSearchStateImpl &&
            (identical(other.searchResult, searchResult) ||
                other.searchResult == searchResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchResult);

  /// Create a copy of EcommerceSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EcommerceSearchStateImplCopyWith<_$EcommerceSearchStateImpl>
      get copyWith =>
          __$$EcommerceSearchStateImplCopyWithImpl<_$EcommerceSearchStateImpl>(
              this, _$identity);
}

abstract class _EcommerceSearchState implements EcommerceSearchState {
  const factory _EcommerceSearchState(
          {final AsyncValue<EcommerceSearchResult> searchResult}) =
      _$EcommerceSearchStateImpl;

  @override
  AsyncValue<EcommerceSearchResult> get searchResult;

  /// Create a copy of EcommerceSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcommerceSearchStateImplCopyWith<_$EcommerceSearchStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
