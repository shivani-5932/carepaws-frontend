import 'package:flutter/material.dart';

class SlotInfoWidget extends StatelessWidget {

  final String dateTime;
  final String mode;

  const SlotInfoWidget({
    super.key,
    required this.dateTime,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text("Slot"),

        const SizedBox(height: 8),

        Row(
          children: [

            const Icon(Icons.calendar_today, size: 16),

            const SizedBox(width: 8),

            Expanded(
              child: Text(
                "$dateTime | $mode",
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 14),
          ],
        ),
      ],
    );
  }
}