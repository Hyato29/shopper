import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fskeleton/app/common/common_screen.dart';
import 'package:fskeleton/app/localizations/ui_text.dart';
import 'package:fskeleton/app/navigation/router.dart';
import 'package:fskeleton/app/ui/bottom_sheet.dart';
import 'package:fskeleton/app/ui/buttons/my_text_button.dart';
import 'package:fskeleton/app/ui/image_picker_service.dart';
import 'package:fskeleton/app/ui/my_alert.dart';
import 'package:fskeleton/app/ui/my_snack_bar.dart';
import 'package:fskeleton/app/ui/tablet_detector.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/home/home_screen_controller.dart';
import 'package:fskeleton/feature/home/result_screen_params.dart';
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
        backgroundColor: MyColors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localizations.priceSearchingSystem,
              style: MyText.baseSemiBold,
            ),
            const SizedBox(height: 8),
            Text(
              context.localizations.getProductPhotoWithCameraOrGallery,
              style: MyText.xs.copyWith(color: MyColors.neutral80),
            ),
            const SizedBox(height: 16),
            _dashboardContent(),
            const SizedBox(height: 16),
            _appVersionWidget(),
          ],
        ),
      ),
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

                  final isPermitted = await _requestPermissionAndRedirect(
                    isCamera: false,
                    context: context,
                  );
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
          const SizedBox(height: 20),
          MyTextButton(
            label: Text('Logout', style: MyText.xs),
            leading: const Icon(CupertinoIcons.arrow_left_circle),
            onPressed: () {
              ref.read(_controller.notifier).onLogout();
              context.pushNamed(AppRouter.searchRoute);
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

    if (image == null) return;
    await ref.read(_controller.notifier).uploadFile(file: File(image.path));
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
          fileUrl: uploadedFileUrl ?? '',
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

  void _listenToSavedResultSearch() {
    ref.listen(
      _controller.select((value) => value.savedResultSearch),
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
          fileUrl: uploadedFileUrl ?? '',
          image: base64Encode(imageBytes),
          savedSearch: next.data,
        );
        final result = await context.pushNamed(AppRouter.resultRoute,
            extra: resultScreenParam);
        if (result != null && result == true) {
          ref.read(_controller.notifier).onClearSavedResultSearch();
        }
      },
    );
  }
}
