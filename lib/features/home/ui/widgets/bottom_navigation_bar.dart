import 'package:chat/core/presentation/assets/icons.dart';
import 'package:chat/core/presentation/theme/colors.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:chat/features/home/ui/controls/home_titles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [HomeBottomNavigation] represent bottom navigation for app
class HomeBottomNavigation extends StatelessWidget {
  ///[HomeBottomNavigation] constructor
  const HomeBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.watch<HomeIndexCubit>().state,
      onTap: (int index) async {
        sl<HomeIndexCubit>().index = index;
        sl<AppBarTitleCubit>().title = homeTitles[index];
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            KIcons.message,
            color: sl<HomeIndexCubit>().state == 0
                ? KColors.greenColor
                : isLightMode
                    ? KColors.lightBlackColor
                    : KColors.white,
          ),
          label: appLocalizations.message,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            KIcons.call,
            color: sl<HomeIndexCubit>().state == 1
                ? KColors.greenColor
                : isLightMode
                    ? KColors.lightBlackColor
                    : KColors.white,
          ),
          label: appLocalizations.calls,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            KIcons.user,
            color: sl<HomeIndexCubit>().state == 2
                ? KColors.greenColor
                : isLightMode
                    ? KColors.lightBlackColor
                    : KColors.white,
          ),
          label: appLocalizations.contacts,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            KIcons.settings,
            color: sl<HomeIndexCubit>().state == 3
                ? KColors.greenColor
                : isLightMode
                    ? KColors.lightBlackColor
                    : KColors.white,
          ),
          label: appLocalizations.settings,
        ),
      ],
    );
  }
}
