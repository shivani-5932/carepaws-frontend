import 'dart:io'; // ✅ ADD THIS
import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/story_view/view/story_view_screen.dart';
import 'package:care_paws/modules/community/uploads/story_upload/view/story_upload_screen.dart';
import 'package:care_paws/modules/community/widget/media_picker_bottom_sheet.dart';
import 'package:care_paws/utils/media_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:care_paws/modules/community/homepage/story/model/story_model.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';

class StoryItemWidget extends StatelessWidget {

  final StoryModel story;

  StoryItemWidget({
    super.key,
    required this.story,
  });

  final MediaPickerService _mediaService = MediaPickerService();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () async {

        /// 🔥 MY STORY → OPEN PICKER SHEET
        if (story.isAddStory) {

          showModalBottomSheet(
            context: context,
            builder: (_) {
              return CommonMediaPickerBottomSheet(
                onSelected: (file, isVideo) {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => StoryUploadScreen(
                        initialMedia: file,
                        isVideo: isVideo,
                      ),
                    ),
                  );

                },
              );
            },
          );
        }

        /// 🔥 OTHER STORY → VIEW
        else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => StoryViewScreen(),
            ),
          );
        }
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),

        child: Column(
          children: [

            Stack(
              children: [

                ProfileAvatarWidget(
                  image: story.image,
                  size: 72,
                  hasStory: !story.isAddStory,
                  isStorySeen: story.isViewed,
                ),

                if (story.isAddStory)
                  Positioned(
                    right: -2,
                    bottom: -2,
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, size: 20),
                    ),
                  ),

              ],
            ),

            const SizedBox(height: 6),

            Text(
              story.username,
              style: AppTextStyles.bodySmall.copyWith(fontSize: 12),
            )

          ],
        ),
      ),
    );
  }
}