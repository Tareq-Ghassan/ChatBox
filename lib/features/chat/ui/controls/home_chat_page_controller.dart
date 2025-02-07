import 'dart:async';

import 'package:chat/core/presentation/widget/dialog.dart';
import 'package:chat/core/presentation/widget/loading_indicator.dart';
import 'package:chat/core/routes/route.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/features/chat/ui/bloc/chats_bloc.dart';
import 'package:flutter/material.dart';

/// [HomeChatPageController] handle all listeners in chat home page
class HomeChatPageController {
  /// [homeChatListenerController] a function that handle home chat page states
  static Future<void> homeChatListenerController(
    BuildContext context,
    ChatsState state,
  ) async {
    if (state is Loading) {
      LoadingIndicatorDialog.show();
    }
    if (state is ChatsLoaded || state is MuteUnmuteDone) {
      LoadingIndicatorDialog.dismiss();
    }
    if (state is Unauthorized) {
      LoadingIndicatorDialog.dismiss();
      unawaited(
        KNavigator.startNewRoute(
          KRoutes.onBoarding,
        ),
      );
    } else if (state is Error) {
      LoadingIndicatorDialog.dismiss();
      unawaited(
        showDialog(
          context: KNavigator.navigatorKey.currentContext!,
          builder: (context) => CustomDialogBox(
            title: state.header,
            descriptions: state.message,
            yesButtontext: appLocalizations.ok,
            yesButtonOnTap: KNavigator.pop,
          ),
        ),
      );
    }
  }
}
