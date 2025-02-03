import 'package:chat/features/chat/ui/pages/home_chat_page.dart';
import 'package:chat/features/home/ui/widgets/calls_page.dart';
import 'package:chat/features/home/ui/widgets/contacts_page.dart';
import 'package:chat/features/home/ui/widgets/settings_page.dart';
import 'package:flutter/material.dart';

/// [homePages] represent home pages
List<Widget> get homePages => [
      const HomeChatPage(),
      const CallsPage(),
      const ContactsPage(),
      const SettingsPage(),
    ];
