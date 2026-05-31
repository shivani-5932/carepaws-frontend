import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoryViewTopWidget extends StatelessWidget {
  const StoryViewTopWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

      child: Column(
        children: [

          /// TOP ROW
          Row(
            children: [

              /// BACK
              Container(
                  height:32,
                  width:32,
                  child: Center(
                      child: buildIcon(Icons.arrow_back))),

              const SizedBox(width: 10),

              /// PROFILE
              const ProfileAvatarWidget(image: "assets/images/cat1.png",size: 32,),

              const SizedBox(width: 8),

              /// NAME + VERIFIED
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Text(
                        "Kitti_Katty",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      SvgPicture.asset("assets/icons/verified.svg", height:24),
                    ],
                  ),

                  Text(
                    "🎵 LALALA - SHAKIRA",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),

                ],
              ),

              const Spacer(),

              /// MORE
              Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: const Color(0x803B2F2F),
                    borderRadius:
                    BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: SvgPicture.asset("assets/icons/more.svg",
                    color: Colors.white,),
                  ))
              // buildIcon(Icons.more_horiz),

            ],
          ),

        ],
      ),
    );
  }

  Widget buildIcon(IconData icon){
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}