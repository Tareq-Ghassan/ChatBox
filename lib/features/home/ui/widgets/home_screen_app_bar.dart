import 'package:chat/core/presentation/assets/icons.dart';
import 'package:chat/core/presentation/theme/app/custom_styles.dart';
import 'package:chat/core/presentation/theme/app/dark/theme_data_dark.dart';
import 'package:chat/core/presentation/theme/colors.dart';
import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:chat/features/home/ui/widgets/story_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [HomeScreenAppBar] represent home screen app bar and stories section
class HomeScreenAppBar extends StatelessWidget {
  /// [HomeScreenAppBar] constructor
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme,
      child: context.watch<HomeIndexCubit>().state == 0
          ? SliverAppBar.large(
              surfaceTintColor: KColors.greenHomePg,
              backgroundColor: KColors.greenHomePg,
              expandedHeight: MediaQuery.of(context).size.height * 0.25,
              leading: IconButton(
                style: iconButtonStyle,
                onPressed: () {},
                icon: Image.asset(
                  KIcons.search,
                ),
              ),
              title: Text(context.watch<AppBarTitleCubit>().state),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 2.5 * kToolbarHeight),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => const StoryItem(
                          name: 'My status',
                          imageUrl: 'https://via.placeholder.com/50',
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              actions: const [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/50'),
                ),
              ],
            )
          : SliverAppBar(
            pinned: true,
              surfaceTintColor: KColors.greenHomePg,
              backgroundColor: KColors.greenHomePg,
              leading: IconButton(
                style: iconButtonStyle,
                onPressed: () {},
                icon: Image.asset(
                  KIcons.search,
                ),
              ),
              centerTitle: true,
              title: Text(context.watch<AppBarTitleCubit>().state),
              actions: [
                IconButton(
                  style: iconButtonStyle,
                  onPressed: () {},
                  icon: Image.asset(
                    KIcons.search,
                  ),
                ),
              ],
            ),
    );
  }
}
