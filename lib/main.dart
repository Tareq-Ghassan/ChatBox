import 'package:chat/core/presentation/pages/root.dart';
import 'package:chat/dependency_injection/di.dart';
import 'package:flutter/material.dart';

void main() async {
  await injectDependencies();
  runApp(const ChatApp());
}
