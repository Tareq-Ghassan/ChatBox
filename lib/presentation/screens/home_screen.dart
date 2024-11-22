import 'package:chat/presentation/constants/home_pages.dart';
import 'package:chat/presentation/widgets/bottom_navigation_bar.dart';
import 'package:chat/presentation/widgets/home_screen_appbar.dart';
import 'package:chat/provider/cubit/ui_helper_cubit.dart';
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
