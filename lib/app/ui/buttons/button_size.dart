import 'package:flutter/material.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';

enum ButtonSize {
  small(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    iconSize: 16,
  ),
  medium(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    iconSize: 20,
  ),
  large(
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    iconSize: 24,
  );

  const ButtonSize({required this.padding, required this.iconSize});

  final EdgeInsets padding;

  final double iconSize;

  TextStyle get textStyle {
    switch (this) {
      case ButtonSize.small:
        return MyText.xsSemiBold;
      case ButtonSize.medium:
        return MyText.smSemiBold;
      case ButtonSize.large:
        return MyText.baseSemiBold;
    }
  }
}
