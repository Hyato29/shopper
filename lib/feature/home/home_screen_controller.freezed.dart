// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeScreenUiState {
  bool? get isLoggedIn => throw _privateConstructorUsedError;
  AsyncValue<LensResponse> get lensReponse =>
      throw _privateConstructorUsedError;
  AsyncValue<List<ShoppingResult>> get shoppingResults =>
      throw _privateConstructorUsedError;
  AsyncValue<List<SuggestionModel>> get suggestions =>
      throw _privateConstructorUsedError;
  AsyncValue<List<ProductModel>> get products =>
      throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get searchKey => throw _privateConstructorUsedError;
  Event<bool>? get nextPageLoading => throw _privateConstructorUsedError;
  Event<dynamic>? get uploadFileException => throw _privateConstructorUsedError;
  Event<dynamic>? get lastSearchDataException =>
      throw _privateConstructorUsedError;
  String get appVersion => throw _privateConstructorUsedError;
  Event<String>? get lensKeyword => throw _privateConstructorUsedError;
  Event<SavedSearch>? get savedResultSearch =>
      throw _privateConstructorUsedError;
  File? get uploadedFile => throw _privateConstructorUsedError;
  String? get uploadedFileUrl => throw _privateConstructorUsedError;

  /// Create a copy of HomeScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeScreenUiStateCopyWith<HomeScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenUiStateCopyWith<$Res> {
  factory $HomeScreenUiStateCopyWith(
          HomeScreenUiState value, $Res Function(HomeScreenUiState) then) =
      _$HomeScreenUiStateCopyWithImpl<$Res, HomeScreenUiState>;
  @useResult
  $Res call(
      {bool? isLoggedIn,
      AsyncValue<LensResponse> lensReponse,
      AsyncValue<List<ShoppingResult>> shoppingResults,
      AsyncValue<List<SuggestionModel>> suggestions,
      AsyncValue<List<ProductModel>> products,
      bool isError,
      String searchKey,
      Event<bool>? nextPageLoading,
      Event<dynamic>? uploadFileException,
      Event<dynamic>? lastSearchDataException,
      String appVersion,
      Event<String>? lensKeyword,
      Event<SavedSearch>? savedResultSearch,
      File? uploadedFile,
      String? uploadedFileUrl});
}

/// @nodoc
class _$HomeScreenUiStateCopyWithImpl<$Res, $Val extends HomeScreenUiState>
    implements $HomeScreenUiStateCopyWith<$Res> {
  _$HomeScreenUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = freezed,
    Object? lensReponse = null,
    Object? shoppingResults = null,
    Object? suggestions = null,
    Object? products = null,
    Object? isError = null,
    Object? searchKey = null,
    Object? nextPageLoading = freezed,
    Object? uploadFileException = freezed,
    Object? lastSearchDataException = freezed,
    Object? appVersion = null,
    Object? lensKeyword = freezed,
    Object? savedResultSearch = freezed,
    Object? uploadedFile = freezed,
    Object? uploadedFileUrl = freezed,
  }) {
    return _then(_value.copyWith(
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
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SuggestionModel>>,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProductModel>>,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      nextPageLoading: freezed == nextPageLoading
          ? _value.nextPageLoading
          : nextPageLoading // ignore: cast_nullable_to_non_nullable
              as Event<bool>?,
      uploadFileException: freezed == uploadFileException
          ? _value.uploadFileException
          : uploadFileException // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
      lastSearchDataException: freezed == lastSearchDataException
          ? _value.lastSearchDataException
          : lastSearchDataException // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      lensKeyword: freezed == lensKeyword
          ? _value.lensKeyword
          : lensKeyword // ignore: cast_nullable_to_non_nullable
              as Event<String>?,
      savedResultSearch: freezed == savedResultSearch
          ? _value.savedResultSearch
          : savedResultSearch // ignore: cast_nullable_to_non_nullable
              as Event<SavedSearch>?,
      uploadedFile: freezed == uploadedFile
          ? _value.uploadedFile
          : uploadedFile // ignore: cast_nullable_to_non_nullable
              as File?,
      uploadedFileUrl: freezed == uploadedFileUrl
          ? _value.uploadedFileUrl
          : uploadedFileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeScreenUiStateImplCopyWith<$Res>
    implements $HomeScreenUiStateCopyWith<$Res> {
  factory _$$HomeScreenUiStateImplCopyWith(_$HomeScreenUiStateImpl value,
          $Res Function(_$HomeScreenUiStateImpl) then) =
      __$$HomeScreenUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isLoggedIn,
      AsyncValue<LensResponse> lensReponse,
      AsyncValue<List<ShoppingResult>> shoppingResults,
      AsyncValue<List<SuggestionModel>> suggestions,
      AsyncValue<List<ProductModel>> products,
      bool isError,
      String searchKey,
      Event<bool>? nextPageLoading,
      Event<dynamic>? uploadFileException,
      Event<dynamic>? lastSearchDataException,
      String appVersion,
      Event<String>? lensKeyword,
      Event<SavedSearch>? savedResultSearch,
      File? uploadedFile,
      String? uploadedFileUrl});
}

/// @nodoc
class __$$HomeScreenUiStateImplCopyWithImpl<$Res>
    extends _$HomeScreenUiStateCopyWithImpl<$Res, _$HomeScreenUiStateImpl>
    implements _$$HomeScreenUiStateImplCopyWith<$Res> {
  __$$HomeScreenUiStateImplCopyWithImpl(_$HomeScreenUiStateImpl _value,
      $Res Function(_$HomeScreenUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = freezed,
    Object? lensReponse = null,
    Object? shoppingResults = null,
    Object? suggestions = null,
    Object? products = null,
    Object? isError = null,
    Object? searchKey = null,
    Object? nextPageLoading = freezed,
    Object? uploadFileException = freezed,
    Object? lastSearchDataException = freezed,
    Object? appVersion = null,
    Object? lensKeyword = freezed,
    Object? savedResultSearch = freezed,
    Object? uploadedFile = freezed,
    Object? uploadedFileUrl = freezed,
  }) {
    return _then(_$HomeScreenUiStateImpl(
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
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SuggestionModel>>,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProductModel>>,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      nextPageLoading: freezed == nextPageLoading
          ? _value.nextPageLoading
          : nextPageLoading // ignore: cast_nullable_to_non_nullable
              as Event<bool>?,
      uploadFileException: freezed == uploadFileException
          ? _value.uploadFileException
          : uploadFileException // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
      lastSearchDataException: freezed == lastSearchDataException
          ? _value.lastSearchDataException
          : lastSearchDataException // ignore: cast_nullable_to_non_nullable
              as Event<dynamic>?,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      lensKeyword: freezed == lensKeyword
          ? _value.lensKeyword
          : lensKeyword // ignore: cast_nullable_to_non_nullable
              as Event<String>?,
      savedResultSearch: freezed == savedResultSearch
          ? _value.savedResultSearch
          : savedResultSearch // ignore: cast_nullable_to_non_nullable
              as Event<SavedSearch>?,
      uploadedFile: freezed == uploadedFile
          ? _value.uploadedFile
          : uploadedFile // ignore: cast_nullable_to_non_nullable
              as File?,
      uploadedFileUrl: freezed == uploadedFileUrl
          ? _value.uploadedFileUrl
          : uploadedFileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HomeScreenUiStateImpl implements _HomeScreenUiState {
  const _$HomeScreenUiStateImpl(
      {this.isLoggedIn = null,
      this.lensReponse = const AsyncValue.loading(),
      this.shoppingResults = const AsyncValue.loading(),
      this.suggestions = const AsyncData([]),
      this.products = const AsyncData([]),
      this.isError = false,
      this.searchKey = '',
      this.nextPageLoading = null,
      this.uploadFileException = null,
      this.lastSearchDataException = null,
      this.appVersion = '',
      this.lensKeyword,
      this.savedResultSearch,
      this.uploadedFile = null,
      this.uploadedFileUrl = null});

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
  final AsyncValue<List<SuggestionModel>> suggestions;
  @override
  @JsonKey()
  final AsyncValue<List<ProductModel>> products;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final String searchKey;
  @override
  @JsonKey()
  final Event<bool>? nextPageLoading;
  @override
  @JsonKey()
  final Event<dynamic>? uploadFileException;
  @override
  @JsonKey()
  final Event<dynamic>? lastSearchDataException;
  @override
  @JsonKey()
  final String appVersion;
  @override
  final Event<String>? lensKeyword;
  @override
  final Event<SavedSearch>? savedResultSearch;
  @override
  @JsonKey()
  final File? uploadedFile;
  @override
  @JsonKey()
  final String? uploadedFileUrl;

  @override
  String toString() {
    return 'HomeScreenUiState(isLoggedIn: $isLoggedIn, lensReponse: $lensReponse, shoppingResults: $shoppingResults, suggestions: $suggestions, products: $products, isError: $isError, searchKey: $searchKey, nextPageLoading: $nextPageLoading, uploadFileException: $uploadFileException, lastSearchDataException: $lastSearchDataException, appVersion: $appVersion, lensKeyword: $lensKeyword, savedResultSearch: $savedResultSearch, uploadedFile: $uploadedFile, uploadedFileUrl: $uploadedFileUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeScreenUiStateImpl &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.lensReponse, lensReponse) ||
                other.lensReponse == lensReponse) &&
            (identical(other.shoppingResults, shoppingResults) ||
                other.shoppingResults == shoppingResults) &&
            (identical(other.suggestions, suggestions) ||
                other.suggestions == suggestions) &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.nextPageLoading, nextPageLoading) ||
                other.nextPageLoading == nextPageLoading) &&
            (identical(other.uploadFileException, uploadFileException) ||
                other.uploadFileException == uploadFileException) &&
            (identical(
                    other.lastSearchDataException, lastSearchDataException) ||
                other.lastSearchDataException == lastSearchDataException) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.lensKeyword, lensKeyword) ||
                other.lensKeyword == lensKeyword) &&
            (identical(other.savedResultSearch, savedResultSearch) ||
                other.savedResultSearch == savedResultSearch) &&
            (identical(other.uploadedFile, uploadedFile) ||
                other.uploadedFile == uploadedFile) &&
            (identical(other.uploadedFileUrl, uploadedFileUrl) ||
                other.uploadedFileUrl == uploadedFileUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoggedIn,
      lensReponse,
      shoppingResults,
      suggestions,
      products,
      isError,
      searchKey,
      nextPageLoading,
      uploadFileException,
      lastSearchDataException,
      appVersion,
      lensKeyword,
      savedResultSearch,
      uploadedFile,
      uploadedFileUrl);

  /// Create a copy of HomeScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeScreenUiStateImplCopyWith<_$HomeScreenUiStateImpl> get copyWith =>
      __$$HomeScreenUiStateImplCopyWithImpl<_$HomeScreenUiStateImpl>(
          this, _$identity);
}

abstract class _HomeScreenUiState implements HomeScreenUiState {
  const factory _HomeScreenUiState(
      {final bool? isLoggedIn,
      final AsyncValue<LensResponse> lensReponse,
      final AsyncValue<List<ShoppingResult>> shoppingResults,
      final AsyncValue<List<SuggestionModel>> suggestions,
      final AsyncValue<List<ProductModel>> products,
      final bool isError,
      final String searchKey,
      final Event<bool>? nextPageLoading,
      final Event<dynamic>? uploadFileException,
      final Event<dynamic>? lastSearchDataException,
      final String appVersion,
      final Event<String>? lensKeyword,
      final Event<SavedSearch>? savedResultSearch,
      final File? uploadedFile,
      final String? uploadedFileUrl}) = _$HomeScreenUiStateImpl;

  @override
  bool? get isLoggedIn;
  @override
  AsyncValue<LensResponse> get lensReponse;
  @override
  AsyncValue<List<ShoppingResult>> get shoppingResults;
  @override
  AsyncValue<List<SuggestionModel>> get suggestions;
  @override
  AsyncValue<List<ProductModel>> get products;
  @override
  bool get isError;
  @override
  String get searchKey;
  @override
  Event<bool>? get nextPageLoading;
  @override
  Event<dynamic>? get uploadFileException;
  @override
  Event<dynamic>? get lastSearchDataException;
  @override
  String get appVersion;
  @override
  Event<String>? get lensKeyword;
  @override
  Event<SavedSearch>? get savedResultSearch;
  @override
  File? get uploadedFile;
  @override
  String? get uploadedFileUrl;

  /// Create a copy of HomeScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeScreenUiStateImplCopyWith<_$HomeScreenUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
