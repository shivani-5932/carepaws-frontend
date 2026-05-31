import 'package:care_paws/modules/community/clips/model/clip_model.dart';
import 'package:care_paws/modules/community/clips/widget/clip_action_widget.dart';
import 'package:care_paws/modules/community/clips/widget/clip_video_widget.dart';
import 'package:care_paws/modules/community/widget/likeable_media_widget.dart';

import 'package:flutter/material.dart';
import 'clip_info_widget.dart';


class ClipItemWidget extends StatelessWidget {
  final ClipModel clip;

  const ClipItemWidget({super.key, required this.clip});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        /// 🎬 VIDEO
        Positioned.fill(
          child: LikeableMediaWidget(
            initialLiked: false,
            onLikeChanged: (liked) {
              print("Liked: $liked");
            },
            child: ClipVideoWidget(
              videoUrl: clip.videoUrl,
            ),
          ),
        ),

        /// 🔥 ACTIONS (RIGHT SIDE)
        Positioned(
          right: 12,
          bottom: 90, // ✅ FINAL VALUE

          child: ClipActionsWidget(
            likes: clip.likes,
            comments: clip.comments,
            shares: clip.shares,
          ),
        ),

        /// 🔥 INFO (LEFT SIDE)
        Positioned(
          left: 12,
          right: 80,
          bottom: 70, // ✅ FINAL VALUE

          child: ClipInfoWidget(
            profileImage: clip.profileImage,
            username: clip.username,
            verified: clip.verified,
            caption: clip.caption,
            audio: clip.audio,
          ),
        ),

      ],
    );
  }
}