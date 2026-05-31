import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoryTopBarWidget extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onText;
  final VoidCallback onMusic;
  final VoidCallback onDraw;

  const StoryTopBarWidget({
    super.key,
    required this.onBack,
    required this.onText,
    required this.onMusic,
    required this.onDraw,
  });

  @override
  Widget build(BuildContext context) {

    bool hasMusic = true;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

      child: Row(
        children: [

          /// 🔙 BACK
          GestureDetector(
            onTap: onBack,
            child: buildBox(
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),

          const SizedBox(width: 10),

          /// 🎵 MUSIC TEXT
          if (hasMusic)
            const Expanded(
              child: Text(
                "🎵 LALALA - SHAKIRA",
                style: TextStyle(color: Colors.white, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            )
          else
            const Spacer(),

          /// RIGHT ICONS
          Row(
            children: [

              GestureDetector(
                onTap: onText,
                child: buildIcon("assets/icons/text.svg"),
              ),

              const SizedBox(width: 10),

              GestureDetector(
                onTap: onMusic,
                child: buildIcon("assets/icons/music.svg"),
              ),

              const SizedBox(width: 10),

              GestureDetector(
                onTap: onDraw,
                child: buildIcon("assets/icons/draw.svg"),
              ),

            ],
          )

        ],
      ),
    );
  }

  Widget buildIcon(String icon){
    return buildBox(
      child: SvgPicture.asset(
        icon,
        height: 18,
        color: Colors.white,
      ),
    );
  }

  Widget buildBox({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: const Color(0x803B2F2F),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}