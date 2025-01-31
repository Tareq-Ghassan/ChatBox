part of 'util.dart';


/// [isLightMode] function that return if the current mob theme is light
bool get isLightMode =>
    MediaQuery.of(KNavigator.navigatorKey.currentContext!).platformBrightness ==
    Brightness.light;
