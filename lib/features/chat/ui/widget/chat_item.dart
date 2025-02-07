import 'package:chat/core/presentation/theme/colors.dart';
import 'package:chat/core/presentation/widget/profile_image_avatar.dart';
import 'package:chat/core/routes/route.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:chat/features/chat/ui/controls/chats_mapper.dart';
import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [ChatItem] represent a single chat in home page
class ChatItem extends StatelessWidget {
  /// [ChatItem] constructor
  const ChatItem({required this.selectedChat, super.key});

  /// [selectedChat] represent a single chat item
  final Chat selectedChat;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwipeOffsetCubit, double>(
      bloc: sl<SwipeOffsetCubit>(),
      builder: (context, swipeOffset) {
        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            sl<SwipeOffsetCubit>().updateOffset(
              details.delta.dx,
              MediaQuery.of(context).size.width / 2,
            );
          },
          onHorizontalDragEnd: (details) {
            // Snap back to original position if swipe is incomplete
            if (swipeOffset > -MediaQuery.of(context).size.width / 2) {
              sl<SwipeOffsetCubit>().reset();
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
                    leading: ProfileImageAvatar(
                      imageUrl: selectedChat.participants.first.profileImage,
                    ),
                    title: Text(selectedChat.participants.first.name),
                    subtitle: Text(
                      ChatsMapper.mapMessageType(
                        selectedChat.lastMessage,
                      ),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          MappersUtil.mapTimeDifferenceToTimeAgo(
                            CalculateUtil.timeDifference(
                              selectedChat.lastMessage.createdAt,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        if (selectedChat.unreadMessagesCount > 0)
                          Badge.count(
                            count: selectedChat.unreadMessagesCount,
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


