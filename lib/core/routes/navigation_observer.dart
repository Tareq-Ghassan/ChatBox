part of 'route.dart';

/// [KNavigatorObserver] class which observe navigations cross the app
class KNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _handleRouteChange(
      settings: route.settings,
      isPush: true,
      state: _RouteState.push,
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _handleRouteChange(
      settings: route.settings,
      isPush: false,
      state: _RouteState.pop,
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _handleRouteChange(
        settings: newRoute.settings,
        isPush: true,
        state: _RouteState.replace,
      );
    }
    if (oldRoute != null) {
      _handleRouteChange(
        settings: oldRoute.settings,
        isPush: false,
        state: _RouteState.replace,
      );
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _handleRouteChange(
      settings: route.settings,
      isPush: false,
      state: _RouteState.remove,
    );
  }

  void _handleRouteChange({
    required RouteSettings settings,
    required _RouteState state,
    required bool isPush,
  }) {
    switch (settings.name) {
      case KRoutes.login || KRoutes.signup:
        if (isPush) {
          AuthenticationModule().inject();
          AuthenticationUiModule().inject();
        } else {
          if (state != _RouteState.replace) AuthenticationModule().deregister();
          AuthenticationUiModule().deregister();
          PreLoginModule().deregister();
        }
      case KRoutes.homeScreen:
        break;
    }
  }
}

enum _RouteState { push, pop, replace, remove }
