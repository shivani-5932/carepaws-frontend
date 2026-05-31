import 'package:care_paws/core/navigation/app_navigator.dart';
import 'package:care_paws/features/services/pet_record_type.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_record_tile_widget.dart';
import 'package:flutter/material.dart';

class PetDietManagementScreen extends StatelessWidget {
  const PetDietManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("Pet Diet Managment"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// DIET PLAN
            PetRecordTile(
              title: "Diet Plan",
              onTap: () {
                AppNavigator.navigateToPetFeature(PetFeature.dietPlan);
              },
            ),

            /// WATER INTAKE
            PetRecordTile(
              title: "Water Intake",
              onTap: () {
                AppNavigator.navigateToPetFeature(PetFeature.waterIntake);
              },
            ),

            /// DAILY ACTIVITY
            PetRecordTile(
              title: "Daily Activity",
              onTap: () {
                AppNavigator.navigateToPetFeature(PetFeature.dailyActivities);
              },
            ),
          ],
        ),
      ),
    );
  }
}