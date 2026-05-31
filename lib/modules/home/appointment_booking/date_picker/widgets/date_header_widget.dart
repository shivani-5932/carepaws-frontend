import 'package:flutter/material.dart';

class DateHeaderWidget extends StatelessWidget {

  final String title;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  const DateHeaderWidget({
    super.key,
    required this.title,
    required this.onPrev,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),

        Row(
          children: [
            IconButton(icon: const Icon(Icons.chevron_left), onPressed: onPrev),
            IconButton(icon: const Icon(Icons.chevron_right), onPressed: onNext),
          ],
        )
      ],
    );
  }
}