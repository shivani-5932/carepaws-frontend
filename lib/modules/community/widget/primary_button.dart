import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final String text;
  final VoidCallback? onTap;
  final double height;
  final double borderRadius;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 52,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {

    final isEnabled = onTap != null;

    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,
        height: height,

        decoration: BoxDecoration(
          color: isEnabled
              ? const Color(0xff6F4E37)
              : const Color(0xffC7BDB5),

          borderRadius: BorderRadius.circular(borderRadius),
        ),

        child: Center(
          child: Text(
            text,
            style: AppTextStyles.button.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}