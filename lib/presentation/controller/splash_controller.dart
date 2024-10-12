import 'dart:async';
import 'dart:io';

import 'package:chat/presentation/widgets/common/dialog.dart';
import 'package:chat/provider/BloC/init/init_state.dart';
import 'package:chat/routes/app_routes.dart';
import 'package:chat/routes/route_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// [splashListenerController] the function that handle UI for Bloc state
Future<void> splashListenerController(
  BuildContext context,
  InitState state,
) async {
  final appLocalizations = AppLocalizations.of(context)!;
  if (state is InitIsLoaded) {
    await AppRouter.pushReplacement(KRoutes.onBoarding);
  } else if (state is InitFailure) {
    unawaited(
      showDialog(
        context: AppRouter.navigatorKey.currentContext!,
        builder: (context) => CustomDialogBox(
          title: appLocalizations.welcomeToChatBox,
          descriptions: appLocalizations.workingOnApp,
          yesButtontext: appLocalizations.exit,
          yesButtontOnTap: () => exit(0),
        ),
      ),
    );
  } else if (state is InitCatch) {
    unawaited(
      showDialog(
        context: AppRouter.navigatorKey.currentContext!,
        builder: (context) => CustomDialogBox(
          title: appLocalizations.welcomeToChatBox,
          descriptions: appLocalizations.workingOnApp,
          yesButtontext: appLocalizations.exit,
          yesButtontOnTap: () => exit(0),
        ),
      ),
    );
  }
}
