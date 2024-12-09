// ignore_for_file: public_member_api_docs

import 'package:chat/core/routes/app_routes.dart';
import 'package:chat/features/presentation/screens/chat_screen.dart';
import 'package:chat/features/presentation/screens/home_screen.dart';
import 'package:chat/features/presentation/screens/login_screen.dart';
import 'package:chat/features/presentation/screens/onboarding_screen.dart';
import 'package:chat/features/presentation/screens/signup_screen.dart';
import 'package:chat/features/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// The name of the route that loads on app startup
  static const String initialRoute = KRoutes.splashScreen;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Navigate to the Splash screen.
      case KRoutes.splashScreen:
        return _setPage(
          page: const SplashScreen(),
          settings: settings,
        );
      //Navigate to the Onboarding screen.
      case KRoutes.onBoarding:
        return _setPage(
          page: const OnboardingScreen(),
          settings: settings,
        );
      //Navigate to the Login screen.
      case KRoutes.login:
        return _setPage(
          page: const LoginScreen(),
          settings: settings,
        );
      //Navigate to the Signup screen.
      case KRoutes.signup:
        return _setPage(
          page: const SignupScreen(),
          settings: settings,
        );
      //Navigate to the home main screen.
      case KRoutes.homeScreen:
        return _setPage(
          page: const HomeScreen(),
          settings: settings,
        );
      case KRoutes.chatScreen:
        return _setPage(
          page: const ChatScreen(),
          settings: settings,
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Unknown Route'),
        ),
        body: const Center(
          child: Text('Unknown Route'),
        ),
      ),
    );
  }

  static MaterialPageRoute<dynamic> _setPage({
    required Widget page,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => page,
      settings: settings,
    );
  }

  static Future<dynamic> pushNamed(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> pushNamedAndRemoveUntilByName(
    String routeName,
    String untilRoute, {
    dynamic args,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(untilRoute),
      arguments: args,
    );
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
    String routeName,
    bool Function(Route<dynamic>) untilRoute, {
    dynamic args,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      untilRoute,
      arguments: args,
    );
  }

  static Future<dynamic> pushReplacement(String routeName, {dynamic args}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: args);
  }

  static Future<dynamic> popAndPushNamed(String routeName, {dynamic args}) {
    return navigatorKey.currentState!
        .popAndPushNamed(routeName, arguments: args);
  }

  static Future<dynamic> popAndPushNamedWithTransition(
    String routeName, {
    dynamic args,
  }) {
    return navigatorKey.currentState!
        .popAndPushNamed(routeName, arguments: args);
  }

  static Future<void> pop([dynamic result]) async {
    navigatorKey.currentState!.pop(result);
  }

  static void popUntil(String routeName) {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  static void popUntilRoot() {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(initialRoute));
  }

  static Future<dynamic> startNewRoute(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: args,
    );
  }
}
