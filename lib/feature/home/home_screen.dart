// lib/feature/home/home_screen.dart

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
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/home/home_screen_controller.dart';
import 'package:fskeleton/feature/home/setting_screen.dart';
import 'package:fskeleton/feature/result/product_detail_params.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _controller = HomeScreenController.provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(_controller.notifier).onScreenLoaded();
    });
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
        imageUrl: productData.imageUrl,
        localImagePath: image.path,
        listEcomerce: productData.listEcomerce,
      );

      final shouldRefresh = await context.pushNamed<bool>(
        AppRouter.productDetailRoute,
        extra: params,
      );

      if (shouldRefresh == true) {
        ref.read(_controller.notifier).loadProducts();
      }
    } else if (mounted) {
      showMyAlert(
        context: context,
        data: const MyAlertData(
          title: "Gagal Mengidentifikasi Produk",
          content:
              "Sistem tidak dapat mengenali produk dari gambar yang diberikan.",
          primaryButton: "Mengerti",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 64,
          backgroundColor: Colors.white,
          actions: [_appBarSettings(context)],
        ),
        backgroundColor: MyColors.white,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => ref.read(_controller.notifier).loadProducts(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      "Sistem Pencarian Harga",
                      style: MyText.lgSemiBold.copyWith(color: MyColors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      context.localizations.getProductPhotoWithCameraOrGallery,
                      textAlign: TextAlign.center,
                      style: MyText.xs.copyWith(color: MyColors.neutral80),
                    ),
                    const SizedBox(height: 40),
                    _dashboardContent(),
                    const SizedBox(height: 40),
                    _scanHistoryBox(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dashboardContent() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => context.pushNamed(AppRouter.searchRoute),
            child: AbsorbPointer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Product...",
                  prefixIcon:
                      const Icon(Icons.search, color: MyColors.neutral70),
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: MyColors.neutral40),
                  ),
                  filled: true,
                  fillColor: MyColors.neutral30,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: MyColors.neutral40),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
              color: MyColors.neutral50,
              borderRadius: BorderRadius.circular(12)),
          child: IconButton(
            onPressed: () => _showImagePickerBottomSheet(),
            icon: const Icon(Icons.camera_alt_rounded),
            color: MyColors.blueSource,
          ),
        )
      ],
    );
  }

  Widget _appBarSettings(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: TextButton.icon(
        onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SettingScreen();
                  },
                ),
              ),
        icon: const Icon(Icons.settings, color: MyColors.primary500),
        label: Text(
          "Pengaturan",
          style: MyText.sm.copyWith(color: MyColors.primary500),
        ),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _scanHistoryBox() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MyColors.neutral40),
      ),
      child: Column(children: [_historyHeader(), _historyList()]),
    );
  }

  Widget _historyHeader() {
    return Container(
      decoration: const BoxDecoration(
          color: MyColors.bodyBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          )),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Scan History", style: MyText.smSemiBold),
            MyTextButton(
              onPressed: () => context.pushNamed(AppRouter.historyRoute),
              label: Text(
                "Lihat Semua",
                style: MyText.xsSemiBold.copyWith(color: MyColors.primary500),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _historyList() {
    final productsAsync = ref.watch(_controller.select((s) => s.products));
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
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: itemsToShow
                .map((product) =>
                    _historyItem(product, product == itemsToShow.last))
                .toList(),
          ),
        );
      },
      error: (e, s) => Padding(
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

  // --- WIDGET INI TELAH DIPERBAIKI ---
  Widget _historyItem(WmsProduct product, bool isLast) {
    const wmsBaseUrl = "https://wms-server.digitalindustryagency.com";

    // Logika untuk menentukan URL gambar yang akan ditampilkan
    String? displayImageUrl;
    if (product.image != null && product.image!.startsWith('http')) {
      displayImageUrl = product.image;
    } else if (product.imageUrl != null && product.imageUrl!.isNotEmpty) {
      displayImageUrl = wmsBaseUrl + product.imageUrl!;
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (displayImageUrl != null)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: displayImageUrl,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => _imagePlaceholder(),
                      placeholder: (_, __) => _imagePlaceholder(),
                    ),
                  ),
                )
              else
                _imagePlaceholder(),
              const SizedBox(width: 12),
              // Status tidak ada di respons baru, jadi kita bisa hilangkan atau beri default
              // _statusChip("Lolos"),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  product.productName,
                  style: MyText.sm,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        if (!isLast) const Divider(height: 1, color: MyColors.neutral40),
      ],
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

  void _showImagePickerBottomSheet() {
    showMyBottomSheet(context: context, child: _bottomSheetContent());
  }

  Widget _bottomSheetContent() {
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
                image: Image.asset('assets/images/camera_icon.png', width: 80),
                onPressed: () async {
                  Navigator.pop(context);
                  if (await _requestPermissionAndRedirect(isCamera: true)) {
                    await _cameraOrImagePickerAction(isCamera: true);
                  }
                },
              ),
              const SizedBox(width: 40),
              Text('or', style: MyText.xl.copyWith(color: MyColors.neutral70)),
              const SizedBox(width: 40),
              _bigButton(
                title: context.localizations.gallery,
                image: Image.asset('assets/images/gallery_icon.png', width: 80),
                onPressed: () async {
                  Navigator.pop(context);
                  if (await _requestPermissionAndRedirect(isCamera: false)) {
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

  Widget _bigButton({
    required String title,
    required Widget image,
    double size = 120.0,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: size,
        height: 120,
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
    Permission permission;

    if (isCamera) {
      permission = Permission.camera;
    } else {
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt >= 33) {
          permission = Permission.photos;
        } else {
          permission = Permission.storage;
        }
      } else {
        permission = Permission.photos;
      }
    }

    final status = await permission.request();

    if (status.isGranted) {
      return true;
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      if (mounted) {
        _showPermissionDialog(isCamera: isCamera);
      }
    }

    return false;
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
