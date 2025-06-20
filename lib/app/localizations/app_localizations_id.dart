// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get cameraPermissionTitle => 'Izinkan Akses Kamera';

  @override
  String get cameraPermissionDescription =>
      'Untuk memindai gambar, Anda harus memberikan akses kamera.';

  @override
  String get cameraPermissionDescription2 =>
      'Untuk dapat mengambil gambar, Anda harus memberikan akses kamera.';

  @override
  String get give => 'Berikan';

  @override
  String get abort => 'Batal';

  @override
  String get galleryPermissionTitle => 'Izinkan Akses Media';

  @override
  String get galleryPermissionDescription =>
      'Untuk mengunggah foto dari galeri, Anda harus memberikan akses media.';

  @override
  String get error => 'Error';

  @override
  String get generalErrorMessage =>
      'Maaf, sistem sedang mengalami gangguan. Silakan coba lagi.';

  @override
  String get back => 'Kembali';

  @override
  String get failedSystemGetData => 'Gagal mengambil data';

  @override
  String get errorStateMessage =>
      'Terjadi kegagalan saat mengambil data dari sistem. Harap coba lagi.';

  @override
  String get searchNotFoundTitle => 'Pencarian Tidak Ditemukan';

  @override
  String get searchNotFoundMessage =>
      'Kata kunci yang Anda masukkan tidak ditemukan. Silahkan cek kembali.';

  @override
  String get loadingDataErrorMessageNoDot => 'Gagal Memuat Data';

  @override
  String get tryAgain => 'Coba Lagi';

  @override
  String get networkErrorMessage => 'Tidak ada koneksi internet';

  @override
  String get connectionTimeoutMessage => 'Connection Timeout';

  @override
  String get commonErrorMessage => 'Terjadi kesalahan';

  @override
  String get loadingDataErrorMessage => 'Gagal Memuat Data.';

  @override
  String get searchResult => 'Search Result';

  @override
  String get searchResultHistory => 'Search Result History';

  @override
  String get home => 'Home';

  @override
  String get takeCamera => 'Take Camera';

  @override
  String get getFromGallery => 'Get from Gallery';

  @override
  String get logout => 'Logout';

  @override
  String searchForDescription(String s) {
    return 'Searched: $s';
  }

  @override
  String get duplicateSaveSearchedErrorMessage =>
      'Tidak bisa menyimpan, data dengan title yang sama sudah tersimpan';

  @override
  String get saveSearchSuccess => 'Data tersimpan';

  @override
  String get history => 'History';

  @override
  String get emptyHistoryMessage => 'History masih kosong.';

  @override
  String get enter => 'Masuk';

  @override
  String get userId => 'User ID';

  @override
  String get password => 'Password';

  @override
  String get rememberMe => 'Ingat Saya';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get chooseOptionForTakingImage => 'Pilih opsi pengambilan gambar';

  @override
  String get searchProduct => 'Pencarian Produk';

  @override
  String get or => 'or';

  @override
  String get selectFromGallery => 'Select from gallery';

  @override
  String get retakeImage => 'Retake Image';

  @override
  String get selectProduct => 'Select Product';

  @override
  String get viewInBrowser => 'View in Browser';

  @override
  String get saveSearchResult => 'Save Search Result';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get seeHistory => 'Lihat History';

  @override
  String get invalidUrl => 'URL is invalid!';

  @override
  String get successfullySubmitted => 'Yeay! berhasil tersimpan';

  @override
  String get successfullySubmittedDescription =>
      'Saat ini datamu sudah disimpan silakan kembali ke opsi pengambilan gambar';

  @override
  String get returnToMainMenu => 'Kembali ke menu utama';

  @override
  String get ok => 'Ok';

  @override
  String get searchBarPlaceholder => 'Search with ID / Product Name...';

  @override
  String get noData => 'Tidak ada data.';

  @override
  String get chooseOptionSync => 'Pilih opsi sync harga';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get takePicture => 'Ambil Gambar';

  @override
  String get chooseOptionToGetImage => 'Pilih opsi ambil gambar';

  @override
  String get failedUploadImage => 'Gagal upload image';

  @override
  String get submitProduct => 'Submit Product';

  @override
  String get productSubmissionConfirmationMessage =>
      'Apakah anda yakin untuk submit produk ini?';

  @override
  String get yes => 'Yes';

  @override
  String get priceSearchingSystem => 'Sistem Pencarian Harga';

  @override
  String get getProductPhotoWithCameraOrGallery =>
      'Ambil foto produk melalui akses kamera atau galeri.';
}
