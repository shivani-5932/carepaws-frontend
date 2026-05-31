import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/medical_history/medical_input_field_widget.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/view/vet_visit/vet_visit_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/widgets/date_picker_field_widget.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import reusable widgets
// import 'medical_input_field.dart';
// import 'date_picker_field.dart';
// import 'primary_button.dart';

class AddVetVisitScreen extends StatefulWidget {
  const AddVetVisitScreen({super.key});

  @override
  State<AddVetVisitScreen> createState() => _AddVetVisitScreenState();
}

class _AddVetVisitScreenState extends State<AddVetVisitScreen> {

  final vetNameController = TextEditingController();
  final diagnosesController = TextEditingController();
  final notesController = TextEditingController();

  DateTime? visitDate;

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
          "Vet Visit",
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      /// Vet Name
                      AppInputField(
                        controller: vetNameController,
                        hint: "Vet Name",
                      ),

                      const SizedBox(height: 12),

                      /// Date
                      DatePickerField(
                        hintText: "Date",
                        selectedDate: visitDate,
                        onDateSelected: (date) {
                          setState(() {
                            visitDate = date;
                          });
                        },
                      ),

                      const SizedBox(height: 12),

                      /// Diagnoses
                      AppInputField(
                        controller: diagnosesController,
                        hint: "Diagnoses",
                      ),

                      const SizedBox(height: 12),

                      /// Notes (MULTILINE)
                      AppInputField(
                        controller: notesController,
                        hint: "Notes",
                        maxLines: 5, // 👈 small upgrade
                      ),
                    ],
                  ),
                ),
              ),

              /// 🔹 BUTTON
              PrimaryButton(
                text: "Finish",
                onTap: () {
                  final data = {
                    "vetName": vetNameController.text,
                    "date": visitDate,
                    "diagnoses": diagnosesController.text,
                    "notes": notesController.text,
                  };

                  print(data);

                  Get.to(() => const VetVisitLogsScreen());
                  // API / AI next
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}