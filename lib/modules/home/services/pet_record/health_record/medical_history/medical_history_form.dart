// import 'package:care_paws/modules/community/widget/primary_button.dart';
// import 'package:care_paws/modules/home/services/pet_record/health_record/medical_history/medical_input_field_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// // import 'primary_button.dart';
//
// class MedicalHistoryScreen extends StatefulWidget {
//   const MedicalHistoryScreen({super.key});
//
//   @override
//   State<MedicalHistoryScreen> createState() =>
//       _MedicalHistoryScreenState();
// }
//
// class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
//
//   final pastIllnessController = TextEditingController();
//   final treatmentsController = TextEditingController();
//   final surgeriesController = TextEditingController();
//   final allergiesController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Get.back(),
//         ),
//         title: const Text(
//           "Medical History",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//
//           child: Column(
//             children: [
//
//               /// 🔹 FORM
//               Expanded(
//                 child: Column(
//                   children: [
//
//                     MedicalInputField(
//                       controller: pastIllnessController,
//                       hint: "Past Illness",
//                     ),
//
//                     const SizedBox(height: 12),
//
//                     MedicalInputField(
//                       controller: treatmentsController,
//                       hint: "Treatments",
//                     ),
//
//                     const SizedBox(height: 12),
//
//                     MedicalInputField(
//                       controller: surgeriesController,
//                       hint: "Surgeries",
//                     ),
//
//                     const SizedBox(height: 12),
//
//                     MedicalInputField(
//                       controller: allergiesController,
//                       hint: "Allergies",
//                     ),
//                   ],
//                 ),
//               ),
//
//               /// 🔹 BUTTON
//               PrimaryButton(
//                 text: "Next",
//                 onTap: () {
//                   final data = {
//                     "pastIllness": pastIllnessController.text,
//                     "treatments": treatmentsController.text,
//                     "surgeries": surgeriesController.text,
//                     "allergies": allergiesController.text,
//                   };
//
//                   print(data);
//
//                   // आगे API / AI
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }