import 'package:chat/core/routes/route_manger.dart';
import 'package:flutter/material.dart';

/// [isLightMode] function that return if the current mob theme is light
bool get isLightMode =>
    MediaQuery.of(AppRouter.navigatorKey.currentContext!).platformBrightness ==
    Brightness.light;
