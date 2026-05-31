import 'package:flutter/material.dart';
import 'package:care_paws/core/theme/app_textstyles.dart';

class InsightRowWidget extends StatelessWidget {
  final String text;

  const InsightRowWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// INSIGHT TITLE
        Text(
          "Insight:",
          style: AppTextStyles.h3.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        const SizedBox(width: 12),

        /// INSIGHT TEXT (Auto Wrap)
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.black87,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}