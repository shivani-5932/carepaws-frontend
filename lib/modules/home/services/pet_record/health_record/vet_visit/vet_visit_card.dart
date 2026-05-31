// import 'package:care_paws/modules/home/services/pet_record/health_record/vet_visit/vet_visit_tile.dart';
// import 'package:flutter/material.dart';
//
// class VetVisitCard extends StatelessWidget {
//   final String petName;
//   final List<Map<String, String>> visits;
//
//   const VetVisitCard({
//     super.key,
//     required this.petName,
//     required this.visits,
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
//           /// TITLE
//           Text(
//             "$petName's",
//             style: const TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 13,
//             ),
//           ),
//
//           const SizedBox(height: 10),
//
//           /// VISITS
//           Column(
//             children: visits.map((visit) {
//               return VetVisitTile(
//                 name: visit["name"]!,
//                 date: visit["date"]!,
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }