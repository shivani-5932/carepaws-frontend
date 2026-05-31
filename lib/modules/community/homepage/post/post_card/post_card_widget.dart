import 'package:care_paws/modules/community/homepage/post/model/post_model.dart';
import 'package:care_paws/modules/community/homepage/post/post_card/post_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'post_header_widget.dart';
import 'post_image_widget.dart';
import 'post_caption_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PostCardWidget extends StatefulWidget {

  final PostModel post;

  const PostCardWidget({super.key, required this.post});

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {

  bool isLiked = false;
  late int likeCount;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    likeCount = int.tryParse(widget.post.likes) ?? 0;
  }

  void handleLike(bool likedFromDoubleTap){

    setState(() {

      /// double tap case
      if(likedFromDoubleTap){
        if(!isLiked){
          likeCount++;
        }
        isLiked = true;
      }

      /// toggle button case
      else{
        isLiked = !isLiked;

        if(isLiked){
          likeCount++;
        } else {
          likeCount--;
        }
      }

    });
  }

  void toggleSave(){
    setState(() {
      isSaved = !isSaved;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        PostHeaderWidget(
          profileImage: widget.post.profileImage,
          username: widget.post.username,
          isVerified: widget.post.isVerified,
          moreIcon:SvgPicture.asset("assets/icons/more.svg", height: 18),
        ),

        PostImageWidget(
          image: widget.post.postImage,
          isLiked: isLiked,
          onDoubleTapLike: (liked){
            handleLike(false);
          },
        ),

        PostActionsWidget(
          isLiked: isLiked,
          likeCount: likeCount,
          onLikeToggle: (){
            handleLike(false);
          },


          isSaved: isSaved, // 👈 NEW
          onSaveToggle: toggleSave, // 👈 NEW

          pawIcon: SvgPicture.asset("assets/icons/paw.svg", height: 24),
          commentIcon: SvgPicture.asset("assets/icons/comment.svg", height: 24),
          shareIcon: SvgPicture.asset("assets/icons/share.svg", height: 24),
          saveIcon: SvgPicture.asset("assets/icons/save.svg", height: 24),

          comments: widget.post.comments,
          shares: widget.post.shares,
        ),



        PostCaptionWidget(
          caption: widget.post.caption,
          time: widget.post.timeAgo,
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}