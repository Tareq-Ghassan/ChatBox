import 'package:flutter/material.dart';

/// [ContactsItem] represent single contacts item
class ContactsItem extends StatelessWidget {
  /// [ContactsItem] constructor
  const ContactsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage('https://via.placeholder.com/50'),
      ),
      title: Text('Alex'),
      subtitle: Text('Life is beautiful 👌'),
    );
  }
}
