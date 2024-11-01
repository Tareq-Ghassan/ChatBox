import 'package:chat/presentation/constants/theme/app/dark/theme_data_dark.dart';
import 'package:chat/presentation/constants/theme/app/light/theme_data.dart';
import 'package:chat/provider/multi_bloc_provider.dart';
import 'package:chat/routes/route_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// [ChatApp] represent the root screen
class ChatApp extends StatelessWidget {
  /// [ChatApp] constructor
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: multiBlocProvider,
      child: MaterialApp(
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
        initialRoute: AppRouter.initialRoute,
        onGenerateRoute: AppRouter.generateRoute,
        navigatorKey: AppRouter.navigatorKey,
      ),
    );
  }
}
