import 'package:chat/core/routes/route.dart';
import 'package:chat/core/util/util.dart';
import 'package:flutter/material.dart';

/// [LoadingDialog] this is a Custom Widget holds loading design
class LoadingDialog extends StatelessWidget {
  /// [LoadingIndicatorDialog] constructor
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: SimpleDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(appLocalizations.loading),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// [LoadingIndicatorDialog] a class that handle pop and show loading dialog
/// ex:
/// ```dart
/// Scaffold(
///   body: LoadingIndicatorDialog().show()
/// );
/// ```
class LoadingIndicatorDialog {
  /// [LoadingIndicatorDialog] constructor
  factory LoadingIndicatorDialog() => _singleton;
  LoadingIndicatorDialog._internal();
  static final LoadingIndicatorDialog _singleton =
      LoadingIndicatorDialog._internal();

  /// Flag to check if the dialog is already displayed
  static bool isDisplayed = false;

  /// Show the loading dialog using named routes
  static void show() {
    if (isDisplayed) return;

    isDisplayed = true;
    KNavigator.pushNamed(KRoutes.loadingDialog);
  }

  /// Dismiss the loading dialog safely
  static void dismiss() {
    if (isDisplayed) {
      try {
        if (KNavigator.navigatorKey.currentState?.canPop() ?? false) {
          KNavigator.pop();
        }
      } catch (e) {
        debugPrint('Error dismissing loading dialog: $e');
      } finally {
        isDisplayed = false;
      }
    }
  }
}
