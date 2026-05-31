import 'dart:io';

import 'package:care_paws/modules/community/story_view/controller/story_view_controller.dart';
import 'package:care_paws/modules/community/story_view/widget/story_progress_widget.dart';
import 'package:care_paws/modules/community/story_view/widget/story_reply_bar_widget.dart';
import 'package:care_paws/modules/community/story_view/widget/story_view_top_widget.dart';
import 'package:flutter/material.dart';

class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen({super.key});

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {

  final StoryViewController controller = StoryViewController();

  @override
  void initState() {
    super.initState();
    startStory();
  }

  void startStory(){

    controller.startTimer(
          () => setState(() {}),
      nextStory,
    );
  }

  void nextStory(){

    if(controller.currentIndex < controller.stories.length - 1){

      setState(() {
        controller.currentIndex++;
      });

      startStory();

    } else {
      Navigator.pop(context); // end
    }
  }

  void prevStory(){

    if(controller.currentIndex > 0){

      setState(() {
        controller.currentIndex--;
      });

      startStory();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final story = controller.stories[controller.currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,

      body: GestureDetector(

        onTapUp: (details){
          final width = MediaQuery.of(context).size.width;

          if(details.localPosition.dx < width / 2){
            prevStory();
          } else {
            nextStory();
          }
        },

        onVerticalDragUpdate: (details){
          if(details.delta.dy > 10){
            Navigator.pop(context);
          }
        },

        child: Stack(
          children: [

            /// 🔥 FULL SCREEN IMAGE FIX
            SizedBox.expand(
              child: story.image.startsWith('assets')
                  ? Image.asset(story.image, fit: BoxFit.cover)
                  : Image.file(File(story.image), fit: BoxFit.cover),
            ),

            /// 🔥 PROGRESS BAR
            SafeArea(
              child: Column(
                children: [

                  /// 🔥 PROGRESS BAR
                  StoryProgressWidget(
                    count: controller.stories.length,
                    currentIndex: controller.currentIndex,
                    progress: controller.progress,
                  ),

                  const SizedBox(height: 10),

                  /// 🔥 TOP BAR (profile + username + close)
                  StoryViewTopWidget(),

                ],
              ),
            ),

            /// 🔥 REPLY BAR (FIXED POSITION)
            Positioned(
              bottom: 20,
              left: 12,
              right: 12,
              child: SafeArea(
                child: StoryReplyBarWidget(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}



// import 'package:care_paws/modules/community/story_view/widget/story_reply_bar_widget.dart';
// import 'package:care_paws/modules/community/story_view/widget/story_view_top_widget.dart';
// import 'package:flutter/material.dart';
//
//
// class StoryViewScreen extends StatelessWidget {
//   const StoryViewScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       backgroundColor: Colors.black,
//
//       body: Stack(
//         children: [
//
//           /// BACKGROUND STORY
//           Positioned.fill(
//             child: Image.asset(
//               "assets/images/cat1.jpg",
//               fit: BoxFit.cover,
//             ),
//           ),
//
//           /// TOP UI
//           const SafeArea(
//             child: StoryViewTopWidget(),
//           ),
//
//           /// BOTTOM REPLY
//           const Positioned(
//             bottom: 20,
//             left: 12,
//             right: 12,
//             child: StoryReplyBarWidget(),
//           ),
//
//         ],
//       ),
//     );
//   }
// }