import 'package:flutter/material.dart';

class FilterChipWidget extends StatelessWidget {
  final String text;

  const FilterChipWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 36,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFB08968)),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}