import 'dart:async';
import 'dart:io';

import 'package:chat/core/presentation/widget/dialog.dart';
import 'package:chat/core/presentation/widget/loading_indicator.dart';
import 'package:chat/core/routes/route.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/features/pre_login/ui/bloc/initialize_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// [SplashControls] a UI Controller class
class SplashControls {
  /// [splashInit] called on init
  static Future<void> splashInit() async {
    await Future<dynamic>.delayed(const Duration(seconds: 3));
    BlocProvider.of<InitializeBloc>(KNavigator.navigatorKey.currentContext!)
        .add(
      InitializeApp(
        appKey: dotenv.env['APP_KEY'] ?? '',
        appSecret: dotenv.env['APP_SECRET'] ?? '',
      ),
    );
  }

  /// [splashListenerController] a function that handle splash states in
  /// this order
  ///
  ///! first it listen to initialize app with the server event
  ///
  /// ? if that was success:
  ///
  ///! it add a new event which is GetConfiguration
  /// ? if that also success
  /// 
  ///! it add a new event which is CheckLoginStatus, which if user
  /// already logged in and have a token
  /// 
  /// ? if user was logged in:
  /// 
  ///! navigate to `homePage`
  /// 
  /// ? if user was not logged in 
  /// 
  ///! navigate to `onboardingPage` to either sign in or register
  /// 
  /// ! in any phase if anything went wrong a popup appears 
  static Future<void> splashListenerController(
    BuildContext context,
    InitializeState state,
  ) async {
    if (state is Loading) {
      LoadingIndicatorDialog.show(context);
    }
    if (state is InitializeLoaded) {
      LoadingIndicatorDialog.dismiss();
      BlocProvider.of<InitializeBloc>(KNavigator.navigatorKey.currentContext!)
          .add(const GetConfiguration());
    }
    if (state is ConfigurationLoaded) {
      LoadingIndicatorDialog.dismiss();
      BlocProvider.of<InitializeBloc>(KNavigator.navigatorKey.currentContext!)
          .add(const CheckLoginStatus());
    }
    if (state is LoggedIn) {
      LoadingIndicatorDialog.dismiss();
      unawaited(KNavigator.pushReplacement(KRoutes.homePage));
    }
    if (state is Unauthorized) {
      LoadingIndicatorDialog.dismiss();
      unawaited(KNavigator.pushReplacement(KRoutes.onBoarding));
    } else if (state is Error) {
      LoadingIndicatorDialog.dismiss();
      unawaited(
        showDialog(
          context: KNavigator.navigatorKey.currentContext!,
          builder: (context) => CustomDialogBox(
            title: appLocalizations.welcomeToChatBox,
            descriptions: appLocalizations.workingOnApp,
            yesButtontext: appLocalizations.exit,
            yesButtonOnTap: () => exit(0),
          ),
        ),
      );
    }
  }
}
