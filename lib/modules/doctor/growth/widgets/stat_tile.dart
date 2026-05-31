import 'package:flutter/material.dart';

class StatTile extends StatelessWidget {

  final String title;
  final String value;

  const StatTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value, style: const TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }
}