import 'package:chat/core/presentation/theme/colors.dart';
import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:flutter/material.dart';

/// [ChatActions] class holds dismiss actions
class ChatActions extends StatelessWidget {
  /// [ChatActions] constructor
  const ChatActions({
    super.key,
  });

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
            onPressed: () {
              sl<SwipeOffsetCubit>().reset();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Notifications turned off'),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_off,
              color: Colors.black,
            ),
            onPressed: () {
              sl<SwipeOffsetCubit>().reset();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Notifications turned off'),
                ),
              );
            },
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
