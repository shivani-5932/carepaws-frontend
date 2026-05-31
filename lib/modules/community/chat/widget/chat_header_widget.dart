import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatHeaderWidget extends StatelessWidget {
  const ChatHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

      child: Row(
        children: [

          const Icon(Icons.arrow_back),

          const SizedBox(width: 10),

           ProfileAvatarWidget(
            image: ("assets/images/carrot.png"),
             size: 32,
          ),

          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [

              Text("Rabit_Food", style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),

              Text("Food by us", style: AppTextStyles.bodySmall.copyWith(fontSize: 12)),

            ],
          ),

          const Spacer(),

      SvgPicture.asset(
        "assets/icons/verified.svg",
        height: 20,
      )
        ],
      ),
    );
  }
}