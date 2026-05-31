import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';


class PetProfileAvatarSection extends StatelessWidget {
  const PetProfileAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {

     // 🔥 overlap effect

      return  Column(
        children: [

          /// PROFILE IMAGE
          Stack(
            children: [

              ProfileAvatarWidget(
                image: "assets/images/dog2.png",
                size: 107,
                hasStory: false,
              ),

              /// ADD ICON
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  child: const Icon(Icons.add, size: 16),
                ),
              )

            ],
          ),

          const SizedBox(height: 6),

          /// EDIT BUTTON
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey.shade300),
            ),

            child:  Text(
              "Edit",
              style: AppTextStyles.bodySmall,
            ),
          ),

        ],
      );
  }
}