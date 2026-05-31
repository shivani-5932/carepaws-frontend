import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../model/behavior_model.dart';
import 'package:care_paws/core/theme/app_textstyles.dart';

class BehaviorPieChart extends StatelessWidget {
  final List<BehaviorData> data;

  const BehaviorPieChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// 🔹 TITLE (H2 Bold)
        // Text(
        //   "7 Day Behavior Insight",
        //   style: AppTextStyles.h2.copyWith(
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),

        // const SizedBox(height: 16),

        /// 🔹 FULL FILLED PIE CHART
        SizedBox(
          height: 208,
          child: PieChart(
            PieChartData(

              /// 🔥 IMPORTANT — makes pie FULL (no hole)
              centerSpaceRadius: 0,

              sectionsSpace: 2,

              sections: data.map((e) {
                return PieChartSectionData(
                  value: e.value,
                  color: e.color,
                  radius: 70,
                  showTitle: false,
                );
              }).toList(),
            ),
          ),
        ),

        const SizedBox(height: 15),

        /// 🔹 LEGEND
        ...data.map(
              (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),

            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                /// LEFT SIDE
                Row(
                  children: [

                    CircleAvatar(
                      radius: 5,
                      backgroundColor: e.color,
                    ),

                    const SizedBox(width: 8),

                    /// bodySmall text
                    Text(
                      e.label,
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),

                /// RIGHT SIDE (%)
                Text(
                  "${e.value.toInt()}%",
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}