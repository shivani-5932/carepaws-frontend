import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareActionBarWidget extends StatelessWidget {

  const ShareActionBarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(vertical: 12),

      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children:  [

          Column(
            children: [
              SvgPicture.asset("assets/icons/addStory.svg",
              height: 40,
              width: 40,),
              SizedBox(height: 4),
              Text("Add to Story",
                style: AppTextStyles.bodySmall.copyWith(color: Colors.black),)
            ],
          ),

          Column(
            children: [
              SvgPicture.asset("assets/icons/shareMedia.svg",
                height: 40,
                width: 40,),
              SizedBox(height: 4),
              Text("Share",
                style: AppTextStyles.bodySmall.copyWith(color: Colors.black),)
            ],
          ),

          Column(
            children: [
              SvgPicture.asset("assets/icons/copy.svg",
                height: 40,
                width: 40,),
              SizedBox(height: 4),
              Text("Copy Link",
                style: AppTextStyles.bodySmall.copyWith(color: Colors.black),)
            ],
          ),

          Column(
            children: [
              SvgPicture.asset("assets/icons/download.svg",
                height: 40,
                width: 40,),
              SizedBox(height: 4),
              Text("Download",
              style: AppTextStyles.bodySmall.copyWith(color: Colors.black),)
            ],
          ),

        ],
      ),
    );
  }
}