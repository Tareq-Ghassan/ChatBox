import 'package:chat/core/presentation/theme/app/dark/theme_data_dark.dart';
import 'package:chat/core/presentation/theme/app/light/theme_data.dart';
import 'package:chat/core/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// [ChatApp] represent the root screen
class ChatApp extends StatelessWidget {
  /// [ChatApp] constructor
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      initialRoute: KNavigator.initialRoute,
      onGenerateRoute: KNavigator.generateRoute,
      navigatorKey: KNavigator.navigatorKey,
      navigatorObservers: [KNavigatorObserver()],
    );
  }
}
