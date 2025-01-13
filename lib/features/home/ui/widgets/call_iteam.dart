import 'package:chat/core/presentation/assets/icons.dart';
import 'package:flutter/material.dart';

/// [CallIteam] represnet a single call item
class CallIteam extends StatelessWidget {
  /// [CallIteam] constructor
  const CallIteam({super.key});

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
        children: [
          Icon(Icons.abc),
          _whiteSapce,
          Text('number 1'),
        ],
      ),
    );
  }

  static const _whiteSapce = SizedBox(
    width: 6,
  );
}
