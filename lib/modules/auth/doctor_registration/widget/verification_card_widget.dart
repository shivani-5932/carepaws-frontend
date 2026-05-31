import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationCard extends StatelessWidget {

  final String title;
  final String iconPath; // svg
  final bool isCompleted;
  final VoidCallback onTap;

  const VerificationCard({
    super.key,
    required this.title,
    required this.iconPath,
    required this.isCompleted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    bool isSvg = iconPath.endsWith(".svg");

    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),

        decoration: BoxDecoration(
          color: isCompleted
              ? const Color(0xffE8C999) // 👈 done state
              : Colors.white,

          borderRadius: BorderRadius.circular(12),

          border: Border.all(
            color: const Color(0xffD2B8A3),
          ),
        ),

        child: Row(
          children: [

            /// ICON (SVG)
            isSvg ? SvgPicture.asset(
              iconPath,
              height: 24,
            ) : Image.asset(iconPath,
              height: 24,
            ),

            const SizedBox(width: 12),

            /// TITLE
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}