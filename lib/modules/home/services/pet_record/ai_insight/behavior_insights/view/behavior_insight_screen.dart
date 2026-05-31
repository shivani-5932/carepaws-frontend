import 'package:flutter/material.dart';
import '../widgets/behavior_pie_chart.dart';
import '../widgets/activity_bar_chart.dart';
import '../widgets/insight_row_widget.dart';
import '../data/dummy_behavior_data.dart';
import 'package:care_paws/core/theme/app_textstyles.dart';

class BehaviorInsightScreen extends StatelessWidget {
  const BehaviorInsightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      appBar: AppBar(
        title: const Text("Behavior Insight"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔥 BEHAVIOR CONTAINER
            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.brown.shade200,
                ),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(
                    "Last 7 Days Behavior Insight",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h3.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// PIE CHART
                  BehaviorPieChart(
                    data: behaviorData,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ✅ INSIGHT
            const InsightRowWidget(
              text:
              "Your pet is mostly happy and emotionally stable",
            ),

            const SizedBox(height: 20),

            /// 🔥 ACTIVITY SECTION

            Center(
              child: Text(
                "Last 7 Days Activity",
                style: AppTextStyles.h3.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            ActivityBarChart(
              data: weeklyData,
            ),

            const SizedBox(height: 20),

            /// ✅ INSIGHT
            const InsightRowWidget(
              text:
              "Your pet is active as compared to last week",
            ),

            const SizedBox(height: 24),

            /// 🔥 SLEEP SECTION

            Center(
              child: Column(
                children: [

                  Text(
                    "Avg Sleep",
                    style: AppTextStyles.h3.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    "7 hrs/day (Normal)",
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ✅ INSIGHT
            const InsightRowWidget(
              text:
              "Sleep pattern is healthy",
            ),

          ],
        ),
      ),
    );
  }
}