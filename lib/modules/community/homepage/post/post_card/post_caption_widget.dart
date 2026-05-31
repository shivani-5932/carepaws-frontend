import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class PostCaptionWidget extends StatelessWidget {
  final String caption;
  final String time;

  const PostCaptionWidget({
    super.key,
    required this.caption,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),

      child: Align(
        alignment: Alignment.centerLeft, // 🔥 FIX

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,

          children: [

            Text(
              caption,
              textAlign: TextAlign.left, // 🔥 FIX
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              time,
              textAlign: TextAlign.left, // 🔥 FIX
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

          ],
        ),
      ),
    );
  }
}