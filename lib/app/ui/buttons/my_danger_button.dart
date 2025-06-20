import 'package:flutter/material.dart';
import 'package:fskeleton/app/ui/buttons/button_size.dart';
import 'package:fskeleton/app/ui/buttons/my_button_layout.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';

class MyDangerButton extends StatelessWidget {
  const MyDangerButton({
    super.key,
    required this.onPressed,
    this.leading,
    this.label,
    this.trailing,
    this.buttonSize = ButtonSize.large,
  });

  final VoidCallback? onPressed;

  final Widget? leading;

  final Widget? label;

  final Widget? trailing;

  final ButtonSize buttonSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(buttonSize.textStyle),
        padding: WidgetStatePropertyAll(buttonSize.padding),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return MyColors.neutral50;
          } else {
            return MyColors.danger500;
          }
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          const pressedColor = MyColors.danger900;
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
      ),
    );
  }
}
