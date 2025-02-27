import 'package:chat/core/presentation/theme/app/light/appbar_theme.dart';
import 'package:chat/core/presentation/theme/app/light/bottom_nav_bar_theme.dart';
import 'package:chat/core/presentation/theme/app/light/button_theme.dart';
import 'package:chat/core/presentation/theme/app/light/list_tile_theme.dart';
import 'package:chat/core/presentation/theme/app/light/text_theme.dart';
import 'package:chat/core/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

/// [lightTheme] holds  [ThemeData] which define the light theme mode
ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: KColors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSeed(
    seedColor: KColors.white,
    primaryContainer: KColors.grayColor,
  ),
  useMaterial3: true,
  textTheme: textTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textButtonTheme: textButtonTheme,
  appBarTheme: appBarTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme,
  listTileTheme: listTileTheme,
);
