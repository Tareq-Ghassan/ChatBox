import 'package:chat/presentation/constants/theme/colors.dart';
import 'package:flutter/material.dart';

///[elevatedButtonTheme] default elevated Button Theme
final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return KColors.lightBlackColor;
        }
        return const Color.fromRGBO(36, 120, 109, 255);
      },
    ),
    foregroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return KColors.lightBlackColor; 
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
      KColors.white,
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);
