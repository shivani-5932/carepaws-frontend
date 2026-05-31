import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallControlsWidget extends StatelessWidget {

  final VoidCallback onEnd;

  const CallControlsWidget({super.key, required this.onEnd});

  Widget smallButton(String icon){
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.brown.shade200),
      ),
      child: SvgPicture.asset(icon, height: 20),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        smallButton("assets/icons/speaker.svg"),

        /// END CALL
        GestureDetector(
          onTap: onEnd,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.call_end, color: Colors.white),
          ),
        ),

        smallButton("assets/icons/mic.svg"),
      ],
    );
  }
}