import 'package:chat/features/presentation/widgets/calls_page.dart';
import 'package:chat/features/presentation/widgets/contacts_page.dart';
import 'package:chat/features/presentation/widgets/message_page.dart';
import 'package:chat/features/presentation/widgets/settings_page.dart';
import 'package:flutter/material.dart';

/// [homePages] represent home pages
List<Widget> get homePages => [
      const MessagePage(),
      const CallsPage(),
      const ContactsPage(),
      const SettingsPage(),
    ];
