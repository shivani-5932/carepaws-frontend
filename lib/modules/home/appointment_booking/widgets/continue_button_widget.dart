import 'package:flutter/material.dart';

class ContinueButtonWidget extends StatelessWidget {

  final VoidCallback onTap;

  const ContinueButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),

        decoration: BoxDecoration(
          color: const Color(0xff6F4E37),
          borderRadius: BorderRadius.circular(10),
        ),

        child: const Center(
          child: Text(
            "Continue",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}