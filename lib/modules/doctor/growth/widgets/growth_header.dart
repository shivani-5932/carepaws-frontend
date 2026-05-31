import 'package:flutter/material.dart';

class GrowthHeader extends StatelessWidget {
  const GrowthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/doc.png"),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dr. Varun Gupta", style: TextStyle(fontWeight: FontWeight.w600)),
            Text("General vet", style: TextStyle(fontSize: 12)),
          ],
        )
      ],
    );
  }
}