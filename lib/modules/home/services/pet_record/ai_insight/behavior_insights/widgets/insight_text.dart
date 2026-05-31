import 'package:flutter/material.dart';

class InsightText extends StatelessWidget {
  final String text;

  const InsightText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Insight :  "$text"',
      style: const TextStyle(fontSize: 12),
    );
  }
}