import 'package:chat/core/presentation/theme/colors.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [CustomDismissible] a class that handles item dismiss animation
class CustomDismissible extends StatelessWidget {
  /// [CustomDismissible] constructor
  const CustomDismissible({
    required this.backgroundChild,
    required this.child,
    super.key,
  });

  /// [child]
  final Widget child;
  /// [backgroundChild]
  final Widget backgroundChild;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwipeOffsetCubit, double>(
      bloc: sl<SwipeOffsetCubit>(),
      builder: (context, swipeOffset) {
        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            sl<SwipeOffsetCubit>().updateOffset(
              details.delta.dx,
              MediaQuery.of(context).size.width / 2,
            );
          },
          onHorizontalDragEnd: (details) {
            //! Snap back to original position if swipe is incomplete
            if (swipeOffset > -MediaQuery.of(context).size.width / 2) {
              sl<SwipeOffsetCubit>().reset();
            }
          },
          child: Stack(
            children: [
              backgroundChild,
              Transform.translate(
                offset: Offset(swipeOffset, 0),
                child: ColoredBox(
                  color: isLightMode
                      ? swipeOffset == 0
                          ? KColors.white
                          : KColors.disableColor
                      : swipeOffset == 0
                          ? KColors.blackColor
                          : KColors.black87,
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
