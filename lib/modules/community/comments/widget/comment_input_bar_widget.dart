import 'package:flutter/material.dart';
import '../../widget/profile_avtar_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CommentInputBarWidget extends StatelessWidget {

  final TextEditingController controller;
  final VoidCallback onSend;

  const CommentInputBarWidget({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),

      child: Row(
        children: [

          const ProfileAvatarWidget(
            image: "assets/images/dog1.png",
            size: 44,
          ),

          const SizedBox(width: 8),

          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Write a Message...",
                border: InputBorder.none,
              ),
            ),
          ),

          GestureDetector(

            onTap: onSend,

            child: Container(
              height: 40,
              width: 60,
              padding: const EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: const Color(0xff6F4E37),
                borderRadius: BorderRadius.circular(8),
              ),

              child: SvgPicture.asset(
                "assets/icons/send.svg",
                height: 32,
                color: Colors.white,
              ),
            ),
          )

        ],
      ),
    );
  }
}