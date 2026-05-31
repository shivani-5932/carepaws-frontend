import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClipInfoWidget extends StatelessWidget {
  final String profileImage;
  final String username;
  final bool verified;
  final String caption;
  final String audio;

  const ClipInfoWidget({
    super.key,
    required this.profileImage,
    required this.username,
    required this.verified,
    required this.caption,
    required this.audio,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// PROFILE ROW
        Row(
          children: [

          ProfileAvatarWidget(image: profileImage,
              size:32),

            const SizedBox(width: 10),

            Text(
              username,
              style: AppTextStyles.bodySmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            if (verified)
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: SvgPicture.asset(
                  "assets/icons/verified.svg",
                  height: 18,
                ),
              ),

            const SizedBox(width: 10),

            Container(
              height: 28,
              width: 99,
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: const Text("Follow"),
            )
          ],
        ),

        const SizedBox(height: 10),

        /// CAPTION
        Text(
          caption,
          style: AppTextStyles.bodySmall.copyWith(color: Colors.white),
        ),

        const SizedBox(height: 6),

        /// AUDIO
        Text(
          audio,
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}