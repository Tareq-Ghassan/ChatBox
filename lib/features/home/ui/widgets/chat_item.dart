
import 'package:chat/core/presentation/theme/colors.dart';
import 'package:chat/core/routes/route.dart';
import 'package:chat/core/util/theme_utils.dart';
import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [ChatItem] represent a single chat in home page
class ChatItem extends StatelessWidget {
  /// [ChatItem] constructor
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwipeOffsetCubit, double>(
      builder: (context, swipeOffset) {
        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            context.read<SwipeOffsetCubit>().updateOffset(
                  details.delta.dx,
                  MediaQuery.of(context).size.width / 2,
                );
          },
          onHorizontalDragEnd: (details) {
            // Snap back to original position if swipe is incomplete
            if (swipeOffset > -MediaQuery.of(context).size.width / 2) {
              context.read<SwipeOffsetCubit>().reset();
            }
          },
          child: Stack(
            children: [
              Container(
                height: 93,
                color: KColors.disableColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        context.read<SwipeOffsetCubit>().reset();
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
                        context.read<SwipeOffsetCubit>().reset();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Chat deleted')),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(swipeOffset, 0),
                child: ColoredBox(
                  color: isLightMode
                      ? swipeOffset == 0
                          ? KColors.white
                          : KColors.disableColor
                      : swipeOffset == 0
                          ? KColors.blackColor
                          : KColors.black87,
                  child: ListTile(
                    onTap: () {
                      KNavigator.pushNamed(KRoutes.chatScreen);
                    },
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    leading: const CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/50'),
                    ),
                    title: const Text('Alex'),
                    subtitle: const Text('How are you today?'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('2 min ago'),
                        const SizedBox(
                          height: 4,
                        ),
                        if (true == true)
                          Badge.count(
                            count: 5,
                            padding: const EdgeInsets.all(2),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
