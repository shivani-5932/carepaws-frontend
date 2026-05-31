// import 'package:care_paws/modules/community/widget/primary_button.dart';
// import 'package:care_paws/modules/home/services/pet_record/pet_record_tile_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// // import 'pet_record_tile.dart';
// // import 'primary_button.dart';
//
// class MedicalPrescriptionScreen extends StatelessWidget {
//   const MedicalPrescriptionScreen({super.key});
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
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               /// 🔹 Optional Text
//               const Padding(
//                 padding: EdgeInsets.only(bottom: 10),
//                 child: Text(
//                   "(Optional)",
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ),
//
//               /// 🔹 Pet Record Tile
//               PetRecordTile(
//                 title: "Prescriptions / Reports",
//                 onTap: () {
//                   // Navigate to upload screen / file picker
//                 },
//               ),
//
//               const Spacer(),
//
//               /// 🔹 Submit Button
//               PrimaryButton(
//                 text: "Submit",
//                 onTap: () {
//                   // Handle submit
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }