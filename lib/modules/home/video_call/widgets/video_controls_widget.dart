import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VideoControlsWidget extends StatelessWidget {

  final VoidCallback onEnd;

  const VideoControlsWidget({super.key, required this.onEnd});

  Widget smallBtn(String icon){
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      child: SvgPicture.asset(icon, height: 20),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        smallBtn("assets/icons/camera.svg"),
        const SizedBox(width: 14),

        smallBtn("assets/icons/video.svg"),
        const SizedBox(width: 14),

        smallBtn("assets/icons/mic.svg"),
        const SizedBox(width: 14),

        /// END CALL
        GestureDetector(
          onTap: onEnd,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.call_end, color: Colors.white),
          ),
        ),
      ],
    );
  }
}