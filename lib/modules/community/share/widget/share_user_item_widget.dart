import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';
import '../model/share_user_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareUserItemWidget extends StatelessWidget {

  final ShareUserModel user;
  final VoidCallback onTap;

  const ShareUserItemWidget({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Column(
        children: [

          Stack(
            children: [

              ProfileAvatarWidget(
                image: user.image,
                size: 64,
                hasStory: false,
              ),

              if (user.selected)
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xffF5E9DF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.brown,
                    ),
                  ),
                ),

              if (user.verified)
                Positioned(
                  right: 4,
                  top: 4,
                  child: SvgPicture.asset(
                    "assets/icons/verified.svg",
                    height: 16,
                  ),
                )

            ],
          ),

          const SizedBox(height: 6),

          Text(
            user.username,
            style: AppTextStyles.bodySmall.copyWith(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          )

        ],
      ),
    );
  }
}