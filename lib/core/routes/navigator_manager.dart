// ignore_for_file: public_member_api_docs, document_ignores

part of 'route.dart';

/// [KNavigator] a class where handle navigation cross the App
class KNavigator {
  const KNavigator._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final KNavigatorObserver _navigationObserver = KNavigatorObserver();

  /// The name of the route that loads on app startup
  static const String initialRoute = KRoutes.splashScreen;
  static List<NavigatorObserver> get observers => [_navigationObserver];

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
          page: const OnboardingPage(),
          settings: settings,
        );
      //Navigate to the Login screen.
      case KRoutes.login:
        return _setPage(
          page: const LoginPageBlocScope(),
          settings: settings,
        );
      //Navigate to the Signup screen.
      case KRoutes.signup:
        return _setPage(
          page: const SignupPageBlocScope(),
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

  /// [_errorRoute] in case no route found
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

  /// [_setPage] which set the new screen into the material app
  static MaterialPageRoute<dynamic> _setPage({
    required Widget page,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => page,
      settings: settings,
    );
  }

  /// [pushNamed] push to a new route
  static Future<dynamic> pushNamed(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  /// [pushNamedAndRemoveUntilByName] push a new route after remove all
  /// the routes until a `specific named route`
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

  /// [pushNamedAndRemoveUntil] push a new route after remove all
  /// the routes until a `specific conditions`
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

  /// [pushReplacement] push then remove the previous page
  static Future<dynamic> pushReplacement(String routeName, {dynamic args}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: args);
  }

  /// [popAndPushNamed] remove the previous page then push a new one
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

  /// [pop] remove the previous page
  static Future<void> pop([dynamic result]) async {
    navigatorKey.currentState!.pop(result);
  }

  /// [popUntil] remove until a specific named route
  static void popUntil(String routeName) {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  /// [popUntilRoot] pop the whole tree
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
