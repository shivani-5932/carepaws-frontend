import 'package:flutter/material.dart';

class TopProgressBar extends StatelessWidget {
  final int step;

  const TopProgressBar({super.key, required this.step});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: step / 3,
            color: Colors.orange,
            backgroundColor: Colors.grey.shade300,
          ),
        ),
        const SizedBox(width: 8),
        Text("$step/3"),
      ],
    );
  }
}