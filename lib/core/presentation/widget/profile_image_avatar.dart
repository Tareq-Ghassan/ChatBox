import 'package:chat/core/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

///[ProfileImageAvatar] a circular avatar for profile image
class ProfileImageAvatar extends StatelessWidget {
  /// [ProfileImageAvatar] constructor
  const ProfileImageAvatar({
    required this.imageUrl,
    super.key,
  });

  /// [imageUrl] holds the image url
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: KColors.grayColor,
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: 48,
          height: 48,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.person,
              size: 32,
              color: KColors.white,
            );
          },
        ),
      ),
    );
  }
}
