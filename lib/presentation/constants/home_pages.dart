import 'package:chat/presentation/widgets/message_page.dart';
import 'package:flutter/material.dart';
/// [homePages] represent home pages
List<Widget> get homePages => [
      const MessagePage(),
      SliverList.builder(
        itemBuilder: (context, index) => const Text('calls'),
        itemCount: 100,
      ),
      SliverList.builder(
        itemBuilder: (context, index) => const Text('contacts'),
        itemCount: 100,
      ),
      SliverList.builder(
        itemBuilder: (context, index) => const Text('settings'),
        itemCount: 100,
      ),
    ];
