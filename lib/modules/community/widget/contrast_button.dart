import 'package:flutter/material.dart';

class ContrastButton extends StatelessWidget {

  final String text;
  final VoidCallback? onTap;
  final double height;

  const ContrastButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 45,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,
        height: height,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),

          border: Border.all(
            color: const Color(0xffD2B8A3),
          ),
        ),

        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xff6F4E37),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}