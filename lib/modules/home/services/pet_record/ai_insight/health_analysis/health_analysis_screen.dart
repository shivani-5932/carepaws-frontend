import 'package:care_paws/modules/home/services/pet_record/ai_insight/health_analysis/dummy_health_data.dart';
import 'package:care_paws/modules/home/services/pet_record/ai_insight/health_analysis/health_card.dart';
import 'package:flutter/material.dart';


class HealthAnalysisScreen extends StatelessWidget {
  const HealthAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("Health Analysis"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: HealthCard(data: healthData),
      ),
    );
  }
}