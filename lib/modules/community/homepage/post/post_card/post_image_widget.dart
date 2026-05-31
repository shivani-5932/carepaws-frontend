import 'package:care_paws/modules/community/widget/likeable_media_widget.dart';
import 'package:flutter/material.dart';

class PostImageWidget extends StatelessWidget {
  final String image;

  final bool isLiked;
  final Function(bool) onDoubleTapLike;

  const PostImageWidget({
    super.key,
    required this.image,
    required this.isLiked,
    required this.onDoubleTapLike,
  });

  @override
  Widget build(BuildContext context) {

    return LikeableMediaWidget(
      initialLiked: isLiked,
      onLikeChanged: onDoubleTapLike,

      child: Image.asset(
        image,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}