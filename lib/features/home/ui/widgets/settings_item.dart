import 'package:chat/core/presentation/assets/icons.dart';
import 'package:flutter/material.dart';

///[SettingsItem] returns SettingsItem
class SettingsItem extends StatelessWidget {
  /// [SettingsItem] constru
  const SettingsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        child: Image.asset(KIcons.message),
      ),
      title: const Text('Accounts'),
      subtitle: const Text('privacy, privacy, change number'),
    );
  }
}
