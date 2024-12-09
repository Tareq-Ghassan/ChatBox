import 'package:chat/features/home/ui/widgets/call_iteam.dart';
import 'package:flutter/material.dart';

/// [CallsPage] represent calls page
class CallsPage extends StatelessWidget {
  /// [CallsPage] constructor
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => const CallIteam(),
      itemCount: 10,
    );
  }
}