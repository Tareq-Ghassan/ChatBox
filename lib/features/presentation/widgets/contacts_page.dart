import 'package:chat/features/presentation/widgets/contect_item.dart';
import 'package:flutter/material.dart';

/// [ContactsPage] represent contacts page
class ContactsPage extends StatelessWidget {
  /// [ContactsPage] constructor
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => const ContactsItem(),
      itemCount: 100,
    );
  }
}
