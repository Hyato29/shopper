import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localizations/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('id')];

  /// No description provided for @cameraPermissionTitle.
  ///
  /// In id, this message translates to:
  /// **'Izinkan Akses Kamera'**
  String get cameraPermissionTitle;

  /// No description provided for @cameraPermissionDescription.
  ///
  /// In id, this message translates to:
  /// **'Untuk memindai gambar, Anda harus memberikan akses kamera.'**
  String get cameraPermissionDescription;

  /// No description provided for @cameraPermissionDescription2.
  ///
  /// In id, this message translates to:
  /// **'Untuk dapat mengambil gambar, Anda harus memberikan akses kamera.'**
  String get cameraPermissionDescription2;

  /// No description provided for @give.
  ///
  /// In id, this message translates to:
  /// **'Berikan'**
  String get give;

  /// No description provided for @abort.
  ///
  /// In id, this message translates to:
  /// **'Batal'**
  String get abort;

  /// No description provided for @galleryPermissionTitle.
  ///
  /// In id, this message translates to:
  /// **'Izinkan Akses Media'**
  String get galleryPermissionTitle;

  /// No description provided for @galleryPermissionDescription.
  ///
  /// In id, this message translates to:
  /// **'Untuk mengunggah foto dari galeri, Anda harus memberikan akses media.'**
  String get galleryPermissionDescription;

  /// No description provided for @error.
  ///
  /// In id, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @generalErrorMessage.
  ///
  /// In id, this message translates to:
  /// **'Maaf, sistem sedang mengalami gangguan. Silakan coba lagi.'**
  String get generalErrorMessage;

  /// No description provided for @back.
  ///
  /// In id, this message translates to:
  /// **'Kembali'**
  String get back;

  /// No description provided for @failedSystemGetData.
  ///
  /// In id, this message translates to:
  /// **'Gagal mengambil data'**
  String get failedSystemGetData;

  /// No description provided for @errorStateMessage.
  ///
  /// In id, this message translates to:
  /// **'Terjadi kegagalan saat mengambil data dari sistem. Harap coba lagi.'**
  String get errorStateMessage;

  /// No description provided for @searchNotFoundTitle.
  ///
  /// In id, this message translates to:
  /// **'Pencarian Tidak Ditemukan'**
  String get searchNotFoundTitle;

  /// No description provided for @searchNotFoundMessage.
  ///
  /// In id, this message translates to:
  /// **'Kata kunci yang Anda masukkan tidak ditemukan. Silahkan cek kembali.'**
  String get searchNotFoundMessage;

  /// No description provided for @loadingDataErrorMessageNoDot.
  ///
  /// In id, this message translates to:
  /// **'Gagal Memuat Data'**
  String get loadingDataErrorMessageNoDot;

  /// No description provided for @tryAgain.
  ///
  /// In id, this message translates to:
  /// **'Coba Lagi'**
  String get tryAgain;

  /// No description provided for @networkErrorMessage.
  ///
  /// In id, this message translates to:
  /// **'Tidak ada koneksi internet'**
  String get networkErrorMessage;

  /// No description provided for @connectionTimeoutMessage.
  ///
  /// In id, this message translates to:
  /// **'Connection Timeout'**
  String get connectionTimeoutMessage;

  /// No description provided for @commonErrorMessage.
  ///
  /// In id, this message translates to:
  /// **'Terjadi kesalahan'**
  String get commonErrorMessage;

  /// No description provided for @loadingDataErrorMessage.
  ///
  /// In id, this message translates to:
  /// **'Gagal Memuat Data.'**
  String get loadingDataErrorMessage;

  /// No description provided for @searchResult.
  ///
  /// In id, this message translates to:
  /// **'Search Result'**
  String get searchResult;

  /// No description provided for @searchResultHistory.
  ///
  /// In id, this message translates to:
  /// **'Search Result History'**
  String get searchResultHistory;

  /// No description provided for @home.
  ///
  /// In id, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @takeCamera.
  ///
  /// In id, this message translates to:
  /// **'Take Camera'**
  String get takeCamera;

  /// No description provided for @getFromGallery.
  ///
  /// In id, this message translates to:
  /// **'Get from Gallery'**
  String get getFromGallery;

  /// No description provided for @logout.
  ///
  /// In id, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @searchForDescription.
  ///
  /// In id, this message translates to:
  /// **'Searched: {s}'**
  String searchForDescription(String s);

  /// No description provided for @duplicateSaveSearchedErrorMessage.
  ///
  /// In id, this message translates to:
  /// **'Tidak bisa menyimpan, data dengan title yang sama sudah tersimpan'**
  String get duplicateSaveSearchedErrorMessage;

  /// No description provided for @saveSearchSuccess.
  ///
  /// In id, this message translates to:
  /// **'Data tersimpan'**
  String get saveSearchSuccess;

  /// No description provided for @history.
  ///
  /// In id, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @emptyHistoryMessage.
  ///
  /// In id, this message translates to:
  /// **'History masih kosong.'**
  String get emptyHistoryMessage;

  /// No description provided for @enter.
  ///
  /// In id, this message translates to:
  /// **'Masuk'**
  String get enter;

  /// No description provided for @userId.
  ///
  /// In id, this message translates to:
  /// **'User ID'**
  String get userId;

  /// No description provided for @password.
  ///
  /// In id, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @rememberMe.
  ///
  /// In id, this message translates to:
  /// **'Ingat Saya'**
  String get rememberMe;

  /// No description provided for @camera.
  ///
  /// In id, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In id, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @chooseOptionForTakingImage.
  ///
  /// In id, this message translates to:
  /// **'Pilih opsi pengambilan gambar'**
  String get chooseOptionForTakingImage;

  /// No description provided for @searchProduct.
  ///
  /// In id, this message translates to:
  /// **'Pencarian Produk'**
  String get searchProduct;

  /// No description provided for @or.
  ///
  /// In id, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @selectFromGallery.
  ///
  /// In id, this message translates to:
  /// **'Select from gallery'**
  String get selectFromGallery;

  /// No description provided for @retakeImage.
  ///
  /// In id, this message translates to:
  /// **'Retake Image'**
  String get retakeImage;

  /// No description provided for @selectProduct.
  ///
  /// In id, this message translates to:
  /// **'Select Product'**
  String get selectProduct;

  /// No description provided for @viewInBrowser.
  ///
  /// In id, this message translates to:
  /// **'View in Browser'**
  String get viewInBrowser;

  /// No description provided for @saveSearchResult.
  ///
  /// In id, this message translates to:
  /// **'Save Search Result'**
  String get saveSearchResult;

  /// No description provided for @save.
  ///
  /// In id, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In id, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @seeHistory.
  ///
  /// In id, this message translates to:
  /// **'Lihat History'**
  String get seeHistory;

  /// No description provided for @invalidUrl.
  ///
  /// In id, this message translates to:
  /// **'URL is invalid!'**
  String get invalidUrl;

  /// No description provided for @successfullySubmitted.
  ///
  /// In id, this message translates to:
  /// **'Yeay! berhasil tersimpan'**
  String get successfullySubmitted;

  /// No description provided for @successfullySubmittedDescription.
  ///
  /// In id, this message translates to:
  /// **'Saat ini datamu sudah disimpan silakan kembali ke opsi pengambilan gambar'**
  String get successfullySubmittedDescription;

  /// No description provided for @returnToMainMenu.
  ///
  /// In id, this message translates to:
  /// **'Kembali ke menu utama'**
  String get returnToMainMenu;

  /// No description provided for @ok.
  ///
  /// In id, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @searchBarPlaceholder.
  ///
  /// In id, this message translates to:
  /// **'Search with ID / Product Name...'**
  String get searchBarPlaceholder;

  /// No description provided for @noData.
  ///
  /// In id, this message translates to:
  /// **'Tidak ada data.'**
  String get noData;

  /// No description provided for @chooseOptionSync.
  ///
  /// In id, this message translates to:
  /// **'Pilih opsi sync harga'**
  String get chooseOptionSync;

  /// No description provided for @dashboard.
  ///
  /// In id, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @takePicture.
  ///
  /// In id, this message translates to:
  /// **'Ambil Gambar'**
  String get takePicture;

  /// No description provided for @chooseOptionToGetImage.
  ///
  /// In id, this message translates to:
  /// **'Pilih opsi ambil gambar'**
  String get chooseOptionToGetImage;

  /// No description provided for @failedUploadImage.
  ///
  /// In id, this message translates to:
  /// **'Gagal upload image'**
  String get failedUploadImage;

  /// No description provided for @submitProduct.
  ///
  /// In id, this message translates to:
  /// **'Submit Product'**
  String get submitProduct;

  /// No description provided for @productSubmissionConfirmationMessage.
  ///
  /// In id, this message translates to:
  /// **'Apakah anda yakin untuk submit produk ini?'**
  String get productSubmissionConfirmationMessage;

  /// No description provided for @yes.
  ///
  /// In id, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @priceSearchingSystem.
  ///
  /// In id, this message translates to:
  /// **'Sistem Pencarian Harga'**
  String get priceSearchingSystem;

  /// No description provided for @getProductPhotoWithCameraOrGallery.
  ///
  /// In id, this message translates to:
  /// **'Ambil foto produk atau cari produk anda dari galeri'**
  String get getProductPhotoWithCameraOrGallery;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
