import 'package:care_paws/core/navigation/app_navigator.dart';
import 'package:care_paws/features/services/pet_record_type.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_record_tile_widget.dart';
import 'package:flutter/material.dart';

class AiInsightScreen extends StatelessWidget {
  const AiInsightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("AI Insight"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            PetRecordTile(
              title: "Health Analysis",
              onTap: () {
                AppNavigator.navigateToPetFeature(PetFeature.healthAnalysis);
              },
            ),

            PetRecordTile(
              title: "Risk Alert",
              onTap: () {
                AppNavigator.navigateToPetFeature(PetFeature.riskAlert);
              },
            ),

            PetRecordTile(
              title: "Behavior Insights",
              onTap: () {
                AppNavigator.navigateToPetFeature(PetFeature.behaviorInsight);
              },
            ),

            PetRecordTile(
              title: "Symptoms Checker",
              onTap: () {
                AppNavigator.navigateToPetFeature(PetFeature.symptomChecker);
              },
            ),
          ],
        ),
      ),
    );
  }
}