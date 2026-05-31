import 'package:care_paws/modules/community/homepage/post/model/post_model.dart';
import 'package:care_paws/modules/community/homepage/post/post_card/post_card_widget.dart';
import 'package:care_paws/modules/community/homepage/story/stories_widget.dart';
import 'package:care_paws/modules/community/homepage/topbar/top_bar_widget.dart';
import 'package:care_paws/modules/community/navbar/navbar_widget.dart';
import 'package:flutter/material.dart';



class CommunityHomePage extends StatelessWidget {
   CommunityHomePage({super.key});

  final List<PostModel> posts = [

    PostModel(
      profileImage: "assets/images/cat1.png",
      username: "cat_baby",
      isVerified: true,
      postImage: "assets/images/cat1.png",
      likes: "424000",
      comments: "345",
      shares: "990000",
      caption: "my kitti reel #famous #wow",
      timeAgo: "2 days ago",
    ),

    PostModel(
      profileImage: "assets/images/dog1.png",
      username: "puppy_12",
      isVerified: false,
      postImage: "assets/images/dog1.png",
      likes: "12000",
      comments: "200",
      shares: "1000",
      caption: "cute puppy 🐶",
      timeAgo: "5 hours ago",
    ),

    PostModel(
      profileImage: "assets/images/rabbit1.png",
      username: "puppy_12",
      isVerified: false,
      postImage: "assets/images/rabbit1.png",
      likes: "12000",
      comments: "200",
      shares: "1000",
      caption: "cute puppy 🐶",
      timeAgo: "5 hours ago",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Column(
          children: [

            /// Top Bar
            const TopBarWidget(),

            /// Feed + Stories
            Expanded(
              child: ListView(
                children: [

                  const SizedBox(height: 8),
                  const StoriesWidget(),
                  const SizedBox(height: 10),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return PostCardWidget(
                        post: posts[index],
                      );
                    },
                  ),

                ],
              ),
            )

          ],
        ),
      ),

      /// Bottom Navigation
      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}