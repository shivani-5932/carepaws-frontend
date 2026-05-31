import 'dart:io';

import 'package:flutter/material.dart';

class ProfileAvatarWidget extends StatelessWidget {

  final String image;
  final double size;

  /// story states
  final bool hasStory;
  final bool isStorySeen;

  const ProfileAvatarWidget({
    super.key,
    required this.image,
    this.size = 40,
    this.hasStory = false,
    this.isStorySeen = false,
  });

  @override
  Widget build(BuildContext context) {

    Color borderColor = Colors.transparent;

    if (hasStory && !isStorySeen) {
      borderColor = const Color(0xffFF9800); // highlighted
    }
    else if (hasStory && isStorySeen) {
      borderColor = Colors.orange.shade200; // light border
    }

    return Container(

      padding: hasStory ? const EdgeInsets.all(3) : EdgeInsets.zero,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: borderColor,
          width: hasStory ? 3 : 0,
        ),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),

        child: image.startsWith('assets')
            ? Image.asset(image,
            height: size,
            width: size,
            fit: BoxFit.cover)
            : Image.file(File(image),
            fit: BoxFit.cover),
        ),


    );
  }
}