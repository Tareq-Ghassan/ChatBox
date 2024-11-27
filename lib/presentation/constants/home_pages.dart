import 'package:chat/presentation/widgets/calls_page.dart';
import 'package:chat/presentation/widgets/message_page.dart';
import 'package:flutter/material.dart';

/// [homePages] represent home pages
List<Widget> get homePages => [
      const MessagePage(),
      const CallsPage(),
      SliverList.builder(
        itemBuilder: (context, index) => const Text('contacts'),
        itemCount: 100,
      ),
      SliverList.builder(
        itemBuilder: (context, index) => const Text('settings'),
        itemCount: 100,
      ),
    ];
