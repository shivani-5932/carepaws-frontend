import 'package:flutter/material.dart';

class FilterOptionChipWidget extends StatelessWidget {

  final String text;
  final bool selected;
  final VoidCallback onTap;

  const FilterOptionChipWidget({
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        decoration: BoxDecoration(
          color: selected
              ? const Color(0xff6F4E37)
              : const Color(0xffF5F2EE),
          borderRadius: BorderRadius.circular(20),
        ),

        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}