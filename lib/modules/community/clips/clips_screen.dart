import 'package:care_paws/modules/community/clips/model/clip_model.dart';
import 'package:care_paws/modules/community/clips/widget/clip_item_widget.dart';
import 'package:care_paws/modules/community/navbar/navbar_widget.dart';
import 'package:flutter/material.dart';


class ClipsScreen extends StatelessWidget {
  ClipsScreen({super.key});

  final List<ClipModel> clips = [
    ClipModel(
      videoUrl: "assets/videos/clip1.mp4",
      profileImage: "assets/images/dog1.png",
      username: "tuffy_my_tuffy.4567",
      verified: true,
      caption: "Editing tasty tasty, and two kids playing tog",
      audio: "LALALA - SHAKIRA",
      likes: "424k",
      comments: "345",
      shares: "990k",
    ),
    ClipModel(
      videoUrl: "assets/videos/clip2.mp4",
      profileImage: "assets/images/dog1.png",
      username: "tuffy_my_tuffy.4567",
      verified: true,
      caption: "Editing tasty tasty, and two kids playing tog",
      audio: "LALALA - SHAKIRA",
      likes: "424k",
      comments: "345",
      shares: "990k",
    ),
    ClipModel(
      videoUrl: "assets/videos/clip3.mp4",
      profileImage: "assets/images/dog1.png",
      username: "tuffy_my_tuffy.4567",
      verified: true,
      caption: "Editing tasty tasty, and two kids playing tog",
      audio: "LALALA - SHAKIRA",
      likes: "424k",
      comments: "345",
      shares: "990k",
    ),
    ClipModel(
      videoUrl: "assets/videos/clip4.mp4",
      profileImage: "assets/images/dog1.png",
      username: "tuffy_my_tuffy.4567",
      verified: true,
      caption: "Editing tasty tasty, and two kids playing tog",
      audio: "LALALA - SHAKIRA",
      likes: "424k",
      comments: "345",
      shares: "990k",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: PageView.builder(

         /// REELS STYLE
         scrollDirection: Axis.vertical,

         /// If you want horizontal reels later
         /// scrollDirection: Axis.horizontal,

         itemCount: clips.length,
         allowImplicitScrolling: true,

         itemBuilder: (context, index) {
           return ClipItemWidget(
             clip: clips[index],
           );
         },

       ),
        bottomNavigationBar: const BottomNavbarWidget(),

      //PageView.builder(
      //
      //   /// 🔹 VERTICAL SCROLL (Reels style)
      //   scrollDirection: Axis.vertical,
      //
      //   /// 🔹 If you want horizontal clips later
      //   /// scrollDirection: Axis.horizontal,
      //
      //   itemCount: clips.length,
      //   itemBuilder: (context, index) {
      //     return ClipItemWidget(clip: clips[index]);
      //   },
      // ),
    );
  }
}