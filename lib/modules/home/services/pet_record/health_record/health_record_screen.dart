import 'package:care_paws/core/navigation/app_navigator.dart';
import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/features/services/pet_record_type.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_record_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Assume these already exist
// import 'pet_record_tile.dart';
// import 'primary_button.dart';

class HealthRecordScreen extends StatelessWidget {
  const HealthRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFDFCFA),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title:  Text(
          "Health Record",
          style: AppTextStyles.h2.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [

              /// 🔹 Tiles Section
              Expanded(
                child: Column(
                  children: [

                    PetRecordTile(
                      title: "Vaccination Record",
                      onTap: () {
                        // Navigate later
                        AppNavigator.navigateToPetFeature(PetFeature.vaccination);
                      },
                    ),

                    const SizedBox(height: 12),

                    PetRecordTile(
                      title: "Medical History",
                      onTap: () {
                        AppNavigator.navigateToPetFeature(PetFeature.medicalHistory);
                      },
                    ),

                    const SizedBox(height: 12),

                    PetRecordTile(
                      title: "Vet Visit / Consultation Logs",
                      onTap: () {
                        AppNavigator.navigateToPetFeature(PetFeature.vetVisit);
                      },
                    ),
                  ],
                ),
              ),

              /// 🔹 Bottom Button
              PrimaryButton(
                text: "Add New Pet",
                onTap: () {
                  // Add logic
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}