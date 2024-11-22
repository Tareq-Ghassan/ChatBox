import 'package:chat/common/function/common_functions.dart';
import 'package:chat/presentation/constants/assets/icons.dart';
import 'package:chat/presentation/constants/theme/app/custom_styles.dart';
import 'package:chat/presentation/constants/theme/app/dark/theme_data_dark.dart';
import 'package:chat/presentation/constants/theme/colors.dart';
import 'package:chat/presentation/widgets/story_item.dart';
import 'package:flutter/material.dart';

/// [HomeScreenAppBar] represent home screen app bar and storise section
class HomeScreenAppBar extends StatelessWidget {
  /// [HomeScreenAppBar] constructor
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme,
      child: SliverAppBar.large(
        surfaceTintColor: KColors.greenHomePg,
        backgroundColor: KColors.greenHomePg,
        expandedHeight: MediaQuery.of(context).size.height * 0.25,
        leading: IconButton(
          style: iconButtonstyle,
          onPressed: () {},
          icon: Image.asset(
            KIcons.search,
          ),
        ),
        title: Text(appLocalizations.home),
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
            backgroundImage: NetworkImage('https://via.placeholder.com/50'),
          ),
        ],
      ),
    );
  }
}
