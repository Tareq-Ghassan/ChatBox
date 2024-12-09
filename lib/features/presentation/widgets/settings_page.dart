import 'package:chat/core/assets/icons.dart';
import 'package:chat/features/presentation/widgets/settings_item.dart';
import 'package:flutter/material.dart';

/// [SettingsPage] represent calls page
class SettingsPage extends StatelessWidget {
  ///[SettingsPage] constructou
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            leading: CircleAvatar(
              radius: 24,
              child: Image.asset(KIcons.user),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Image.asset(KIcons.call),
            ),
            title: const Text('Reem Al Karmi'),
            subtitle: const Text('Never give up'),
          );
        } else {
          return const SettingsItem();
        }
      },
      itemCount: 5 + 1,
    );
  }
}
