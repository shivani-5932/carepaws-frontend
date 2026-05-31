import 'package:flutter/material.dart';

class FilterChipWidget extends StatelessWidget {

  final String text;
  final bool selected;
  final VoidCallback onTap;

  const FilterChipWidget({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),

        decoration: BoxDecoration(
          color: selected ? const Color(0xff6F4E37) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.brown),
        ),

        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}