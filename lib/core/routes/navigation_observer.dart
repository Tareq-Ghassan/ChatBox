part of 'route.dart';

/// [KNavigatorObserver] class which observe navigations cross the app
class KNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _handleRouteChange(settings: route.settings, isPush: true);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _handleRouteChange(settings: route.settings, isPush: false);
  }

  void _handleRouteChange({
    required RouteSettings settings,
    required bool isPush,
  }) {
    switch (settings.name) {
      case KRoutes.login || KRoutes.signup:
        if (isPush) {
          AuthenticationModule().inject();
          AuthenticationUiModule().inject();
        } else {
          AuthenticationModule().deregister();
          AuthenticationUiModule().deregister();
          PreLoginModule().deregister();
        }
      case KRoutes.homeScreen:
        break;
    }
  }
}
