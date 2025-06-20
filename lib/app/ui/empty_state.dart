import 'package:flutter/material.dart';
import 'package:fskeleton/app/localizations/ui_text.dart';
import 'package:fskeleton/app/ui/buttons/button_size.dart';
import 'package:fskeleton/app/ui/buttons/my_primary_button.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';

class MyEmptyState extends StatelessWidget {
  const MyEmptyState({
    super.key,
    this.icon,
    this.iconBackgroundColor,
    required this.title,
    this.description,
    this.button,
    this.onButtonPressed,
    this.centered = true,
    this.buttonWidget,
  });

  const MyEmptyState.empty({
    required this.title,
    this.description,
    this.button,
    this.onButtonPressed,
    this.centered = true,
    this.buttonWidget,
  })  : icon = const Icon(
          Icons.inbox,
          color: MyColors.primary500,
        ),
        iconBackgroundColor = MyColors.primary50;

  const MyEmptyState.warningEmpty({
    required this.title,
    this.description,
    this.button,
    this.onButtonPressed,
    this.centered = true,
    this.buttonWidget,
  })  : icon = const Icon(
          Icons.inbox,
          color: MyColors.secondaryOrange500,
        ),
        iconBackgroundColor = MyColors.secondaryOrange50;

  MyEmptyState.searchNotFound({
    required BuildContext context,
    String? title,
    String? description,
    this.centered = true,
    this.buttonWidget,
  })  : icon = const Icon(
          Icons.search,
          color: MyColors.primary500,
        ),
        iconBackgroundColor = MyColors.primary50,
        title = title ?? context.localizations.searchNotFoundTitle,
        description =
            description ?? context.localizations.searchNotFoundMessage,
        button = null,
        onButtonPressed = null;

  MyEmptyState.error({
    required BuildContext context,
    required VoidCallback onRetried,
    this.centered = true,
    this.buttonWidget,
  })  : icon = const Icon(
          Icons.close,
          color: MyColors.danger500,
        ),
        iconBackgroundColor = MyColors.danger50,
        title = context.localizations.loadingDataErrorMessage,
        description = context.localizations.errorStateMessage,
        button = context.localizations.tryAgain,
        onButtonPressed = onRetried;

  final Widget? icon;

  final Color? iconBackgroundColor;

  final String title;

  final String? description;

  final String? button;

  final Widget? buttonWidget;

  final VoidCallback? onButtonPressed;

  final bool centered;

  @override
  Widget build(BuildContext context) {
    final emptyState = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            _icon(),
            const SizedBox(height: 16),
          ],
          Text(
            title,
            textAlign: TextAlign.center,
            style: MyText.baseSemiBold,
          ),
          if (description != null) ...[
            const SizedBox(height: 8),
            Text(
              description!,
              textAlign: TextAlign.center,
              style: MyText.sm.copyWith(color: MyColors.neutral80),
            ),
          ],
          if (button != null) ...[
            const SizedBox(height: 16),
            _button(),
          ],
          if (buttonWidget != null) ...[
            const SizedBox(height: 16),
            buttonWidget!,
          ],
        ],
      ),
    );

    return centered ? Center(child: emptyState) : emptyState;
  }

  Widget _icon() {
    return Material(
      shape: const CircleBorder(),
      color: iconBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: IconTheme(
          data: const IconThemeData(size: 48),
          child: icon!,
        ),
      ),
    );
  }

  Widget _button() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 137),
      child: MyPrimaryButton(
        onPressed: onButtonPressed,
        buttonSize: ButtonSize.small,
        label: Text(button!),
      ),
    );
  }
}
