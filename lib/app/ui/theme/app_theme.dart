import 'package:flutter/material.dart';

import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';

const _pressedButtonElevation = 0.0;
const _disabledButtonElevation = 2.0;
const _defaultButtonElevation = 3.0;

const _colorScheme = ColorScheme.light(
  primary: MyColors.primary500,
  secondary: MyColors.primary500,
  onSecondary: MyColors.white,
  error: MyColors.danger500,
);

final _textTheme = TextTheme(
  labelSmall: MyText.xs,
  labelMedium: MyText.sm,
  labelLarge: MyText.base,
  bodySmall: MyText.sm,
  bodyMedium: MyText.base,
  bodyLarge: MyText.base,
  titleSmall: MyText.base,
  titleMedium: MyText.lg,
  titleLarge: MyText.xl,
  headlineSmall: MyText.x2l,
  headlineMedium: MyText.x3l,
  headlineLarge: MyText.x4l,
);

final _buttonElevation = WidgetStateProperty.resolveWith((states) {
  if (states.contains(WidgetState.pressed)) {
    return _pressedButtonElevation;
  } else if (states.contains(WidgetState.disabled)) {
    return _disabledButtonElevation;
  } else {
    return _defaultButtonElevation;
  }
});

final _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return MyColors.neutral50;
      } else {
        return MyColors.primary500;
      }
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return MyColors.neutral70;
      } else {
        return MyColors.white;
      }
    }),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      const pressedColor = MyColors.primary900;
      if (states.contains(WidgetState.pressed)) {
        return pressedColor;
      } else {
        return pressedColor.withAlpha(0);
      }
    }),
    elevation: _buttonElevation,
    minimumSize: const WidgetStatePropertyAll(Size.zero),
    shape: const WidgetStatePropertyAll(StadiumBorder()),
  ),
);

final _outlinedButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.disabled)
          ? MyColors.neutral50
          : MyColors.white;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return MyColors.primary200;
      } else if (states.contains(WidgetState.disabled)) {
        return MyColors.neutral50;
      } else {
        return MyColors.primary500;
      }
    }),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      const pressedColor = MyColors.primary200;

      return states.contains(WidgetState.pressed)
          ? pressedColor
          : pressedColor.withAlpha(0);
    }),
    elevation: _buttonElevation,
    minimumSize: const WidgetStatePropertyAll(Size.zero),
    side: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.disabled)
          ? BorderSide.none
          : const BorderSide(color: MyColors.primary500);
    }),
    shape: const WidgetStatePropertyAll(StadiumBorder()),
  ),
);

final myTheme = ThemeData.from(
  colorScheme: _colorScheme,
  textTheme: _textTheme,
  useMaterial3: false,
).copyWith(
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  visualDensity: VisualDensity.standard,
  canvasColor: MyColors.white,
  disabledColor: MyColors.neutral70,
  highlightColor: MyColors.transparent,
  focusColor: MyColors.primary50,
  shadowColor: MyColors.black.withOpacity(0.6),
  splashColor: MyColors.primary500.withOpacity(0.1),
  elevatedButtonTheme: _elevatedButtonTheme,
  outlinedButtonTheme: _outlinedButtonTheme,
);
