import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/chat/ui/bloc/chats_bloc.dart';
import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:chat/features/home/ui/controls/home_pages.dart';
import 'package:chat/features/home/ui/widgets/bottom_navigation_bar.dart';
import 'package:chat/features/home/ui/widgets/home_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [_HomePage] represent home screen
class _HomePage extends StatefulWidget {
  /// [_HomePage] constructor
  const _HomePage();

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  @override
  void initState() {
    sl<ChatsBloc>().add(const GetAllChats(index: 1, perPage: 10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeIndexCubit>(
          create: (_) => sl<HomeIndexCubit>(),
        ),
        BlocProvider<AppBarTitleCubit>(
          create: (_) => sl<AppBarTitleCubit>(),
        ),
      ],
      child: BlocBuilder<HomeIndexCubit, int>(
        bloc: sl<HomeIndexCubit>(),
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: const HomeBottomNavigation(),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const HomeScreenAppBar(),
                homePages[sl<HomeIndexCubit>().state],
              ],
            ),
          );
        },
      ),
    );
  }
}

/// [HomePageBlocScope] hold login Page and provide its blocs
class HomePageBlocScope extends StatelessWidget {
  /// [HomePageBlocScope] constructor
  const HomePageBlocScope({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatsBloc>(
          create: (_) => sl<ChatsBloc>(),
        ),
        BlocProvider<SwipeOffsetCubit>(
          create: (_) => sl<SwipeOffsetCubit>(),
        ),
      ],
      child: const _HomePage(),
    );
  }
}
