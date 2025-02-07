import 'package:chat/core/presentation/theme/colors.dart';
import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:chat/features/chat/ui/controls/chat_actions_controls.dart';
import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:flutter/material.dart';

/// [ChatActions] class holds dismiss actions
class ChatActions extends StatelessWidget {
  /// [ChatActions] constructor
  const ChatActions({
    required this.selectedChat,
    super.key,
  });

  /// [selectedChat] represent a single chat item
  final Chat selectedChat;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93,
      color: KColors.disableColor,
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(
              Icons.archive,
              color: KColors.lightGreen,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              selectedChat.isMuted
                  ? Icons.notifications_off
                  : Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () => ChatActionsControls.muteUnmute(selectedChat),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              sl<SwipeOffsetCubit>().reset();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Chat deleted')),
              );
            },
          ),
        ],
      ),
    );
  }
}
