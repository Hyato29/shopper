import 'package:flutter/material.dart';
import 'package:fskeleton/app/ui/buttons/button_size.dart';
import 'package:fskeleton/app/ui/buttons/my_button_layout.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';

class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({
    super.key,
    required this.onPressed,
    this.leading,
    this.label,
    this.trailing,
    this.buttonSize = ButtonSize.large,
    this.iconAndTextSpace,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
  });

  final VoidCallback? onPressed;

  final Widget? leading;

  final Widget? label;

  final Widget? trailing;

  final ButtonSize buttonSize;

  final double? iconAndTextSpace;

  final Color? backgroundColor;

  final Color? foregroundColor;

  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(buttonSize.textStyle),
        padding: WidgetStatePropertyAll(buttonSize.padding),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return MyColors.neutral50;
          } else {
            return backgroundColor ?? MyColors.white;
          }
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return MyColors.neutral70;
          } else {
            return foregroundColor ?? MyColors.neutral100;
          }
        }),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide.none;
          } else {
            return BorderSide(color: borderColor ?? MyColors.neutral100);
          }
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          const pressedColor = MyColors.neutral30;
          if (states.contains(WidgetState.pressed)) {
            return pressedColor;
          } else {
            return pressedColor.withAlpha(0);
          }
        }),
      ),
      onPressed: onPressed,
      child: MyButtonLayout(
        leading: leading,
        label: label,
        trailing: trailing,
        buttonSize: buttonSize,
        iconAndTextSpace: iconAndTextSpace,
      ),
    );
  }
}
