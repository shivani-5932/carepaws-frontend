import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';

class HighlightItemWidget extends StatelessWidget {

  final String image;
  final String title;

  const HighlightItemWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),

      child: Column(
        children: [

          ProfileAvatarWidget(
            image: image,
            size: 65,
            hasStory: false,
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: const TextStyle(fontSize: 11),
            overflow: TextOverflow.ellipsis,
          ),

        ],
      ),
    );
  }
}