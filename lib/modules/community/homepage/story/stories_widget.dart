import 'package:care_paws/modules/community/data/story_data.dart';
import 'package:flutter/material.dart';
import 'story_item_widget.dart';
import 'package:care_paws/modules/community/homepage/story/model/story_model.dart';

class StoriesWidget extends StatelessWidget {

  const StoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final List<StoryModel> stories = [

      /// 🔥 ADD STORY (always first)
      StoryModel(
        image: "assets/images/dog1.png",
        username: "My Pet",
        isAddStory: true,
      ),

      /// 🔥 USER UPLOADED STORIES
      ...StoryData.userStories.map(
            (file) => StoryModel(
          image: file.path, // 🔥 important
          username: "You",
          isViewed: false,
        ),
      ),

      /// 🔥 OTHER STORIES (existing)
      StoryModel(
        image: "assets/images/cat1.png",
        username: "kitti_katty",
      ),

      // ...rest same

      StoryModel(
        image: "assets/images/dog2.png",
        username: "puppy_12",
        isViewed: true,
      ),

      StoryModel(
        image: "assets/images/cat2.png",
        username: "puppy_12",
        isViewed: true,
      ),

      StoryModel(
        image: "assets/images/rabbit1.png",
        username: "puppy_12",
        isViewed: true,
      ),

    StoryModel(
    image: "assets/images/cat1.png",
    username: "kitti_katty",
    ),

    StoryModel(
    image: "assets/images/dog2.png",
    username: "puppy_12",
    isViewed: false,
    ),


      StoryModel(
        image: "assets/images/rabbit1.png",
        username: "puppy_12",
        isViewed: true,
      ),

      StoryModel(
        image: "assets/images/cat1.png",
        username: "kitti_katty",
      ),

      StoryModel(
        image: "assets/images/dog2.png",
        username: "puppy_12",
        isViewed: false,
      ),


      StoryModel(
        image: "assets/images/rabbit1.png",
        username: "puppy_12",
        isViewed: true,
      ),

      StoryModel(
        image: "assets/images/cat1.png",
        username: "kitti_katty",
      ),

      StoryModel(
        image: "assets/images/dog2.png",
        username: "puppy_12",
        isViewed: false,
      ),

    ];

    // unseen first, seen last
    stories.sort((a, b) {
      // keep Add Story always first
      if (a.isAddStory) return -1;
      if (b.isAddStory) return 1;

      if (a.isViewed == b.isViewed) return 0;
      return a.isViewed ? 1 : -1;
    });

    return SizedBox(
      height: 110,

      child: ListView.builder(

        scrollDirection: Axis.horizontal,

        itemCount: stories.length,

        itemBuilder: (context, index) {

          return StoryItemWidget(
            story: stories[index],
          );

        },
      ),
    );
  }
}