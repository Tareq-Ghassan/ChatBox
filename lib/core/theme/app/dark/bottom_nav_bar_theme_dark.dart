import 'package:chat/core/theme/app/light/text_theme.dart';
import 'package:chat/core/theme/colors.dart';
import 'package:flutter/material.dart';

/// [bottomNavigationBarThemeDark] represent bottom nav bar dark theme
final bottomNavigationBarThemeDark = BottomNavigationBarThemeData(
  backgroundColor: KColors.blackColor,
  selectedLabelStyle: textTheme.titleSmall!.copyWith(
    color: KColors.greenColor,
  ),
  unselectedLabelStyle: textTheme.titleSmall!.copyWith(
    color: KColors.white,
  ),
  selectedIconTheme: const IconThemeData(color: KColors.greenColor),
  type: BottomNavigationBarType.fixed,
  showUnselectedLabels: true,
  selectedItemColor: KColors.greenColor,
  unselectedItemColor: KColors.white,
  showSelectedLabels: true,
  unselectedIconTheme: const IconThemeData(color: KColors.white),
);
