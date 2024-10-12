import 'package:chat/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

/// [ChatApp] represent the root screen
class ChatApp extends StatelessWidget {
  /// [ChatApp] constructor
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

