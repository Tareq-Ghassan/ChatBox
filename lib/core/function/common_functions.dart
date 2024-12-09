import 'package:chat/core/routes/route_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// [isLightMode] function that return if the current mob theme is light
bool get isLightMode =>
    MediaQuery.of(AppRouter.navigatorKey.currentContext!).platformBrightness ==
    Brightness.light;

/// [appLocalizations] function that return [AppLocalizations]
AppLocalizations get appLocalizations =>
    AppLocalizations.of(AppRouter.navigatorKey.currentContext!)!;
