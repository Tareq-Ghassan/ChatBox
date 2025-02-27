import 'package:chat/core/presentation/assets/icons.dart';
import 'package:flutter/material.dart';

/// [CallItem] represent a single call item
class CallItem extends StatelessWidget {
  /// [CallItem] constructor
  const CallItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://via.placeholder.com/50'),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: () {}, icon: Image.asset(KIcons.call)),
          IconButton(onPressed: () {}, icon: Image.asset(KIcons.video)),
        ],
      ),
      title: const Text('Team Align'),
      subtitle: const Row(
        spacing: 6,
        children: [
          Icon(Icons.abc),
          Text('number 1'),
        ],
      ),
    );
  }
}
