import 'dart:async';
import 'dart:io';

import 'package:chat/common/widget/dialog.dart';
import 'package:chat/common/widget/loading_indecator.dart';
import 'package:chat/provider/BloC/init/init_bloc.dart';
import 'package:chat/provider/BloC/init/init_event.dart';
import 'package:chat/provider/BloC/init/init_state.dart';
import 'package:chat/routes/app_routes.dart';
import 'package:chat/routes/route_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// [splashInit] called on init
Future<void> splashInit() async {
  await Future<dynamic>.delayed(const Duration(seconds: 3));
  BlocProvider.of<InitBloc>(AppRouter.navigatorKey.currentContext!)
      .add(const FetchInit());
}

/// [splashListenerController] the function that handle UI for Bloc state
Future<void> splashListenerController(
  BuildContext context,
  InitState state,
) async {
  final appLocalizations = AppLocalizations.of(context)!;
  if (state is InitIsLoading) {
    LoadingIndicatorDialog.show(context);
  }
  if (state is InitIsLoaded) {
    LoadingIndicatorDialog.dismiss();
    await AppRouter.pushReplacement(KRoutes.onBoarding);
  } else if (state is InitFailure || state is InitCatch) {
    LoadingIndicatorDialog.dismiss();
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
