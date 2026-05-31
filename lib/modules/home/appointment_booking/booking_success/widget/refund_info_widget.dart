import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class RefundInfoWidget extends StatelessWidget {
  const RefundInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: const Color(0xFFFECF82),
        borderRadius: BorderRadius.circular(10),
      ),

      child: RichText(
        text: TextSpan(
          children: [

            TextSpan(
              text: "100% refund ",
              style: AppTextStyles.bodySmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            TextSpan(
              text: "if vet does not connect within 10 mins of appointment time for ",
              style: AppTextStyles.bodySmall.copyWith(
                color: Colors.black,
              ),
            ),

            TextSpan(
              text: "Online Consult",
              style: AppTextStyles.bodySmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      )
    );
  }
}