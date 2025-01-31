import 'package:chat/core/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

/// [AuthHeader] represent screen header for all auth screens
class AuthHeader extends StatelessWidget {
  /// [AuthHeader] constructor
  const AuthHeader({
    required this.title,
    required this.subtitle,
    super.key,
  });

  /// [title] represent title
  final String title;

  /// [subtitle] represent subtitle
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: KColors.grayColor),
          ),
        ),
      ],
    );
  }
}
