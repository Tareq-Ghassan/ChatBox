part of 'lifecycle.dart';

/// [LifecycleAwareWidget] a class to make any stateless widget aware
/// with app lifeCycle
///
/// you should only use it when you need it
class LifecycleAwareWidget extends StatefulWidget {
  /// [LifecycleAwareWidget] constructor
  const LifecycleAwareWidget({required this.child, super.key});

  /// [child]
  final Widget child;

  @override
  State<LifecycleAwareWidget> createState() => _LifecycleAwareWidgetState();
}

class _LifecycleAwareWidgetState extends State<LifecycleAwareWidget>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.paused) {}
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
