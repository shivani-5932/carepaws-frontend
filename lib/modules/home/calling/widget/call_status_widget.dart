import 'package:flutter/material.dart';

class CallStatusWidget extends StatelessWidget {

  final String name;
  final String status;

  const CallStatusWidget({
    super.key,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          status,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}