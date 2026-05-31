// import 'package:care_paws/modules/home/services/pet_record/health_record/vet_visit/vet_visit_card.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class VetVisitLogsScreen extends StatelessWidget {
//   const VetVisitLogsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     /// 🔹 Dummy Data (later API)
//     final pets = [
//       {
//         "petName": "Tuffy",
//         "visits": [
//           {"name": "Skin Allergy", "date": "01/03/2020"},
//           {"name": "Kennel Cough", "date": "30/05/2021"},
//         ]
//       },
//       {
//         "petName": "Meow",
//         "visits": [
//           {"name": "Skin Allergy", "date": "01/03/2020"},
//           {"name": "Kennel Cough", "date": "30/05/2021"},
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
//           "Vet Visit / Consultation Logs",
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
//                 child: const Icon(Icons.add, color: Colors.white),
//               ),
//
//               const SizedBox(height: 16),
//
//               /// 🔹 LIST (Dynamic)
//               Expanded(
//                 child: ListView.separated(
//                   itemCount: pets.length,
//                   separatorBuilder: (_, __) => const SizedBox(height: 16),
//                   itemBuilder: (context, index) {
//                     final pet = pets[index];
//
//                     return VetVisitCard(
//                       petName: pet["petName"] as String,
//                       visits: pet["visits"] as List<Map<String, String>>,
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