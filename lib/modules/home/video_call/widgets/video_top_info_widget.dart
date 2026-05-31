import 'package:flutter/material.dart';

class VideoTopInfoWidget extends StatelessWidget {

  final String name;
  final String time;

  const VideoTopInfoWidget({
    super.key,
    required this.name,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 4),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: 6,
              width: 6,
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(width: 6),

            Text(
              time,
              style: const TextStyle(color: Colors.white70),
            ),

          ],
        )
      ],
    );
  }
}