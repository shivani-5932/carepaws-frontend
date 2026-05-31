import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'risk_alert_model.dart';

class RiskCard extends StatelessWidget {
  final RiskModel data;

  const RiskCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Container(
        height: 80,
        width: double.infinity,

        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),

        decoration: BoxDecoration(
          color: data.bgColor,

          borderRadius: BorderRadius.circular(14),

          border: Border.all(
            color: Colors.brown,
            width: 1,
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              data.title,

              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 6),

            if (data.description.isNotEmpty)
              Text(
                data.description,

                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.black87,
                ),
              ),

          ],
        ),
      ),
    );
  }
}