import 'package:flutter/material.dart';

class MessageTopbarWidget extends StatelessWidget {
  const MessageTopbarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        const Icon(Icons.arrow_back),

        const SizedBox(width: 10),

        const Text(
          "Tuffy.709",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        const Icon(Icons.keyboard_arrow_down),

        const Spacer(),

        const Icon(Icons.more_horiz)

      ],
    );
  }
}