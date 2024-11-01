import 'package:chat/common/function/common_functions.dart';
import 'package:chat/presentation/constants/theme/colors.dart';
import 'package:chat/routes/route_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///  Author: @Tareq Abu Saleh
///
///  Org: @Bank Of Jordan
///
///  Date: 15/9/2023
///
/// Last Update: 24/1/2024
///
/// [LoadingIndicatorDialog] this is a Custom Widget to show loading widget
///
/// ex:
/// ```dart
/// Scaffold(
///   body: LoadingIndicatorDialog().showDialog()
/// );
/// ```
class LoadingIndicatorDialog {
  /// [LoadingIndicatorDialog] constructor
  factory LoadingIndicatorDialog() {
    return _singleton;
  }

  LoadingIndicatorDialog._internal();
  static final LoadingIndicatorDialog _singleton =
      LoadingIndicatorDialog._internal();

  /// [isDisplayed] flag
  static bool isDisplayed = false;

  /// [show] function
  static void show(BuildContext context) {
    if (isDisplayed) {
      return;
    }
    final text = AppLocalizations.of(context)!.loading;
    showDialog<void>(
      barrierColor: isLightMode ? KColors.white70 : KColors.black87,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        isDisplayed = true;
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
                        child: Text(text),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// [dismiss] function
  static void dismiss() {
    if (isDisplayed) {
      try {
        AppRouter.pop();
      } catch (e) {
        debugPrint(e.toString());
        // Handle the exception, e.g., context might be null
      } finally {
        isDisplayed = false;
      }
    }
  }
}
