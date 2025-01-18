part of 'lifecycle.dart';

/// [AppLifecycleManager] handle life cycle for the whole app
class AppLifecycleManager extends StatefulWidget {
  /// [AppLifecycleManager] constructor
  const AppLifecycleManager({
    required this.child,
    required this.core,
    super.key,
  });

  /// [child]
  final Widget child;

  /// [core] dependencies
  final Core core;

  @override
  State<AppLifecycleManager> createState() => _AppLifecycleManagerState();
}

class _AppLifecycleManagerState extends State<AppLifecycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    //* Register core dependencies
    widget.core.inject();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    //* Cleanup core dependencies
    widget.core.deregister();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
