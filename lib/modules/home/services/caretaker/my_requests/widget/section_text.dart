import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class SectionText extends StatelessWidget {
  final String title;
  final String value;

  const SectionText({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.bodySmall.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          children: [
            TextSpan(
              text: "$title :  ",
              style: AppTextStyles.bodySmall.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}