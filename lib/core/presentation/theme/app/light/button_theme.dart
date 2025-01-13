import 'package:chat/core/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

///[elevatedButtonTheme] default elevated Button Theme
final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return KColors.dissableColor;
        }
        return KColors.greenColor;
      },
    ),
    foregroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return KColors.grayDarkColor;
        }
        return KColors.white;
      },
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: KColors.white),
      ),
    ),
  ),
);

///[textButtonTheme] default Text Button Theme
final textButtonTheme = TextButtonThemeData(
  style: ButtonStyle(
    overlayColor: const WidgetStatePropertyAll(
      Colors.transparent,
    ),
    foregroundColor: const WidgetStatePropertyAll(
      KColors.greenColor,
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);
