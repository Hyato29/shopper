import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/data/auth/auth_repository.dart';
import 'package:fskeleton/app/data/my_headless_web_view.dart';
import 'package:fskeleton/app/data/my_search_preferences/saved_search.dart';
import 'package:fskeleton/app/data/serpapi/model/lens_response.dart';
import 'package:fskeleton/app/data/serpapi/model/shopping_response.dart';
import 'package:fskeleton/app/data/serpapi/serp_api_repository.dart';
import 'package:fskeleton/app/utils/aws_s3_upload/aws_s3_upload.dart';
import 'package:fskeleton/app/utils/event.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/home/product_model.dart';
import 'package:fskeleton/feature/home/suggestion_model.dart';
import 'package:html/parser.dart';
import 'package:mime/mime.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart';

part 'home_screen_controller.freezed.dart';

class HomeScreenController extends StateNotifier<HomeScreenUiState> {
  HomeScreenController(
    this._authRepository,
    this._serpApiRepository,
    this._commonController,
  ) : super(const HomeScreenUiState());

  final AuthRepository _authRepository;
  final CommonController _commonController;
  final SerpApiRepository _serpApiRepository;

  static final provider = StateNotifierProvider.autoDispose<
      HomeScreenController, HomeScreenUiState>(
    (ref) {
      return HomeScreenController(
        ref.watch(AuthRepository.provider),
        ref.watch(SerpApiRepository.provider),
        ref.watch(CommonController.provider.notifier),
      );
    },
  );

  Timer? _debounceTimer;
  MyHeadlessWebView? _headlessWebView;
  String? _currentLensKeyword;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _headlessWebView?.dispose();
    super.dispose();
  }

  Future<void> onScreenLoaded() async {
    await _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;
    final code = packageInfo.buildNumber;

    state = state.copyWith(appVersion: 'v$version.$code');
  }

  void onLogout() {
    _authRepository.clearSession();
  }

  Future<void> uploadFile({required File file}) async {
    _commonController.showLoading(isLoading: true);
    final filename = basename(file.path);
    final uploadedUrl = await AsyncValue.guard(
      () => AwsS3.uploadFile(
        accessKey: const String.fromEnvironment('AWS_ACCESS_KEY_ROOT'),
        secretKey: const String.fromEnvironment('AWS_SECRET_KEY_ROOT'),
        file: file,
        bucket: const String.fromEnvironment('AWS_BUCKET_NAME'),
        region: const String.fromEnvironment('AWS_REGION'),
        filename: filename,
        metadata: {
          "Content-Type": lookupMimeType(file.path) ?? '',
        },
        contentType: lookupMimeType(file.path) ?? '',
      ),
    );

    _commonController.showLoading(isLoading: false);
    if (!mounted) return;
    return uploadedUrl.when(
      data: (data) async {
        if (data == null) {
          state = state.copyWith(uploadFileException: Event(null));
          return;
        }
        state = state.copyWith(
          uploadedFile: file,
          uploadedFileUrl: uploadedUrl.value,
        );

        await searchLensKeyword(uploadedUrl.value!);
      },
      error: (_, __) {
        state = state.copyWith(uploadFileException: Event(null));
      },
      loading: () {},
    );
  }

  Future<void> searchLensKeyword(String fileUrl) async {
    // Reset lens keyword
    state = state.copyWith(lensKeyword: null);

    _commonController.showLoading(isLoading: true);
    _headlessWebView = MyHeadlessWebView(
      url: 'https://lens.google.com/uploadbyurl?url=$fileUrl',
      onLoadStopped: (html) async {
        if (_currentLensKeyword != null) return;

        var keywordFound = _detectFirstProductStringWithParser(html);
        if (keywordFound != null) {
          await _lensHandler(keywordFound);
        } else {
          keywordFound ??= _detectRelatedSearchStringWithParser(html);

          if (keywordFound != null) {
            await _lensHandler(keywordFound);
          }
        }
      },
    );
    await _headlessWebView?.run();
  }

  Future<void> _lensHandler(String keyword) async {
    _currentLensKeyword = keyword;

    await Future.delayed(Duration(milliseconds: Random().nextInt(1999) + 1));

    _commonController.showLoading(isLoading: false);
    state = state.copyWith(lensKeyword: Event(keyword));

    // TODO: Active this for using headless scrapper
    // await searchGoogleShopping(keyword);
  }

  Future<void> searchGoogleShopping(String keyword) async {
    _commonController.showLoading(isLoading: true);

    final shoppingUrl =
        Uri.encodeFull('https://www.google.com/search?tbm=shop&q=$keyword');
    _headlessWebView = MyHeadlessWebView(
      url: shoppingUrl,
      onLoadStopped: (html) async {
        if (!mounted) return;
        if (state.savedResultSearch != null) return;

        final document = parse(html);
        final docProducts = document.getElementsByClassName('i0X6df');
        final products = docProducts.map(
          (e) {
            final imageUrl = e
                    .getElementsByClassName('ArOc1c')
                    .first
                    .getElementsByTagName('img')
                    .first
                    .attributes['src'] ??
                '';
            final title = e.getElementsByClassName('tAxDx').first.text;
            final price = e.getElementsByClassName('OFFNJ').first.text;
            final source = e.getElementsByClassName('IuHnof').first.text;
            final productLink =
                e.getElementsByClassName('shntl').first.attributes['href'] ??
                    '';

            return ShoppingResult(
              title: title,
              link: productLink,
              thumbnail: imageUrl,
              source: source,
              price: price,
              productLink: productLink,
            );
          },
        ).toList();

        if (products.isEmpty) return;
        products.removeAt(0);

        if (state.uploadedFile == null) return;

        final imageBytes = state.uploadedFile!.readAsBytesSync();
        final savedSearch = SavedSearch(
          image: base64Encode(imageBytes),
          keyword: keyword,
          data: products,
          createdAt: DateTime.now(),
        );

        state = state.copyWith(savedResultSearch: Event(savedSearch));
        _commonController.showLoading(isLoading: false);
      },
    );

    await _headlessWebView?.run();
  }

  Future<void> getLastSearchData() async {
    _commonController.showLoading(isLoading: true);
    final result = await AsyncValue.guard(
      () => _serpApiRepository.getSavedSearchData(),
    );
    if (!mounted) return;
    _commonController.showLoading(isLoading: false);
    if (result is AsyncData) {
      final resultData = result.valueOrNull;
      if (resultData == null) {
        state = state.copyWith(lastSearchDataException: Event(null));
        return;
      }
    }
  }

  void onChangeSearchKey(String searchKey) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (searchKey.length >= 3) {
        state = state.copyWith(searchKey: searchKey);
        loadSuggestions();
      } else {
        state = state.copyWith(suggestions: const AsyncData([]));
      }
    });
  }

  void onRetrySeach() {
    onChangeSearchKey(state.searchKey);
  }

  Future<void> loadSuggestions() async {
    final suggestions = List<SuggestionModel>.generate(
      10,
      (e) => const SuggestionModel(code: 'AHC 1234', title: 'Kristin Watson'),
    );
    state = state.copyWith(suggestions: const AsyncValue.loading());
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(suggestions: AsyncData(suggestions));
  }

  void onSelectSuggestion(SuggestionModel model) {
    state = state.copyWith(
      suggestions: const AsyncData([]),
      searchKey: '',
    );

    loadProducts();
  }

  Future<void> loadProducts() async {
    final products = List<ProductModel>.generate(
      20,
      (index) => const ProductModel(
        code: 'AHC1234',
        title: 'Apple Watch Ultra 3',
        price: 'IDR 125.000',
        imageUrl:
            'https://cdn.mos.cms.futurecdn.net/zEMEAwenTtMTBHUUf7Hyr5.jpg',
      ),
    );

    state = state.copyWith(products: const AsyncValue.loading());
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(products: AsyncData(products));
  }

  String? _detectFirstProductStringWithParser(String html) {
    try {
      final document = parse(html);
      final elements = document.getElementsByClassName('UAiK1e');
      if (elements.isNotEmpty) {
        final firstElement = elements.first.text;

        return firstElement;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  String? _detectRelatedSearchStringWithParser(String html) {
    try {
      final document = parse(html);
      final elements = document.getElementsByClassName('LzliJc');
      if (elements.isNotEmpty) {
        final firstElement = elements.first.text;

        return firstElement;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  void onClearSavedResultSearch() {
    state = state.copyWith(
      savedResultSearch: null,
      lensKeyword: null,
    );
    _currentLensKeyword = null;
  }
}

@freezed
class HomeScreenUiState with _$HomeScreenUiState {
  const factory HomeScreenUiState({
    @Default(null) bool? isLoggedIn,
    @Default(AsyncValue.loading()) AsyncValue<LensResponse> lensReponse,
    @Default(AsyncValue.loading())
    AsyncValue<List<ShoppingResult>> shoppingResults,
    @Default(AsyncData([])) AsyncValue<List<SuggestionModel>> suggestions,
    @Default(AsyncData([])) AsyncValue<List<ProductModel>> products,
    @Default(false) bool isError,
    @Default('') String searchKey,
    @Default(null) Event<bool>? nextPageLoading,
    @Default(null) Event? uploadFileException,
    @Default(null) Event? lastSearchDataException,
    @Default('') String appVersion,
    Event<String>? lensKeyword,
    Event<SavedSearch>? savedResultSearch,
    @Default(null) File? uploadedFile,
    @Default(null) String? uploadedFileUrl,
  }) = _HomeScreenUiState;
}
