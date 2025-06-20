import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fskeleton/app/localizations/ui_text.dart';
import 'package:fskeleton/app/ui/my_alert.dart';
import 'package:fskeleton/core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler show openAppSettings;

enum _PermissionErrorType { cameraAccessDenied, galleryAccessDenied }

class ImagePickerService {
  const ImagePickerService(this._imagePicker);

  static final provider = Provider((ref) => ImagePickerService(ImagePicker()));

  final ImagePicker _imagePicker;

  Future<XFile?> pickImage({
    required BuildContext context,
    required bool isFromCamera,
  }) async {
    final imageSource = isFromCamera ? ImageSource.camera : ImageSource.gallery;
    try {
      return await _imagePicker.pickImage(
        source: imageSource,
        maxWidth: 1000,
        maxHeight: 1000,
        requestFullMetadata: false,
      );
    } catch (e) {
      _handlePermissionError(context, e);
    }

    return null;
  }

  void _handlePermissionError(BuildContext context, Object error) {
    if (error is PlatformException) {
      switch (error.code) {
        case 'photo_access_denied':
          {
            _showPermissionDeniedAlert(
              context,
              _PermissionErrorType.galleryAccessDenied,
            );
            break;
          }
        case 'camera_access_denied':
          {
            _showPermissionDeniedAlert(
              context,
              _PermissionErrorType.cameraAccessDenied,
            );
            break;
          }
        default:
          break;
      }
    } else {
      _showGeneralError(context);
    }
  }

  void _showPermissionDeniedAlert(
    BuildContext context,
    _PermissionErrorType type,
  ) {
    showMyAlert(
      context: context,
      data: MyAlertData(
        title: type == _PermissionErrorType.cameraAccessDenied
            ? context.localizations.cameraPermissionTitle
            : context.localizations.galleryPermissionTitle,
        content: type == _PermissionErrorType.cameraAccessDenied
            ? context.localizations.cameraPermissionDescription2
            : context.localizations.galleryPermissionDescription,
        primaryButton: context.localizations.give,
        secondaryButton: context.localizations.abort,
        onPrimaryButtonPressed: permission_handler.openAppSettings,
      ),
    );
  }

  void _showGeneralError(BuildContext context) {
    showMyAlert(
      context: context,
      data: MyAlertData(
        title: context.localizations.error,
        content: context.localizations.generalErrorMessage,
        primaryButton: context.localizations.back,
      ),
    );
  }
}
