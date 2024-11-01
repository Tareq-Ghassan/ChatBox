import 'package:chat/presentation/constants/assets/images.dart';
import 'package:chat/presentation/controller/splash_controller.dart';
import 'package:chat/provider/BloC/init/init_bloc.dart';
import 'package:chat/provider/BloC/init/init_state.dart';
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
    splashInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitBloc, InitState>(
      listener: splashListenerController,
      builder: (context, state) => Scaffold(
        body: Center(
          child: Image.asset(KImages.splashImage),
        ),
      ),
    );
  }
}
