import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TypingBarWidget extends StatelessWidget {

  const TypingBarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),

      child: Row(
        children: [

          /// Emoji
          IconButton(
            icon: const Icon(Icons.emoji_emotions_outlined),
            onPressed: () {},
          ),

          /// Message input
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Message...",
                border: InputBorder.none,
              ),
            ),
          ),

          /// Image / clip share
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: () {},
          ),

          /// Voice
          IconButton(
            icon: const Icon(Icons.mic),
            onPressed: () {},
          ),

          /// Send button (burst svg)
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/send.svg",
              height: 28,
            ),
            onPressed: () {},
          ),

        ],
      ),
    );
  }
}