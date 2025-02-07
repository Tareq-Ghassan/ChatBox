import 'package:chat/core/presentation/widget/profile_image_avatar.dart';
import 'package:chat/core/routes/route.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:chat/features/chat/ui/controls/chats_mapper.dart';
import 'package:chat/features/chat/ui/widget/dismissible.dart';
import 'package:flutter/material.dart';

/// [ChatItem] represent a single chat in home page
class ChatItem extends StatelessWidget {
  /// [ChatItem] constructor
  const ChatItem({required this.selectedChat, super.key});

  /// [selectedChat] represent a single chat item
  final Chat selectedChat;

  @override
  Widget build(BuildContext context) {
    return CustomDismissible(
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
            StreamBuilder<int>(
              stream: _timeStream(),
              builder: (context, snapshot) {
                return Text(
                  MappersUtil.mapTimeDifferenceToTimeAgo(
                    CalculateUtil.timeDifference(
                      selectedChat.lastMessage.createdAt,
                    ),
                  ),
                );
              },
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
    );
  }

  Stream<int> _timeStream() async* {
    yield* Stream.periodic(const Duration(minutes: 1), (count) => count);
  }
}
