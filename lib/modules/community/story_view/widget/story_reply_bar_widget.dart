import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoryReplyBarWidget extends StatelessWidget {
  const StoryReplyBarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        /// PROFILE
        const ProfileAvatarWidget(
            image: "assets/images/dog1.png",
            size: 44,),

        const SizedBox(width: 8),

        /// INPUT
        Expanded(
          child: Container(
            height: 44,
            width: 216,
            padding: const EdgeInsets.symmetric(horizontal: 12),

            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),

            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Write a Message...",
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        const SizedBox(width: 8),

        /// SEND BUTTON
        Container(
          height: 40,
          width: 60,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xff6F4E37),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset("assets/icons/send.svg",
          height: 32,
          width: 32,)
        ),

      ],
    );
  }
}