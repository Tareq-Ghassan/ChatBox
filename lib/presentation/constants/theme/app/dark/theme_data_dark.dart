import 'package:chat/presentation/constants/theme/app/dark/button_theme_dark.dart';
import 'package:chat/presentation/constants/theme/app/dark/text_theme_dark.dart';
import 'package:chat/presentation/constants/theme/colors.dart';
import 'package:flutter/material.dart';

/// [darkTheme] holds [ThemeData] which define the dark theme mode
ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: KColors.blackColor,
  colorScheme: ColorScheme.fromSeed(seedColor: KColors.blackColor),
  useMaterial3: true,
  textTheme: textThemeDark,
  elevatedButtonTheme: elevatedButtonThemeDark,
  textButtonTheme: textButtonThemeDark,
);
