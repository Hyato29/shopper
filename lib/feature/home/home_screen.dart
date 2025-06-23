import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fskeleton/app/common/common_screen.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/localizations/ui_text.dart';
import 'package:fskeleton/app/navigation/router.dart';
import 'package:fskeleton/app/ui/bottom_sheet.dart';
import 'package:fskeleton/app/ui/buttons/my_text_button.dart';
import 'package:fskeleton/app/ui/empty_state.dart';
import 'package:fskeleton/app/ui/image_picker_service.dart';
import 'package:fskeleton/app/ui/my_alert.dart';
import 'package:fskeleton/app/ui/my_snack_bar.dart';
import 'package:fskeleton/app/ui/tablet_detector.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/home/home_screen_controller.dart';
import 'package:fskeleton/feature/home/result_screen_params.dart';
import 'package:fskeleton/feature/product_detail/product_detail_params.dart';
import 'package:fskeleton/feature/webview/webview_screen_params.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
    required this.onSuccessUpload,
    required this.navigateToSearch,
  });

  final Function(WebViewScreenParams) onSuccessUpload;
  final VoidCallback navigateToSearch;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _controller = HomeScreenController.provider;
  final Permission _cameraPermission = Permission.camera;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(_controller.notifier).onScreenLoaded();
    });
  }

  @override
  void dispose() {
    if (context.mounted) ref.invalidate(_controller);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listenUploadFileException();
    // _listenToSavedResultSearch();
    _listenToLensKeyword();

    return CommonScreen(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            context.localizations.priceSearchingSystem,
            style: MyText.baseSemiBold,
          ),
          actions: [
            _appBarSettings(context),
          ],
        ),
        backgroundColor: MyColors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    context.localizations.getProductPhotoWithCameraOrGallery,
                    style: MyText.xs.copyWith(color: MyColors.neutral80),
                  ),
                  const SizedBox(height: 16),
                  _dashboardContent(),
                  _scanHistoryBox(),
                  const SizedBox(height: 20),
                  _appVersionWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _appBarSettings(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: PopupMenuButton<String>(
        position: PopupMenuPosition.under,
        borderRadius: BorderRadius.circular(8),
        onSelected: (value) {
          if (value == 'Logout') {
            ref.read(_controller.notifier).onLogout();
            context.pushNamed(AppRouter.searchRoute);
          } else if (value == 'Printer') {}
        },
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              value: 'Logout',
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const PopupMenuItem(
              value: 'Printer',
              child: Text(
                'Printer',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ];
        },
        icon: const Icon(
          Icons.settings,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _scanHistoryBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _historyHeader(),
          const SizedBox(height: 10),
          _historyList(),
        ],
      ),
    );
  }

  Widget _historyHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Scan History", style: MyText.smSemiBold),
          MyTextButton(
            onPressed: () {
              context.pushNamed(AppRouter.historyRoute);
            },
            label: Text(
              "Lihat Semua",
              style: MyText.smSemiBold.copyWith(color: MyColors.primary500),
            ),
          )
        ],
      ),
    );
  }

  Widget _historyList() {
    final products = ref.watch(_controller.select((state) => state.products));

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(_controller.notifier).onScreenLoaded();
      },
      child: products.when(
        data: (data) {
          if (data.isEmpty) {
            return const MyEmptyState.empty(
              title: "Belum ada riwayat",
              description: "Hasil pindaian Anda akan muncul di sini.",
              centered: false,
            );
          }
          final itemsToShow = data.take(3).toList();
          return Container(
            height: 350,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              physics:
                  const AlwaysScrollableScrollPhysics(), // Tambahkan ini agar RefreshIndicator berfungsi saat konten tidak cukup panjang
              child: Column(
                children: itemsToShow
                    .map((product) => _historyItem(product))
                    .toList(),
              ),
            ),
          );
        },
        error: (_, __) => Text("Gagal memuat riwayat", style: MyText.sm),
        loading: () => const Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _historyItem(WmsProduct product) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar Produk
                if (product.image != null && product.image!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: product.image!,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => _imagePlaceholder(),
                      placeholder: (context, url) => _imagePlaceholder(),
                    ),
                  )
                else
                  _imagePlaceholder(),
                const SizedBox(width: 12),
                _statusChip(product),
                const SizedBox(width: 12),
                // Detail Produk
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName,
                        style: MyText.sm,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Status Chip
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Widget _statusChip(WmsProduct product) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: MyColors.success50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "Lolos",
        style: MyText.xsSemiBold.copyWith(color: MyColors.success700),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: MyColors.neutral30,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.image_not_supported_outlined,
          color: MyColors.neutral70, size: 24),
    );
  }

  Widget _appVersionWidget() {
    return Consumer(
      builder: (context, ref, child) {
        final version = ref.watch(
          _controller.select((state) => state.appVersion),
        );

        return version.isNotEmpty
            ? Text(
                version,
                style: MyText.xs.copyWith(
                  color: MyColors.neutral70,
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }

  Widget _bottomSheetContent() {
    final isTablet = TabletDetector.isTablet(MediaQuery.of(context));
    final buttonSize = isTablet ? 160.0 : 120.0;
    const imageSize = 80.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 40),
          Text(
            context.localizations.chooseOptionToGetImage,
            style: MyText.base,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _bigButton(
                title: context.localizations.camera,
                image: Image.asset(
                  'assets/images/camera_icon.png',
                  width: imageSize,
                  height: imageSize,
                ),
                size: buttonSize,
                onPressed: () async {
                  Navigator.pop(context);
                  final isPermitted = await _requestPermissionAndRedirect(
                    isCamera: true,
                    context: context,
                  );
                  if (isPermitted) {
                    await _cameraOrImagePickerAction(isCamera: true);
                  }
                },
              ),
              const SizedBox(width: 40),
              Text(
                'or',
                style: MyText.xl.copyWith(color: MyColors.neutral70),
              ),
              const SizedBox(width: 40),
              _bigButton(
                title: context.localizations.gallery,
                image: Image.asset(
                  'assets/images/gallery_icon.png',
                  width: imageSize,
                  height: imageSize,
                ),
                size: buttonSize,
                onPressed: () async {
                  Navigator.pop(context);

                  // TODO: This is blasphemy!!1!11
                  await _cameraOrImagePickerAction(isCamera: false);
                  return;
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _dashboardContent() {
    final isTablet = TabletDetector.isTablet(MediaQuery.of(context));
    final buttonSize = isTablet ? 160.0 : 120.0;
    const imageSize = 80.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _bigButton(
                title: context.localizations.takePicture,
                image: Image.asset(
                  'assets/images/image_icon.png',
                  width: imageSize,
                  height: imageSize,
                ),
                size: buttonSize,
                onPressed: () {
                  _showImagePickerBottomSheet();
                },
              ),
              const SizedBox(width: 40),
              Text(
                'or',
                style: MyText.xl.copyWith(color: MyColors.neutral70),
              ),
              const SizedBox(width: 40),
              _bigButton(
                title: context.localizations.searchProduct,
                image: Image.asset(
                  'assets/images/search_icon.png',
                  width: imageSize,
                  height: imageSize,
                ),
                size: buttonSize,
                onPressed: () async {
                  widget.navigateToSearch();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _cameraOrImagePickerAction({required bool isCamera}) async {
    final image = await ref
        .read(ImagePickerService.provider)
        .pickImage(context: context, isFromCamera: isCamera);

    if (image == null || !mounted) return;

    // Menggunakan nama fungsi yang benar yaitu 'processImage'
    final productData = await ref
        .read(_controller.notifier)
        .processImage(file: File(image.path));

    // Jika berhasil, kita navigasi ke halaman detail produk
    if (productData != null && mounted) {
      final params = ProductDetailParams(
        productName: productData.productName,
        productPrice: productData.productPrice,
      );

      // Tunggu hasil dari halaman detail (jika user menekan simpan, kita dapat 'true')
      final shouldRefresh = await context.pushNamed<bool>(
        AppRouter.productDetailRoute,
        extra: params,
      );

      // Jika halaman detail mengirim `true`, refresh riwayat di halaman utama
      if (shouldRefresh == true) {
        ref.read(_controller.notifier).loadProducts();
      }
    }
  }

  Widget _bigButton({
    required String title,
    required Widget image,
    double size = 160.0,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: 180,
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image,
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  title,
                  style: MyText.sm,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPermissionAndRedirect({
    required BuildContext context,
    required bool isCamera,
  }) async {
    if (isCamera) {
      final permissionStatus = await _cameraPermission.request();
      switch (permissionStatus) {
        case PermissionStatus.denied:
        case PermissionStatus.permanentlyDenied:
          if (!context.mounted) return false;
          _showCameraPermissionDialog(context);
          return false;
        case PermissionStatus.granted:
        case PermissionStatus.restricted:
        case PermissionStatus.limited:
        case PermissionStatus.provisional:
          return true;
      }
    } else {
      if (Platform.isIOS) return true;
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final permissionStatus = androidInfo.version.sdkInt >= 33
          ? await Permission.photos.request()
          : await Permission.storage.request();
      switch (permissionStatus) {
        case PermissionStatus.denied:
        case PermissionStatus.permanentlyDenied:
          if (!context.mounted) return false;
          _showGalleryPermissionDialog(context);
          return false;
        case PermissionStatus.granted:
        case PermissionStatus.restricted:
        case PermissionStatus.limited:
        case PermissionStatus.provisional:
          return true;
      }
    }
  }

  void _showCameraPermissionDialog(BuildContext context) {
    showMyAlert(
      context: context,
      data: MyAlertData(
        title: context.localizations.cameraPermissionTitle,
        content: context.localizations.cameraPermissionDescription2,
        primaryButton: context.localizations.give,
        secondaryButton: context.localizations.abort,
        onPrimaryButtonPressed: () async {
          openAppSettings();
        },
      ),
    );
  }

  void _showGalleryPermissionDialog(BuildContext context) {
    showMyAlert(
      context: context,
      data: MyAlertData(
        title: context.localizations.galleryPermissionTitle,
        content: context.localizations.galleryPermissionDescription,
        primaryButton: context.localizations.give,
        secondaryButton: context.localizations.abort,
        onPrimaryButtonPressed: () async {
          openAppSettings();
        },
      ),
    );
  }

  void _listenUploadFileException() {
    ref.listen(_controller.select((value) => value.uploadFileException),
        (previous, next) {
      showMySnackBar(
        context,
        MySnackBarData(
          type: MySnackBarType.error,
          message: context.localizations.failedUploadImage,
        ),
      );
    });
  }

  void _showImagePickerBottomSheet() {
    showMyBottomSheet(
      context: context,
      child: _bottomSheetContent(),
    );
  }

  void _listenToLensKeyword() {
    ref.listen(
      _controller.select((value) => value.lensKeyword),
      (previous, next) async {
        if (next == null) return;

        final keyword = ref.watch(
          _controller.select((state) => state.lensKeyword),
        );
        final uploadedFile = ref.watch(
          _controller.select((state) => state.uploadedFile),
        );

        final uploadedFileUrl = ref.watch(
          _controller.select((state) => state.uploadedFileUrl),
        );

        if (uploadedFile == null || uploadedFileUrl == null) {
          return;
        }

        final imageBytes = uploadedFile.readAsBytesSync();
        final resultScreenParam = ResultScreenParams(
          keyword: keyword?.data ?? '',
          fileUrl: uploadedFileUrl,
          image: base64Encode(imageBytes),
        );
        final result = await context.pushNamed(
          AppRouter.resultRoute,
          extra: resultScreenParam,
        );
        if (result != null && result == true) {
          ref.read(_controller.notifier).onClearSavedResultSearch();
        }
      },
    );
  }
}
