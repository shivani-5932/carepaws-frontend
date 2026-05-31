import 'package:flutter/material.dart';

class SelectChip extends StatelessWidget {

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectChip({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),

        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xff6F4E37)
              : Colors.transparent,

          borderRadius: BorderRadius.circular(20),

          border: Border.all(color: Color(0xffD2B8A3)),
        ),

        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}