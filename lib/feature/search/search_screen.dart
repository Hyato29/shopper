import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fskeleton/app/common/common_screen.dart';
import 'package:fskeleton/app/data/wms/model/wms_product.dart';
import 'package:fskeleton/app/localizations/ui_text.dart';
import 'package:fskeleton/app/ui/bottom_sheet.dart';
import 'package:fskeleton/app/ui/buttons/button_size.dart';
import 'package:fskeleton/app/ui/buttons/my_primary_button.dart';
import 'package:fskeleton/app/ui/common_loading.dart';
import 'package:fskeleton/app/ui/empty_state.dart';
import 'package:fskeleton/app/ui/image_picker_service.dart';
import 'package:fskeleton/app/ui/my_alert.dart';
import 'package:fskeleton/app/ui/my_snack_bar.dart';
import 'package:fskeleton/app/ui/my_text_field.dart';
import 'package:fskeleton/app/ui/tablet_detector.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/app/utils/string_formatter.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/search/search_screen_controller.dart';
import 'package:fskeleton/feature/webview/webview_screen_params.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({
    super.key,
    required this.onSuccessUpload,
    required this.navigateToSuccessScreen,
  });

  final Function(WebViewScreenParams) onSuccessUpload;
  final VoidCallback navigateToSuccessScreen;

  @override
  ConsumerState<SearchScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<SearchScreen> {
  final _controller = SearchScreenController.provider;
  final Permission _cameraPermission = Permission.camera;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ref.read(_controller.notifier).loadNextProducts();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(_controller.notifier).onScreenLoaded();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listenUploadFileException();
    _listenAddProduct();

    return CommonScreen(
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            toolbarHeight: 90,
            title: Text(
              context.localizations.searchProduct,
              style: MyText.base,
            ),
            leading: InkWell(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back, color: MyColors.black),
            ),
            backgroundColor: MyColors.white,
            bottomOpacity: 0,
          ),
        ),
        body: Column(
          children: [
            _searchField(),
            Expanded(child: _productList()),
          ],
        ),
      ),
    );
  }

  Widget _productList() {
    return Consumer(
      builder: (context, ref, child) {
        final products =
            ref.watch(_controller.select((state) => state.products));

        return products.when(
          data: (data) {
            if (data.isEmpty) {
              return MyEmptyState.empty(
                title: context.localizations.noData,
                buttonWidget: MyPrimaryButton(
                  label: Text(context.localizations.chooseOptionToGetImage),
                  buttonSize: ButtonSize.small,
                  onPressed: () {
                    context.pop(true);
                  },
                ),
              );
            }

            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  ...data.map((e) => _singleProduct(e)),
                  _loadingBottomWidget(),
                ],
              ),
            );
          },
          error: (_, __) {
            return MyEmptyState.error(
              context: context,
              onRetried: ref.read(_controller.notifier).onRetrySeach,
            );
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  Widget _singleProduct(WmsProduct data) {
    const verticalPadding = 20.0;

    return InkWell(
      onTap: () {
        showMyAlert(
          context: context,
          data: MyAlertData(
            title: context.localizations.submitProduct,
            content: context.localizations.productSubmissionConfirmationMessage,
            primaryButton: context.localizations.yes,
            secondaryButton: context.localizations.cancel,
            onPrimaryButtonPressed: () {
              ref.read(_controller.notifier).onProductTapped(data);
            },
          ),
        );
      },
      child: Column(
        children: [
          const SizedBox(height: verticalPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.productName,
                        style: MyText.sm,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _priceChip(data.productPrice),
              ],
            ),
          ),
          const SizedBox(height: verticalPadding),
          const Divider(height: 1),
        ],
      ),
    );
  }

  Widget _priceChip(String price) {
    final formattedPrice = double.parse(price).truncate().toCurrencyFormat();

    return Container(
      decoration: BoxDecoration(
        color: MyColors.neutral30,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/pricetag.svg', width: 14),
            const SizedBox(width: 4),
            Text(formattedPrice, style: MyText.xsSemiBold),
          ],
        ),
      ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: MyTextField(
        placeholder: context.localizations.searchBarPlaceholder,
        trailingIconMode: TrailingIconMode.clear,
        onChanged: ref.read(_controller.notifier).onChangeSearchKey,
      ),
    );
  }

  Widget _tabletContent() {
    final isTablet = TabletDetector.isTablet(MediaQuery.of(context));
    final buttonSize = isTablet ? 160.0 : 120.0;
    const imageSize = 40.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 40),
          Text(
            context.localizations.chooseOptionToGetImage,
            style: isTablet ? MyText.xl : MyText.base,
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

  Future<void> _cameraOrImagePickerAction({required bool isCamera}) async {
    final image = await ref.read(ImagePickerService.provider).pickImage(
          context: context,
          isFromCamera: isCamera,
        );

    if (image == null) return;
    await ref.read(_controller.notifier).uploadFile(
          file: File(image.path),
          onSuccess: (uploadedUrl) async {
            final imageBytes = File(image.path).readAsBytesSync();
            final params = WebViewScreenParams(
              fileUrl: uploadedUrl,
              image: base64Encode(imageBytes),
            );
            widget.onSuccessUpload(params);
          },
        );
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
        height: size,
        decoration: BoxDecoration(
          color: MyColors.white,
          border: Border.all(color: MyColors.neutral50),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image,
              const SizedBox(height: 8),
              Text(title, style: MyText.base),
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
          message: context.localizations.failedSystemGetData,
        ),
      );
    });
  }

  void _listenAddProduct() {
    ref.listen(
      _controller.select((value) => value.addProductSuccess),
      (previous, next) {
        widget.navigateToSuccessScreen();
      },
    );
  }

  void _showImagePickerBottomSheet() {
    showMyBottomSheet(
      context: context,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.white,
          border: Border.all(color: MyColors.neutral50),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
        ),
        child: _tabletContent(),
      ),
    );
  }

  Widget _loadingBottomWidget() {
    return Consumer(
      builder: (context, ref, child) {
        final isLoading =
            ref.watch(_controller.select((value) => value.nextPageLoading));
        if (isLoading != null) {
          return isLoading.data
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CommonLoading(ballColor: Colors.lightBlue),
                  ),
                )
              : const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
