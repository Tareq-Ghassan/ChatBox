import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:chat/features/home/ui/controls/home_pages.dart';
import 'package:chat/features/home/ui/widgets/bottom_navigation_bar.dart';
import 'package:chat/features/home/ui/widgets/home_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [HomeScreen] represent home screen
class HomeScreen extends StatelessWidget {
  /// [HomeScreen] constructor
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeBottomNavigation(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const HomeScreenAppBar(),
          homePages[context.watch<HomeIndexCubit>().state],
        ],
      ),
    );
  }
}
