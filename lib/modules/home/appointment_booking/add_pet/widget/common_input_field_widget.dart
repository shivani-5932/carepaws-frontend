import 'package:flutter/material.dart';

class CommonInputField extends StatelessWidget {
  final String hint;
  final bool isDropdown;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const CommonInputField({
    super.key,
    required this.hint,
    this.isDropdown = false,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDropdown ? onTap : null,
      child: AbsorbPointer(
        absorbing: isDropdown, // dropdown ke liye typing disable
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffD2B8A3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xff6F4E37)),
            ),
            suffixIcon: isDropdown
                ? const Icon(Icons.keyboard_arrow_down, color: Colors.grey)
                : null,
          ),
        ),
      ),
    );
  }
}