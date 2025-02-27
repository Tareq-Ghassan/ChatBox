import 'package:chat/core/presentation/assets/images.dart';
import 'package:chat/features/pre_login/ui/bloc/initialize_bloc.dart';
import 'package:chat/features/pre_login/ui/controller/splash_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [SplashScreen] represent splash screen
class SplashScreen extends StatefulWidget {
  /// [SplashScreen] constructor
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SplashControls.splashInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitializeBloc, InitializeState>(
      listener: SplashControls.splashListenerController,
      builder: (context, state) => Scaffold(
        body: Center(
          child: Image.asset(KImages.splashImage),
        ),
      ),
    );
  }
}
