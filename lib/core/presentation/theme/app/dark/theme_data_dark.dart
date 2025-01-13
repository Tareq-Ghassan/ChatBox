import 'package:chat/core/presentation/theme/app/dark/appbar_theme_dark.dart';
import 'package:chat/core/presentation/theme/app/dark/bottom_nav_bar_theme_dark.dart';
import 'package:chat/core/presentation/theme/app/dark/button_theme_dark.dart';
import 'package:chat/core/presentation/theme/app/dark/list_tile_theme_dark.dart';
import 'package:chat/core/presentation/theme/app/dark/text_theme_dark.dart';
import 'package:chat/core/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

/// [darkTheme] holds [ThemeData] which define the dark theme mode
ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: KColors.blackColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: KColors.blackColor,
    primaryContainer: KColors.grayColor,
  ),
  useMaterial3: true,
  textTheme: textThemeDark,
  elevatedButtonTheme: elevatedButtonThemeDark,
  textButtonTheme: textButtonThemeDark,
  appBarTheme: appBarThemeDark,
  bottomNavigationBarTheme: bottomNavigationBarThemeDark,
  primaryColorDark: KColors.grayColor,
  listTileTheme: listTileThemeDark,
);
