import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/contrast_button.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';

import '../model/notification_model.dart';

class NotificationTileWidget extends StatefulWidget {

  final NotificationModel notification;

  const NotificationTileWidget({
    super.key,
    required this.notification,
  });

  @override
  State<NotificationTileWidget> createState() =>
      _NotificationTileWidgetState();
}

/// 🔥 STATE CLASS OUTSIDE (IMPORTANT)
class _NotificationTileWidgetState
    extends State<NotificationTileWidget> {

  late bool isFollowing;

  @override
  void initState() {
    super.initState();
    isFollowing = widget.notification.isFollowing;
  }

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {

    final notification = widget.notification;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

      child: Row(
        children: [

          /// PROFILE
          ProfileAvatarWidget(
            image: notification.image,
            size: 44,
            hasStory: false,
          ),

          const SizedBox(width: 10),

          /// TEXT
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.bodySmall
                    .copyWith(color: Colors.black),

                children: [

                  TextSpan(
                    text: notification.username,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),

                  TextSpan(
                    text: " ${notification.action}",
                  ),

                  TextSpan(
                    text: "  ${notification.time}",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey,
                    ),
                  ),

                ],
              ),
            ),
          ),

          /// RIGHT SIDE
          if (notification.showFollow)

            SizedBox(
              width: 100,

              /// 🔥 USE LOCAL isFollowing
              child: isFollowing
                  ? ContrastButton(
                text: "Following",
                height: 32,
                onTap: toggleFollow,
              )
                  : PrimaryButton(
                text: "Follow",
                height: 32,
                onTap: toggleFollow,
              ),
            )

          else if (notification.postImage != null)

            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                notification.postImage!,
                height: 44,
                width: 44,
                fit: BoxFit.cover,
              ),
            )

        ],
      ),
    );
  }
}