// import 'package:care_paws/modules/home/services/pet_record/health_record/vaccination/widget/vaccination_tile.dart';
// import 'package:flutter/material.dart';
//
// class VaccinationRecordCard extends StatelessWidget {
//   final String petName;
//   final List<Map<String, String>> records;
//
//   const VaccinationRecordCard({
//     super.key,
//     required this.petName,
//     required this.records,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           /// 🔹 TITLE
//           Text(
//             "$petName's Vaccination Records",
//             style: const TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 13,
//             ),
//           ),
//
//           const SizedBox(height: 10),
//
//           /// 🔹 RECORD LIST
//           Column(
//             children: records.map((record) {
//               return VaccinationTile(
//                 name: record["name"]!,
//                 date: record["date"]!,
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }