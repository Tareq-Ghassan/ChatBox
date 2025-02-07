import 'package:chat/core/routes/route.dart';
import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:chat/features/chat/ui/bloc/chats_bloc.dart';
import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:flutter/material.dart';

/// [ChatActionsControls] handles chat actions
class ChatActionsControls {
  /// [muteUnmute] function
  static void muteUnmute(Chat selectedChat) {
    sl<SwipeOffsetCubit>().reset();
    sl<ChatsBloc>().add(
      MuteUnmute(
        chatId: selectedChat.id,
        isMute: !selectedChat.isMuted,
      ),
    );
    ScaffoldMessenger.of(KNavigator.navigatorKey.currentContext!).showSnackBar(
      const SnackBar(
        content: Text('Notifications turned off'),
      ),
    );
  }
}
