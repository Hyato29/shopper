import 'dart:async';
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
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/data/wms/wms_repository.dart';
import 'package:fskeleton/app/utils/aws_s3_upload/aws_s3_upload.dart';
import 'package:fskeleton/app/utils/event.dart';
import 'package:fskeleton/core.dart';
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
    this._wmsApiRepository,
  ) : super(const HomeScreenUiState());

  final AuthRepository _authRepository;
  final CommonController _commonController;
  final SerpApiRepository _serpApiRepository;
  final WmsApiRepository _wmsApiRepository;

  static final provider =
      StateNotifierProvider.autoDispose<HomeScreenController, HomeScreenUiState>(
    (ref) {
      return HomeScreenController(
        ref.watch(AuthRepository.provider),
        ref.watch(SerpApiRepository.provider),
        ref.watch(CommonController.provider.notifier),
        ref.watch(WmsApiRepository.provider),
      );
    },
  );

  Timer? _debounceTimer;
  MyHeadlessWebView? _headlessWebView;
  String? _currentLensKeyword;
  int _currentPage = 1;
  int? _lastPage;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _headlessWebView?.dispose();
    super.dispose();
  }

  Future<void> onScreenLoaded() async {
    await _getAppVersion();
    await loadProducts();
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
          'Content-Type': lookupMimeType(file.path) ?? '',
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
  }

  Future<void> loadProducts() async {
    _currentPage = 1;
    _lastPage = null;
    state = state.copyWith(products: const AsyncValue.loading());
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.searchProduct(
        searchQuery: state.searchKey,
        page: _currentPage,
      ),
    );
    _commonController.showLoading(isLoading: false);
    if (!mounted) return;
    return result.when(
      data: (data) {
        _lastPage = data.lastPage;
        state = state.copyWith(products: AsyncData(data.data));
      },
      error: (_, __) {
        _commonController.handleCommonError(result.error!, () {});
        state = state.copyWith(
          products: AsyncError(
            result.error!,
            StackTrace.current,
          ),
        );
      },
      loading: () {},
    );
  }

  Future<void> loadNextProducts() async {
    if (_currentPage == _lastPage) return;

    _currentPage += 1;
    state = state.copyWith(nextPageLoading: Event(true));
    final result = await AsyncValue.guard(
      () => _wmsApiRepository.searchProduct(
        searchQuery: state.searchKey,
        page: _currentPage,
      ),
    );
    state = state.copyWith(nextPageLoading: Event(false));
    if (!mounted) return;
    return result.when(
      data: (data) {
        state = state.copyWith(
          products: AsyncValue.data([
            ...?state.products.value,
            ...data.data,
          ]),
        );
      },
      error: (_, __) {
        _currentPage -= 1;
      },
      loading: () {},
    );
  }

  void onChangeSearchKey(String searchKey) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      state = state.copyWith(searchKey: searchKey);
      loadProducts();
    });
  }

  void onRetrySeach() {
    loadProducts();
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
    @Default(AsyncData([])) AsyncValue<List<WmsProduct>> products,
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