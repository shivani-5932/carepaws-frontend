import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostHeaderWidget extends StatelessWidget {
  final String profileImage;
  final String username;
  final bool isVerified;
  final Widget moreIcon;

  const PostHeaderWidget({
    super.key,
    required this.profileImage,
    required this.username,
    required this.isVerified,
    required this.moreIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [

          ProfileAvatarWidget(
            image: profileImage,
            size: 32,
          ),

          const SizedBox(width: 10),

          Text(
            username,
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),

          if (isVerified)
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SvgPicture.asset(
                "assets/icons/verified.svg",
                height: 24,
              ),
            ),

          const Spacer(),

          SvgPicture.asset(
            "assets/icons/more.svg",
            height: 32,
          ),
        ],
      ),
    );
  }
}