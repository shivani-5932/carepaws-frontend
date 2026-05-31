import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/comments/view/comment_sheet.dart';
import 'package:care_paws/modules/community/share/view/share_sheet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostActionsWidget extends StatelessWidget {

  final bool isLiked;
  final int likeCount;
  final VoidCallback onLikeToggle;
  final bool isSaved;
  final VoidCallback onSaveToggle;

  final Widget pawIcon;
  final Widget commentIcon;
  final Widget shareIcon;
  final Widget saveIcon;

  final String comments;
  final String shares;

  const PostActionsWidget({
    super.key,
    required this.isLiked,
    required this.likeCount,
    required this.onLikeToggle,
    required this.isSaved,
    required this.onSaveToggle,
    required this.pawIcon,
    required this.commentIcon,
    required this.shareIcon,
    required this.saveIcon,
    required this.comments,
    required this.shares,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

      child: Row(
        children: [

          /// 🔥 LIKE BUTTON
          InkWell(
            onTap: onLikeToggle,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2), // glass feel
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [

              SvgPicture.asset(
              isLiked
              ? "assets/icons/paw_filled.svg"   // 🔥 filled
                : "assets/icons/paw.svg", // outline
                height: 25,

                  /// 🔥 Default outline black
                  colorFilter: ColorFilter.mode(
                    isLiked
                        ? const Color(0xff6F4E37) // liked = brown
                        : Colors.black,           // default outline
                    BlendMode.srcIn,
                  ),
              ),

                  const SizedBox(width: 4),

                  Text(
                    likeCount.toString(),
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 20),

          /// COMMENT
          InkWell(
            onTap: (){
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                builder: (context) {
                  return const CommentsSheet();
                },
              );
            },
            child: Column(
              children: [
                commentIcon,
                const SizedBox(width: 4),
                Text(comments, style: AppTextStyles.bodySmall),
              ],
            ),
          ),

          const SizedBox(width: 20),

          /// SHARE
          InkWell(
            onTap: (){
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return const ShareSheetScreen();
                },
              );
            },
            child: Column(
              children: [
                shareIcon,
                const SizedBox(width: 4),
                Text(shares, style: AppTextStyles.bodySmall),
              ],
            ),
          ),

          const Spacer(),

          InkWell(
            onTap: onSaveToggle,
            child: SvgPicture.asset(
              isSaved
                  ? "assets/icons/save_filled.svg"
                  : "assets/icons/save_outline.svg",
              height: 32,
              color: isSaved
                  ? Colors.black // 🔥 solid black when saved
                  : Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}