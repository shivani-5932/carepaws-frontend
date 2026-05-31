import 'package:care_paws/modules/home/services/pet_record/pet_diet_management/daily_activity/dummy_data/dummy_activies.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_diet_management/daily_activity/widget/activity_chart_widget.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_diet_management/daily_activity/widget/activity_summary_card.dart';
import 'package:flutter/material.dart';

class DailyActivityScreen extends StatelessWidget {
  const DailyActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("Daily Activity"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
        
              ActivitySummaryCard(),
        
              SizedBox(height: 20),
        
              /// GRAPH CARD
              ActivityChartContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityChartContainer extends StatelessWidget {
  const ActivityChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Text("Daily Activity Tracking"),
          const SizedBox(height: 20),
          ActivityChart(data: activityData),
        ],
      ),
    );
  }
}