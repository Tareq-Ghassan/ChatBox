import 'package:flutter/material.dart';

/// [StoryItem] represent user Story
class StoryItem extends StatelessWidget {
  /// [StoryItem] constructor
  const StoryItem({
    required this.name,
    required this.imageUrl,
    super.key,
  });

  /// [name] represent user name
  final String name;

  /// [imageUrl] represent user image
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(height: 8),
          Text(
            name,
          ),
        ],
      ),
    );
  }
}
