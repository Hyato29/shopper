import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fskeleton/app/common/common_controller.dart';
import 'package:fskeleton/app/localizations/ui_text.dart';
import 'package:fskeleton/app/ui/loading_overlay.dart';
import 'package:fskeleton/app/ui/my_snack_bar.dart';
import 'package:fskeleton/core.dart';

/// Handle common features like loading overlay, showing dialog,
/// showing snackbar
class CommonScreen extends ConsumerWidget {
  const CommonScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenError(context, ref);

    return LoadingOverlay(
      uiState: ref.watch(
        CommonController.provider.select((state) => state.overlayUiState),
      ),
      child: child,
    );
  }

  void _listenError(BuildContext context, WidgetRef ref) {
    ref.listen(
      CommonController.provider.select((state) => state.error),
      (previous, error) {
        final errorAction = ref.read(
          CommonController.provider.select((state) => state.errorAction),
        );
        final shouldRetry = errorAction != null;
        void onAction() {
          if (errorAction != null) {
            errorAction.call();
            ref.read(CommonController.provider.notifier).resetErrorAction();
          }
        }

        if (error != null && ModalRoute.of(context)?.isCurrent == true) {
          switch (error.runtimeType) {
            case SocketException:
              _showNetworkErrorMessage(context, onAction, shouldRetry);
              break;
            case SessionExpiredException:
              //Not show anything, already handled in login screen
              break;
            case TimeoutException:
            case ConnectionTimeoutException:
            default:
              _showGeneralErrorMessage(context, onAction, shouldRetry);
              break;
          }
        }
      },
    );
  }

  void _showGeneralErrorMessage(
    BuildContext context,
    VoidCallback errorAction,
    bool shouldRetry,
  ) {
    showMySnackBar(
      context,
      MySnackBarData(
        message: context.localizations.commonErrorMessage,
        action: shouldRetry
            ? context.localizations.tryAgain
            : context.localizations.ok,
        type: MySnackBarType.error,
        onAction: errorAction,
      ),
    );
  }

  void _showNetworkErrorMessage(
    BuildContext context,
    VoidCallback errorAction,
    bool shouldRetry,
  ) {
    // TODO: Show snackbar here...
  }
}
