import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/home/appointment_booking/date_picker/view/custom_date_picker_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/view/vaccination/vaccination_list_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/widgets/date_picker_field_widget.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Assume these exist
// import 'primary_button.dart';
// import 'custom_date_picker.dart';

class AddVaccinationScreen extends StatefulWidget {
  const AddVaccinationScreen({super.key});

  @override
  State<AddVaccinationScreen> createState() =>
      _AddVaccinationScreenState();
}

class _AddVaccinationScreenState
    extends State<AddVaccinationScreen> {
  final TextEditingController nameController = TextEditingController();

  DateTime? vaccinationDate;
  DateTime? dueDate;

  bool reminderEnabled = false;

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
          "Vaccination Record",
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

              /// 🔹 FORM AREA
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Vaccination Name
                    AppInputField(
                      controller: nameController,
                      hint: "Vaccination Name",
                    ),

                    const SizedBox(height: 12),

                    /// Vaccination Date
                    DatePickerField(
                      hintText: "Vaccination Date",
                      selectedDate: vaccinationDate,
                      onDateSelected: (date) {
                        setState(() {
                          vaccinationDate = date;
                        });
                      },
                    ),

                    const SizedBox(height: 12),

                    /// Due Date
                    DatePickerField(
                      hintText: "Vaccination Due Date",
                      selectedDate: dueDate,
                      onDateSelected: (date) {
                        setState(() {
                          dueDate = date;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    /// 🔹 Reminder Toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "Reminder Notifications",
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Switch(
                          value: reminderEnabled,
                          onChanged: (value) {
                            setState(() {
                              reminderEnabled = value;
                            });
                          },
                          activeColor: const Color(0xFF6B4F3B),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// 🔹 BUTTON
              PrimaryButton(
                text: "Next",
                onTap: () {
                  // Handle next
                  print(nameController.text);
                  print(vaccinationDate);
                  print(dueDate);
                  print(reminderEnabled);

                  Get.to(() => const VaccinationRecordScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Reusable TextField (matches UI)
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}