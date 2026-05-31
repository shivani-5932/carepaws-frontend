import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'health_analysis_model.dart';

class HealthCard extends StatelessWidget {
  final HealthModel data;

  const HealthCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 234,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown.shade200),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          /// 🔹 PET NAME + INFO
          Text(
            data.name,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 6),

          /// 🔹 HEALTH SCORE
          Column(
            children: [

              /// Label
              Text(
                "Health score : 82/100",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 4),

              /// Insight
              Text(
                data.insights[0],
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.orange
                ),
              ),
            ],
          ),

          /// 🔹 WEIGHT TREND
          _buildRow(
            title: "Weight Trend",
            insight: data.insights[1],
          ),

          /// 🔹 DIET STATUS
          _buildRow(
            title: "Diet Status",
            insight: data.insights[2],
          ),

          /// 🔹 ACTIVITY LEVEL
          Column(
            children: [

              /// Label
              Text(
                "Activity Level : 30 mins/day",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 4),

              /// Insight
              Text(
                data.insights[3],
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall.copyWith(
                color: Colors.orange
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🔹 Reusable Row Builder
  Widget _buildRow({
    required String title,
    required String insight,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [

          /// Label
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 4),

          /// Insight
          Text(
            insight,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}