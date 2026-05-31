import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {

  final String hint;
  final String value;
  final VoidCallback onTap;

  const CustomDropdownField({
    super.key,
    required this.hint,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),

        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffD2B8A3)),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value.isEmpty ? hint : value),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}