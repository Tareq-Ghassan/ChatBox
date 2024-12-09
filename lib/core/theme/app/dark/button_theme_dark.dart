import 'package:chat/core/theme/colors.dart';
import 'package:flutter/material.dart';

///[elevatedButtonThemeDark] default elevated Button Dark Theme
final elevatedButtonThemeDark = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: const WidgetStatePropertyAll(KColors.white),
    foregroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return KColors.lightBlackColor;
        }
        return KColors.black;
      },
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);

///[textButtonThemeDark] default Text Button Dark Theme
final textButtonThemeDark = TextButtonThemeData(
  style: ButtonStyle(
    overlayColor: const WidgetStatePropertyAll(
      Colors.transparent,
    ),
    foregroundColor: const WidgetStatePropertyAll(
      KColors.white,
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);
