import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/medical_history/medical_input_field_widget.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/view/medical_history/medical_history_scree.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'primary_button.dart';

class MedicalHistoryNotesScreen extends StatefulWidget {
  const MedicalHistoryNotesScreen({super.key});

  @override
  State<MedicalHistoryNotesScreen> createState() =>
      _MedicalHistoryNotesScreenState();
}

class _MedicalHistoryNotesScreenState extends State<MedicalHistoryNotesScreen> {

  final pastIllnessController = TextEditingController();
  final treatmentsController = TextEditingController();
  final surgeriesController = TextEditingController();
  final allergiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      appBar: AppBar(
        backgroundColor: Color(0xFFFDFCFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Medical History",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              /// 🔹 FORM
              Expanded(
                child: Column(
                  children: [

                    AppInputField(
                      controller: pastIllnessController,
                      hint: "Past Illness",
                    ),

                    const SizedBox(height: 12),

                    AppInputField(
                      controller: treatmentsController,
                      hint: "Treatments",
                    ),

                    const SizedBox(height: 12),

                    AppInputField(
                      controller: surgeriesController,
                      hint: "Surgeries",
                    ),

                    const SizedBox(height: 12),

                    AppInputField(
                      controller: allergiesController,
                      hint: "Allergies",
                    ),
                  ],
                ),
              ),

              /// 🔹 BUTTON
              PrimaryButton(
                text: "Next",
                onTap: () {
                  final data = {
                    "pastIllness": pastIllnessController.text,
                    "treatments": treatmentsController.text,
                    "surgeries": surgeriesController.text,
                    "allergies": allergiesController.text,
                  };

                  print(data);

                  Get.to(() => const MedicalHistoryScreen());

                  // आगे API / AI
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}