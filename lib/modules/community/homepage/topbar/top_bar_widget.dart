import 'package:care_paws/core/navigation/app_routes.dart';
import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/uploads/post_clip_upload/view/upload_soon_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: Row(
        children: [

          // Left icons
          Row(
            children: [
              InkWell(
                child: SvgPicture.asset(
                  "assets/icons/add.svg",
                  height: 32,
                  width: 32,
                ),
                onTap: (){
                  Navigator.pushNamed(
                    context,
                    AppRoutes.upload,
                  );
                },
              ),
              const SizedBox(width: 16),
              InkWell(
                child: SvgPicture.asset(
                  "assets/icons/search.svg",
                  height: 32,
                  width: 32,
                ),
                onTap: (){
                  Navigator.pushNamed(
                    context,
                    AppRoutes.explore,
                  );
                },
              ),
            ],
          ),

          const Spacer(),

          // App Name
           Text(
            "CarePaws",
            style: AppTextStyles.h1.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xff4E4038),
            ),
          ),

          const Spacer(),

          // Right icons
          Row(
            children: [
              InkWell(
                child: SvgPicture.asset(
                  "assets/icons/paw.svg",
                  height: 32,
                  width: 32,
                ),
                onTap: (){
                  Navigator.pushNamed(context, AppRoutes.notifications);
                },
              ),
              const SizedBox(width: 16),
              InkWell(
                child: SvgPicture.asset(
                  "assets/icons/share.svg",
                  height: 32,
                  width: 32,
                ),
                onTap: (){
                  Navigator.pushNamed(
                    context,
                    AppRoutes.messages,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}