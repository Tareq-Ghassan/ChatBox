import 'package:chat/common/function/common_functions.dart';
import 'package:chat/presentation/constants/assets/icons.dart';
import 'package:chat/presentation/constants/theme/colors.dart';
import 'package:chat/provider/cubit/ui_helper_cubit.dart';
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
        context.read<HomeIndexCubit>().index = index;
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            KIcons.message,
            color: context.watch<HomeIndexCubit>().state == 0
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
            color: context.watch<HomeIndexCubit>().state == 1
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
            color: context.watch<HomeIndexCubit>().state == 2
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
            color: context.watch<HomeIndexCubit>().state == 3
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
