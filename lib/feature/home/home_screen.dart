// lib/feature/home/home_screen.dart

import 'dart:ffi';
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
import 'package:fskeleton/app/ui/tablet_detector.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/home/home_screen_controller.dart';
import 'package:fskeleton/feature/product_detail/product_detail_params.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: must_be_immutable
class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({required this.navigateToSearch, super.key});
  VoidCallback navigateToSearch;

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
  Widget build(BuildContext context) {
    return CommonScreen(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            context.localizations.priceSearchingSystem,
            style: MyText.baseSemiBold,
          ),
          actions: [_appBarSettings(context)],
        ),
        backgroundColor: MyColors.white,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => ref.read(_controller.notifier).loadProducts(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
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
          }
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(value: 'Logout', child: Text('Logout')),
          const PopupMenuItem(value: 'Printer', child: Text('Printer')),
        ],
        icon: const Icon(Icons.settings, color: Colors.blue),
      ),
    );
  }

  Widget _scanHistoryBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: MyColors.bodyBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MyColors.neutral40),
      ),
      child: Column(
        children: [_historyHeader(), _historyList()],
      ),
    );
  }

  Widget _historyHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Scan History", style: MyText.smSemiBold),
          MyTextButton(
            onPressed: () => context.pushNamed(AppRouter.historyRoute),
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
    final productsAsync =
        ref.watch(_controller.select((state) => state.products));
    return productsAsync.when(
      data: (products) {
        if (products.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: MyEmptyState.empty(
              title: "Belum ada riwayat",
              description: "Hasil pindaian Anda akan muncul di sini.",
            ),
          );
        }
        final itemsToShow = products.take(3).toList();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: itemsToShow
                .map((product) =>
                    _historyItem(product, product == itemsToShow.last))
                .toList(),
          ),
        );
      },
      error: (err, stack) => Padding(
        padding: const EdgeInsets.all(20),
        child: MyEmptyState.error(
          context: context,
          onRetried: () => ref.read(_controller.notifier).loadProducts(),
        ),
      ),
      loading: () => const Padding(
        padding: EdgeInsets.all(40),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _historyItem(WmsProduct product, bool isLast) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gambar bisa ditambahkan di sini jika URL gambar disimpan di backend
              // _imagePlaceholder(),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  product.productName,
                  style: MyText.sm,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              if (product.status != null) _statusChip(product.status!),
            ],
          ),
        ),
        if (!isLast) const Divider(height: 1, color: MyColors.neutral40),
      ],
    );
  }

  Widget _statusChip(String status) {
    Color chipColor, textColor;
    switch (status.toLowerCase()) {
      case 'damaged':
        chipColor = MyColors.danger50;
        textColor = MyColors.danger700;
        break;
      case 'karantina':
        chipColor = MyColors.alert50;
        textColor = MyColors.alert700;
        break;
      default:
        chipColor = MyColors.success50;
        textColor = MyColors.success700;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(status, style: MyText.xsSemiBold.copyWith(color: textColor)),
    );
  }

  Widget _appVersionWidget() {
    final version = ref.watch(_controller.select((state) => state.appVersion));
    return version.isNotEmpty
        ? Text(version, style: MyText.xs.copyWith(color: MyColors.neutral70))
        : const SizedBox.shrink();
  }

  Widget _dashboardContent() {
    final isTablet = TabletDetector.isTablet(MediaQuery.of(context));
    final buttonSize = isTablet ? 160.0 : 120.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _bigButton(
            title: context.localizations.takePicture,
            image: Image.asset('assets/images/image_icon.png', width: 80),
            size: buttonSize,
            onPressed: () => _showImagePickerBottomSheet(),
          ),
          const SizedBox(width: 40),
          Text('or', style: MyText.xl.copyWith(color: MyColors.neutral70)),
          const SizedBox(width: 40),
          _bigButton(
            title: context.localizations.searchProduct,
            image: Image.asset('assets/images/search_icon.png', width: 80),
            size: buttonSize,
            onPressed: () async {
              widget.navigateToSearch();
            },
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

    final productData = await ref
        .read(_controller.notifier)
        .identifyProduct(file: File(image.path));

    if (productData != null && mounted) {
      final params = ProductDetailParams(
        productName: productData.productName,
        productPrice: productData.productPrice,
      );

      final shouldRefresh = await context.pushNamed<bool>(
        AppRouter.productDetailRoute,
        extra: params,
      );

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
    // ... (kode widget ini tidak berubah)
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: 180,
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: MyColors.neutral30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
    );
  }

  Future<bool> _requestPermissionAndRedirect({required bool isCamera}) async {
    // ... (kode ini tidak berubah)
    PermissionStatus permissionStatus;
    if (isCamera) {
      permissionStatus = await Permission.camera.request();
    } else {
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt >= 33) {
          permissionStatus = await Permission.photos.request();
        } else {
          permissionStatus = await Permission.storage.request();
        }
      } else {
        permissionStatus = await Permission.photos.request();
      }
    }

    if (permissionStatus.isGranted) {
      return true;
    }

    if (mounted) {
      _showPermissionDialog(isCamera: isCamera);
    }
    return false;
  }

  void _showImagePickerBottomSheet() {
    showMyBottomSheet(context: context, child: _bottomSheetContent());
  }

  Widget _bottomSheetContent() {
    // ... (kode ini tidak berubah)
    final isTablet = TabletDetector.isTablet(MediaQuery.of(context));
    final buttonSize = isTablet ? 160.0 : 120.0;
    const imageSize = 80.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 40),
          Text(context.localizations.chooseOptionToGetImage,
              style: MyText.base),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _bigButton(
                title: context.localizations.camera,
                image: Image.asset('assets/images/camera_icon.png',
                    width: imageSize),
                size: buttonSize,
                onPressed: () async {
                  Navigator.pop(context);
                  final isPermitted =
                      await _requestPermissionAndRedirect(isCamera: true);
                  if (isPermitted) {
                    await _cameraOrImagePickerAction(isCamera: true);
                  }
                },
              ),
              const SizedBox(width: 40),
              Text('or', style: MyText.xl.copyWith(color: MyColors.neutral70)),
              const SizedBox(width: 40),
              _bigButton(
                title: context.localizations.gallery,
                image: Image.asset('assets/images/gallery_icon.png',
                    width: imageSize),
                size: buttonSize,
                onPressed: () async {
                  Navigator.pop(context);
                  final isPermitted =
                      await _requestPermissionAndRedirect(isCamera: false);
                  if (isPermitted) {
                    await _cameraOrImagePickerAction(isCamera: false);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void _showPermissionDialog({required bool isCamera}) {
    showMyAlert(
      context: context,
      data: MyAlertData(
        title: isCamera
            ? context.localizations.cameraPermissionTitle
            : context.localizations.galleryPermissionTitle,
        content: isCamera
            ? context.localizations.cameraPermissionDescription2
            : context.localizations.galleryPermissionDescription,
        primaryButton: context.localizations.give,
        secondaryButton: context.localizations.abort,
        onPrimaryButtonPressed: () => openAppSettings(),
      ),
    );
  }
}
