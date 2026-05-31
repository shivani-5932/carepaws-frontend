import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/comments/model/comment_model.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CommentItemWidget extends StatefulWidget {

  final CommentModel comment;
  final VoidCallback? onDelete;

  const CommentItemWidget({
    super.key,
    required this.comment,
    this.onDelete,
  });

  @override
  State<CommentItemWidget> createState() => _CommentItemWidgetState();
}

class _CommentItemWidgetState extends State<CommentItemWidget> {

  bool isLiked = false;
  bool showDelete = false;
  bool isDeleted = false;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    likeCount = int.tryParse(widget.comment.likes) ?? 0;
  }

  void toggleLike(){
    setState(() {
      isLiked = !isLiked;
      isLiked ? likeCount++ : likeCount--;
    });
  }

  void handleDelete(){
    setState(() {
      isDeleted = true;
    });

    Future.delayed(const Duration(seconds: 1), (){
      widget.onDelete?.call();
    });
  }

  @override
  Widget build(BuildContext context) {

    if(isDeleted){
      return const Padding(
        padding: EdgeInsets.all(8),
        child: Text("Deleted!", style: TextStyle(color: Colors.red)),
      );
    }

    return GestureDetector(

      onLongPress: (){
        if(widget.comment.isMine){
          setState(() {
            showDelete = !showDelete;
          });
        }
      },

      child: Column(
        children: [

          ListTile(

            leading: ProfileAvatarWidget(
              image: widget.comment.image,
              size: 44,
              hasStory: false,
            ),

            title: Row(
              children: [
                Text(widget.comment.username),

                if(widget.comment.verified)
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SvgPicture.asset(
                      "assets/icons/verified.svg",
                      height: 24,
                    ),
                  )
              ],
            ),

            subtitle: Text(widget.comment.comment),

            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                /// 🔥 LIKE TOGGLE
                GestureDetector(
                  onTap: toggleLike,
                  child: isLiked
              ? SvgPicture.asset(
                    "assets/icons/paw_filled.svg",
                    height: 16,
                    color: isLiked
                        ? const Color(0xff6F4E37)
                        : Colors.black,)
                  : SvgPicture.asset(
                    "assets/icons/paw.svg",
                    height: 16,)


                  ),



                const SizedBox(width: 4),
                Text(likeCount.toString()),
              ],
            ),
          ),

          /// 🔥 DELETE BUTTON INLINE
          if(showDelete)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 5),
                child: GestureDetector(
                  onTap: handleDelete,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Text(
                      "Delete",
                      style: AppTextStyles.bodySmall.copyWith(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
}