import 'package:care_paws/core/navigation/app_navigator.dart';
import 'package:care_paws/features/services/pet_record_type.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_record_tile_widget.dart';
import 'package:flutter/material.dart';

class PetRecordScreen extends StatelessWidget {
  const PetRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("Pet Record"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            PetRecordTile(
              title: "Health Record",
              onTap: () {
                AppNavigator.navigateToPetFeature(PetFeature.healthRecord);
              },
            ),

            PetRecordTile(
              title: "AI Insight",
              onTap: () {
                AppNavigator.navigateToPetFeature(PetFeature.aiInsight);
              },
            ),

            PetRecordTile(
              title: "Pet Diet Management",
              onTap: () {
                AppNavigator.navigateToPetFeature(PetFeature.dietManagement);
              },
            ),
          ],
        ),
      ),
    );
  }
}