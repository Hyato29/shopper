import 'package:flutter/material.dart';

const _defaultSize = 24.0;
const _splashRadiusRatio = 20.0 / 24.0;

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconSize,
    this.padding = EdgeInsets.zero,
  });

  final VoidCallback? onPressed;

  final Widget icon;

  final double? iconSize;

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final effectiveSize =
        iconSize ?? IconTheme.of(context).size ?? _defaultSize;

    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: effectiveSize,
      splashRadius: _splashRadiusRatio * effectiveSize,
      padding: padding,
      constraints: const BoxConstraints(),
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
