import 'package:flutter/material.dart';
import 'package:fskeleton/app/ui/buttons/button_size.dart';
import 'package:fskeleton/app/ui/buttons/my_danger_button.dart';
import 'package:fskeleton/app/ui/buttons/my_outline_button.dart';
import 'package:fskeleton/app/ui/buttons/my_primary_button.dart';
import 'package:fskeleton/app/ui/buttons/my_secondary_button.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';

Future<T?> showMyAlert<T>({
  required BuildContext context,
  required MyAlertData data,
  bool barrierDismissible = false,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: MyColors.black.withOpacity(0.7),
    builder: (context) {
      final alert = MyAlert(data: data);
      if (barrierDismissible) {
        return alert;
      } else {
        return PopScope(
          canPop: false,
          child: alert,
        );
      }
    },
  );
}

class MyAlertData {
  const MyAlertData({
    this.imageColor,
    this.imageBackgroundColor,
    required this.title,
    this.content,
    this.contentWidget,
    this.primaryButton,
    this.secondaryButton,
    this.isDestructive = false,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.shouldExpandButton = false,
    this.useVerticalButton = false,
    this.dismissOnButtonTap = true,
  }) : assert(content == null || contentWidget == null);

  final Color? imageColor;
  final Color? imageBackgroundColor;
  final String title;
  final String? content;
  final Widget? contentWidget;
  final String? primaryButton;
  final String? secondaryButton;
  final bool isDestructive;
  final VoidCallback? onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;
  final bool shouldExpandButton;
  final bool useVerticalButton;
  final bool dismissOnButtonTap;
}

class MyAlert extends StatelessWidget {
  const MyAlert({
    super.key,
    required this.data,
  });

  final MyAlertData data;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data.title,
                  style: MyText.xlSemiBold,
                  textAlign: TextAlign.center,
                ),
                if (data.content != null || data.contentWidget != null)
                  const SizedBox(height: 16),
                if (data.content != null)
                  Text(
                    data.content!,
                    style: MyText.base,
                    textAlign: TextAlign.center,
                  ),
                if (data.contentWidget != null) data.contentWidget!,
                if (data.primaryButton != null) ...[
                  const SizedBox(height: 16),
                  if (data.secondaryButton == null) _singleButton(context),
                  if (data.secondaryButton != null) _doubleButton(context),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPrimaryButtonPressed(BuildContext context) {
    if (data.dismissOnButtonTap) Navigator.of(context).pop();
    data.onPrimaryButtonPressed?.call();
  }

  void onSecondaryButtonPressed(BuildContext context) {
    if (data.dismissOnButtonTap) Navigator.of(context).pop();
    data.onSecondaryButtonPressed?.call();
  }

  Widget _singleButton(BuildContext context) {
    final button = (data.isDestructive)
        ? MyDangerButton(
            label: Text(data.primaryButton!),
            onPressed: () => onPrimaryButtonPressed(context),
            buttonSize: ButtonSize.medium,
          )
        : MyPrimaryButton(
            label: Text(data.primaryButton!),
            onPressed: () => onPrimaryButtonPressed(context),
            buttonSize: ButtonSize.medium,
          );

    return Container(
      constraints: BoxConstraints(
        minWidth: data.shouldExpandButton ? double.infinity : 160,
      ),
      child: button,
    );
  }

  Widget _doubleButton(BuildContext context) {
    if (data.useVerticalButton) {
      return _verticalButton(context);
    }

    return Row(
      children: [
        Expanded(
          child: data.isDestructive
              ? MyOutlineButton(
                  label: Text(data.secondaryButton!),
                  onPressed: () => onSecondaryButtonPressed(context),
                  buttonSize: ButtonSize.small,
                )
              : MySecondaryButton(
                  label: Text(data.secondaryButton!),
                  onPressed: () => onSecondaryButtonPressed(context),
                  buttonSize: ButtonSize.small,
                ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: data.isDestructive
              ? MyDangerButton(
                  label: Text(data.primaryButton!),
                  onPressed: () => onPrimaryButtonPressed(context),
                  buttonSize: ButtonSize.small,
                )
              : MyPrimaryButton(
                  label: Text(data.primaryButton!),
                  onPressed: () => onPrimaryButtonPressed(context),
                  buttonSize: ButtonSize.small,
                ),
        ),
      ],
    );
  }

  Widget _verticalButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (data.isDestructive)
          MyDangerButton(
            label: Text(data.primaryButton ?? ''),
            onPressed: () => onPrimaryButtonPressed(context),
            buttonSize: ButtonSize.medium,
          )
        else
          MyPrimaryButton(
            label: Text(data.primaryButton ?? ''),
            onPressed: () => onPrimaryButtonPressed(context),
            buttonSize: ButtonSize.medium,
          ),
        const SizedBox(height: 12),
        if (data.isDestructive)
          MyOutlineButton(
            label: Text(data.secondaryButton ?? ''),
            onPressed: () => onSecondaryButtonPressed(context),
            buttonSize: ButtonSize.medium,
          )
        else
          MySecondaryButton(
            label: Text(data.secondaryButton ?? ''),
            onPressed: () => onSecondaryButtonPressed(context),
            buttonSize: ButtonSize.medium,
          ),
      ],
    );
  }
}
