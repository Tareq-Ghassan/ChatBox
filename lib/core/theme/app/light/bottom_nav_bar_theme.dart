import 'package:chat/core/theme/app/light/text_theme.dart';
import 'package:chat/core/theme/colors.dart';
import 'package:flutter/material.dart';

/// [bottomNavigationBarTheme] represent bottom nav bar light theme
final bottomNavigationBarTheme = BottomNavigationBarThemeData(
  backgroundColor: KColors.white,
  selectedLabelStyle: textTheme.titleSmall!.copyWith(
    color: KColors.greenColor,
  ),
  unselectedLabelStyle: textTheme.titleSmall!.copyWith(
    color: KColors.lightBlackColor,
  ),
  selectedIconTheme: const IconThemeData(color: KColors.greenColor),
  type: BottomNavigationBarType.fixed,
  showUnselectedLabels: true,
  selectedItemColor: KColors.greenColor,
  unselectedItemColor: KColors.lightBlackColor,
  showSelectedLabels: true,
  unselectedIconTheme: const IconThemeData(color: KColors.lightBlackColor),
);
