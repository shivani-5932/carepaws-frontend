import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;

  final int maxLines;
  final bool readOnly;

  final Widget? suffixIcon;
  final VoidCallback? onTap;

  const AppInputField({
    super.key,
    this.controller,
    required this.hint,
    this.maxLines = 1,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 2,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),

        child: TextField(
          controller: controller,
          maxLines: maxLines,
          readOnly: readOnly,

          /// ✅ Typed Text Color (BLACK)
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),

          decoration: InputDecoration(
            hintText: hint,

            /// ✅ Hint Text Color (GREY)
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14,
            ),

            border: InputBorder.none,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}