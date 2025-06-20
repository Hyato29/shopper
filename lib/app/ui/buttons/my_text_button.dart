import 'package:flutter/material.dart';
import 'package:fskeleton/app/ui/buttons/button_size.dart';
import 'package:fskeleton/app/ui/buttons/my_button_layout.dart';

const _padding = 8.0;

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.onPressed,
    this.leading,
    this.label,
    this.trailing,
    this.buttonSize = ButtonSize.large,
    this.iconAndTextSpace,
  });

  final VoidCallback? onPressed;

  final Widget? leading;

  final Widget? label;

  final Widget? trailing;

  final ButtonSize buttonSize;

  final double? iconAndTextSpace;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(buttonSize.textStyle),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(_padding)),
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
