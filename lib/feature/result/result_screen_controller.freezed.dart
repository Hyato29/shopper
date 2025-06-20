// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultScreenUiState {
  String get keyword => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get currentKeyword => throw _privateConstructorUsedError;
  bool? get isLoggedIn => throw _privateConstructorUsedError;
  AsyncValue<LensResponse> get lensReponse =>
      throw _privateConstructorUsedError;
  AsyncValue<List<ShoppingResult>> get shoppingResults =>
      throw _privateConstructorUsedError;
  Event<dynamic>? get isError => throw _privateConstructorUsedError;
  Event<dynamic>? get isDuplicateSavedResult =>
      throw _privateConstructorUsedError;
  Event<bool>? get nextPageLoading => throw _privateConstructorUsedError;
  String get savedKeyword => throw _privateConstructorUsedError;
  SavedSearch? get savedSearch => throw _privateConstructorUsedError;
  Event<dynamic>? get uploadFileException => throw _privateConstructorUsedError;
  ShoppingResult? get selectedItem => throw _privateConstructorUsedError;
  Event<dynamic>? get successSubmit => throw _privateConstructorUsedError;

  /// Create a copy of ResultScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultScreenUiStateCopyWith<ResultScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultScreenUiStateCopyWith<$Res> {
  factory $ResultScreenUiStateCopyWith(
          ResultScreenUiState value, $Res Function(ResultScreenUiState) then) =
      _$ResultScreenUiStateCopyWithImpl<$Res, ResultScreenUiState>;
  @useResult
  $Res call(
      {String keyword,
      String fileUrl,
      String image,
      String currentKeyword,
      bool? isLoggedIn,
      AsyncValue<LensResponse> lensReponse,
      AsyncValue<List<ShoppingResult>> shoppingResults,
      Event<dynamic>? isError,
      Event<dynamic>? isDuplicateSavedResult,
      Event<bool>? nextPageLoading,
      String savedKeyword,
      SavedSearch? savedSearch,
      Event<dynamic>? uploadFileException,
      ShoppingResult? selectedItem,
      Event<dynamic>? successSubmit});

  $SavedSearchCopyWith<$Res>? get savedSearch;
  $ShoppingResultCopyWith<$Res>? get selectedItem;
}

/// @nodoc
class _$ResultScreenUiStateCopyWithImpl<$Res, $Val extends ResultScreenUiState>
    implements $ResultScreenUiStateCopyWith<$Res> {
  _$ResultScreenUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? fileUrl = null,
    Object? image = null,
    Object? currentKeyword = null,
    Object? isLoggedIn = freezed,
    Object? lensReponse = null,
    Object? shoppingResults = null,
    Object? isError = freezed,
    Object? isDuplicateSavedResult = freezed,
    Object? nextPageLoading = freezed,
    Object? savedKeyword = null,
    Object? savedSearch = freezed,
    Object? uploadFileException = freezed,
    Object? selectedItem = freezed,
    Object? successSubmit = freezed,
  }) {
    return _then(_value.copyWith(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      currentKeyword: null == currentKeyword
          ? _value.currentKeyword
          : currentKeyword // ignore: cast_nullable_to_non_nullable
              as String,
      isLoggedIn: freezed == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      lensReponse: null == lensReponse
          ? _value.lensReponse
          : lensReponse // ignore: cast_nullable_to_non_nullable
              as AsyncValue<LensResponse>,
      shoppingResults: null == shoppingResults
          ? _value.shoppingResults
          : shoppingResults // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ShoppingResult>>,
      isError: freezed == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
      isDuplicateSavedResult: freezed == isDuplicateSavedResult
          ? _value.isDuplicateSavedResult
          : isDuplicateSavedResult // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
      nextPageLoading: freezed == nextPageLoading
          ? _value.nextPageLoading
          : nextPageLoading // ignore: cast_nullable_to_non_nullable
              as Event<bool>?,
      savedKeyword: null == savedKeyword
          ? _value.savedKeyword
          : savedKeyword // ignore: cast_nullable_to_non_nullable
              as String,
      savedSearch: freezed == savedSearch
          ? _value.savedSearch
          : savedSearch // ignore: cast_nullable_to_non_nullable
              as SavedSearch?,
      uploadFileException: freezed == uploadFileException
          ? _value.uploadFileException
          : uploadFileException // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
      selectedItem: freezed == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as ShoppingResult?,
      successSubmit: freezed == successSubmit
          ? _value.successSubmit
          : successSubmit // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
    ) as $Val);
  }

  /// Create a copy of ResultScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SavedSearchCopyWith<$Res>? get savedSearch {
    if (_value.savedSearch == null) {
      return null;
    }

    return $SavedSearchCopyWith<$Res>(_value.savedSearch!, (value) {
      return _then(_value.copyWith(savedSearch: value) as $Val);
    });
  }

  /// Create a copy of ResultScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShoppingResultCopyWith<$Res>? get selectedItem {
    if (_value.selectedItem == null) {
      return null;
    }

    return $ShoppingResultCopyWith<$Res>(_value.selectedItem!, (value) {
      return _then(_value.copyWith(selectedItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultScreenUiStateImplCopyWith<$Res>
    implements $ResultScreenUiStateCopyWith<$Res> {
  factory _$$ResultScreenUiStateImplCopyWith(_$ResultScreenUiStateImpl value,
          $Res Function(_$ResultScreenUiStateImpl) then) =
      __$$ResultScreenUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String keyword,
      String fileUrl,
      String image,
      String currentKeyword,
      bool? isLoggedIn,
      AsyncValue<LensResponse> lensReponse,
      AsyncValue<List<ShoppingResult>> shoppingResults,
      Event<dynamic>? isError,
      Event<dynamic>? isDuplicateSavedResult,
      Event<bool>? nextPageLoading,
      String savedKeyword,
      SavedSearch? savedSearch,
      Event<dynamic>? uploadFileException,
      ShoppingResult? selectedItem,
      Event<dynamic>? successSubmit});

  @override
  $SavedSearchCopyWith<$Res>? get savedSearch;
  @override
  $ShoppingResultCopyWith<$Res>? get selectedItem;
}

/// @nodoc
class __$$ResultScreenUiStateImplCopyWithImpl<$Res>
    extends _$ResultScreenUiStateCopyWithImpl<$Res, _$ResultScreenUiStateImpl>
    implements _$$ResultScreenUiStateImplCopyWith<$Res> {
  __$$ResultScreenUiStateImplCopyWithImpl(_$ResultScreenUiStateImpl _value,
      $Res Function(_$ResultScreenUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResultScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? fileUrl = null,
    Object? image = null,
    Object? currentKeyword = null,
    Object? isLoggedIn = freezed,
    Object? lensReponse = null,
    Object? shoppingResults = null,
    Object? isError = freezed,
    Object? isDuplicateSavedResult = freezed,
    Object? nextPageLoading = freezed,
    Object? savedKeyword = null,
    Object? savedSearch = freezed,
    Object? uploadFileException = freezed,
    Object? selectedItem = freezed,
    Object? successSubmit = freezed,
  }) {
    return _then(_$ResultScreenUiStateImpl(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      currentKeyword: null == currentKeyword
          ? _value.currentKeyword
          : currentKeyword // ignore: cast_nullable_to_non_nullable
              as String,
      isLoggedIn: freezed == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      lensReponse: null == lensReponse
          ? _value.lensReponse
          : lensReponse // ignore: cast_nullable_to_non_nullable
              as AsyncValue<LensResponse>,
      shoppingResults: null == shoppingResults
          ? _value.shoppingResults
          : shoppingResults // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ShoppingResult>>,
      isError: freezed == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
      isDuplicateSavedResult: freezed == isDuplicateSavedResult
          ? _value.isDuplicateSavedResult
          : isDuplicateSavedResult // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
      nextPageLoading: freezed == nextPageLoading
          ? _value.nextPageLoading
          : nextPageLoading // ignore: cast_nullable_to_non_nullable
              as Event<bool>?,
      savedKeyword: null == savedKeyword
          ? _value.savedKeyword
          : savedKeyword // ignore: cast_nullable_to_non_nullable
              as String,
      savedSearch: freezed == savedSearch
          ? _value.savedSearch
          : savedSearch // ignore: cast_nullable_to_non_nullable
              as SavedSearch?,
      uploadFileException: freezed == uploadFileException
          ? _value.uploadFileException
          : uploadFileException // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
      selectedItem: freezed == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as ShoppingResult?,
      successSubmit: freezed == successSubmit
          ? _value.successSubmit
          : successSubmit // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
    ));
  }
}

/// @nodoc

class _$ResultScreenUiStateImpl implements _ResultScreenUiState {
  const _$ResultScreenUiStateImpl(
      {this.keyword = '',
      this.fileUrl = '',
      this.image = '',
      this.currentKeyword = '',
      this.isLoggedIn = null,
      this.lensReponse = const AsyncValue.loading(),
      this.shoppingResults = const AsyncValue.loading(),
      this.isError = null,
      this.isDuplicateSavedResult = null,
      this.nextPageLoading = null,
      this.savedKeyword = '',
      this.savedSearch = null,
      this.uploadFileException = null,
      this.selectedItem = null,
      this.successSubmit = null});

  @override
  @JsonKey()
  final String keyword;
  @override
  @JsonKey()
  final String fileUrl;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String currentKeyword;
  @override
  @JsonKey()
  final bool? isLoggedIn;
  @override
  @JsonKey()
  final AsyncValue<LensResponse> lensReponse;
  @override
  @JsonKey()
  final AsyncValue<List<ShoppingResult>> shoppingResults;
  @override
  @JsonKey()
  final Event<dynamic>? isError;
  @override
  @JsonKey()
  final Event<dynamic>? isDuplicateSavedResult;
  @override
  @JsonKey()
  final Event<bool>? nextPageLoading;
  @override
  @JsonKey()
  final String savedKeyword;
  @override
  @JsonKey()
  final SavedSearch? savedSearch;
  @override
  @JsonKey()
  final Event<dynamic>? uploadFileException;
  @override
  @JsonKey()
  final ShoppingResult? selectedItem;
  @override
  @JsonKey()
  final Event<dynamic>? successSubmit;

  @override
  String toString() {
    return 'ResultScreenUiState(keyword: $keyword, fileUrl: $fileUrl, image: $image, currentKeyword: $currentKeyword, isLoggedIn: $isLoggedIn, lensReponse: $lensReponse, shoppingResults: $shoppingResults, isError: $isError, isDuplicateSavedResult: $isDuplicateSavedResult, nextPageLoading: $nextPageLoading, savedKeyword: $savedKeyword, savedSearch: $savedSearch, uploadFileException: $uploadFileException, selectedItem: $selectedItem, successSubmit: $successSubmit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultScreenUiStateImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.currentKeyword, currentKeyword) ||
                other.currentKeyword == currentKeyword) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.lensReponse, lensReponse) ||
                other.lensReponse == lensReponse) &&
            (identical(other.shoppingResults, shoppingResults) ||
                other.shoppingResults == shoppingResults) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isDuplicateSavedResult, isDuplicateSavedResult) ||
                other.isDuplicateSavedResult == isDuplicateSavedResult) &&
            (identical(other.nextPageLoading, nextPageLoading) ||
                other.nextPageLoading == nextPageLoading) &&
            (identical(other.savedKeyword, savedKeyword) ||
                other.savedKeyword == savedKeyword) &&
            (identical(other.savedSearch, savedSearch) ||
                other.savedSearch == savedSearch) &&
            (identical(other.uploadFileException, uploadFileException) ||
                other.uploadFileException == uploadFileException) &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            (identical(other.successSubmit, successSubmit) ||
                other.successSubmit == successSubmit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      keyword,
      fileUrl,
      image,
      currentKeyword,
      isLoggedIn,
      lensReponse,
      shoppingResults,
      isError,
      isDuplicateSavedResult,
      nextPageLoading,
      savedKeyword,
      savedSearch,
      uploadFileException,
      selectedItem,
      successSubmit);

  /// Create a copy of ResultScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultScreenUiStateImplCopyWith<_$ResultScreenUiStateImpl> get copyWith =>
      __$$ResultScreenUiStateImplCopyWithImpl<_$ResultScreenUiStateImpl>(
          this, _$identity);
}

abstract class _ResultScreenUiState implements ResultScreenUiState {
  const factory _ResultScreenUiState(
      {final String keyword,
      final String fileUrl,
      final String image,
      final String currentKeyword,
      final bool? isLoggedIn,
      final AsyncValue<LensResponse> lensReponse,
      final AsyncValue<List<ShoppingResult>> shoppingResults,
      final Event<dynamic>? isError,
      final Event<dynamic>? isDuplicateSavedResult,
      final Event<bool>? nextPageLoading,
      final String savedKeyword,
      final SavedSearch? savedSearch,
      final Event<dynamic>? uploadFileException,
      final ShoppingResult? selectedItem,
      final Event<dynamic>? successSubmit}) = _$ResultScreenUiStateImpl;

  @override
  String get keyword;
  @override
  String get fileUrl;
  @override
  String get image;
  @override
  String get currentKeyword;
  @override
  bool? get isLoggedIn;
  @override
  AsyncValue<LensResponse> get lensReponse;
  @override
  AsyncValue<List<ShoppingResult>> get shoppingResults;
  @override
  Event<dynamic>? get isError;
  @override
  Event<dynamic>? get isDuplicateSavedResult;
  @override
  Event<bool>? get nextPageLoading;
  @override
  String get savedKeyword;
  @override
  SavedSearch? get savedSearch;
  @override
  Event<dynamic>? get uploadFileException;
  @override
  ShoppingResult? get selectedItem;
  @override
  Event<dynamic>? get successSubmit;

  /// Create a copy of ResultScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultScreenUiStateImplCopyWith<_$ResultScreenUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
