import 'package:care_paws/modules/auth/doctor_registration/widget/upload_card_widget.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/binding.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/view/prescription/prescription_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import your widgets
// import 'upload_document_card.dart';
// import 'primary_button.dart';

class UploadPrescriptionScreen extends StatefulWidget {
  const UploadPrescriptionScreen({super.key});

  @override
  State<UploadPrescriptionScreen> createState() =>
      _UploadPrescriptionScreenState();
}

class _UploadPrescriptionScreenState
    extends State<UploadPrescriptionScreen> {

  bool isUploaded = false;

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
          "Upload Prescriptions / Reports",
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

              /// 🔹 Upload Card
              UploadDocumentCard(
                label: "Upload",
                isUploaded: isUploaded,
                onTap: () async {
                  // 👉 Replace with file picker / image picker later

                  setState(() {
                    isUploaded = true;
                  });
                },
              ),

              const Spacer(),

              /// 🔹 Submit Button
              PrimaryButton(
                text: "Submit",
                onTap: isUploaded
                    ? () {
                  // Submit logic
                  Get.to(
                        () => const PrescriptionRecordScreen(),
                    binding: HealthBinding(),
                  );
                }
                    : null, // disables button if not uploaded
              ),
            ],
          ),
        ),
      ),
    );
  }
}