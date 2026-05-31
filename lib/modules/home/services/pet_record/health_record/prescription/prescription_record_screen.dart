// import 'package:care_paws/modules/home/services/pet_record/health_record/prescription/prescription_card.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// // import your button if needed
//
// class PrescriptionRecordScreen extends StatelessWidget {
//   const PrescriptionRecordScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     /// 🔹 Dummy Data
//     final pets = [
//       {
//         "petName": "Tuffy",
//         "records": [
//           {"name": "Blood test report", "date": "01/03/2020"},
//           {"name": "X ray", "date": "30/05/2021"},
//         ]
//       },
//       {
//         "petName": "Meow",
//         "records": [
//           {"name": "Blood test report", "date": "01/03/2020"},
//           {"name": "X ray", "date": "30/05/2021"},
//         ]
//       }
//     ];
//
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
//           "Prescription / Reports",
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
//               /// ➕ Add Button
//               Container(
//                 height: 36,
//                 width: 36,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF6B4F3B),
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 child: const Icon(Icons.add, color: Colors.white, size: 20),
//               ),
//
//               const SizedBox(height: 16),
//
//               /// 🔹 LIST
//               Expanded(
//                 child: ListView.separated(
//                   itemCount: pets.length,
//                   separatorBuilder: (_, __) => const SizedBox(height: 16),
//                   itemBuilder: (context, index) {
//                     final pet = pets[index];
//
//                     return PrescriptionRecordCard(
//                       petName: pet["petName"] as String,
//                       records: pet["records"] as List<Map<String, String>>,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }