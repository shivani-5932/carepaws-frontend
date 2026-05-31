import 'package:care_paws/modules/community/clips/widget/more_options_sheet.dart';
import 'package:care_paws/modules/community/comments/view/comment_sheet.dart';
import 'package:care_paws/modules/community/share/view/share_sheet_screen.dart';
import 'package:flutter/material.dart';
import 'package:care_paws/modules/community/homepage/like_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClipActionsWidget extends StatelessWidget {
  final String likes;
  final String comments;
  final String shares;

  const ClipActionsWidget({
    super.key,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  /// 🔹 Reusable Action Widget
  Widget action({
    required Widget icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          icon,
          const SizedBox(height: 5),

          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),

          const SizedBox(height: 18),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final likeController = Provider.of<LikeController>(context);

    return Column(
      children: [

        /// ❤️ LIKE BUTTON
        action(
          icon: SvgPicture.asset(
            likeController.isLiked
                ? "assets/icons/paw_filled.svg"
                : "assets/icons/paw.svg",
            height: 30,

            /// Brown color when liked
            // colorFilter: likeController.isLiked
            //     ? const ColorFilter.mode(
            //   Color(0xff8B5E3C),
            //   BlendMode.srcIn,
            // )
            //     : null,
          ),

          text: likes,

          onTap: () {
            likeController.toggleLike();
          },
        ),

        /// 💬 COMMENT
        action(
          icon: SvgPicture.asset(
            "assets/icons/comment.svg",
            height: 30,
          ),

          text: comments,

          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              builder: (context) {
                return const CommentsSheet();
              },
            );
          },
        ),

        /// 🔁 SHARE
        action(
          icon: SvgPicture.asset(
            "assets/icons/share.svg",
            height: 30,
          ),

          text: shares,

          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              builder: (context) {
                return const ShareSheetScreen();
              },
            );
          },
        ),

        /// ⋯ MORE OPTIONS
        action(
          icon: SvgPicture.asset(
            "assets/icons/more.svg",
            height: 30,
          ),

          text: "",

          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,

              builder: (context) {
                return const MoreOptionsSheet();
              },
            );
          },
        ),

        /// 🎵 AUDIO BUTTON
        action(
          icon: SvgPicture.asset(
            "assets/icons/audio.svg",
            height: 30,
          ),

          text: "",

          onTap: () {
            print("Open Audio Screen");
          },
        ),
      ],
    );
  }
}