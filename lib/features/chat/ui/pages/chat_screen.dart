import 'package:chat/core/presentation/assets/icons.dart';
import 'package:flutter/material.dart';

/// [ChatScreen] represents the chat screen
class ChatScreen extends StatelessWidget {
  /// [ChatScreen] constructor
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(KIcons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(KIcons.video),
          ),
        ],
        title: const ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Reem Al Karmi'),
          subtitle: Text('Active now'),
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/50'),
          ),
        ),
      ),
      body: const Center(

      ),
    );
  }
}
