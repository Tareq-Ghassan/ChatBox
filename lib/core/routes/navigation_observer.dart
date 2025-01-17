part of 'route.dart';

/// [KNavigatorObserver] class which observe navigations cross the app
class KNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _handleRouteChange(settings: route.settings, isEntering: true);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _handleRouteChange(settings: route.settings, isEntering: false);
  }

  void _handleRouteChange({
    required RouteSettings settings,
    required bool isEntering,
  }) {
    switch (settings.name) {
      case KRoutes.splashScreen:
        break;
      case KRoutes.onBoarding:
        break;
      case KRoutes.login:
        break;
      case KRoutes.signup:
        break;
      case KRoutes.homeScreen:
        break;
    }
  }
}
