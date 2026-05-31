// import 'package:flutter/material.dart';
//
// class PrescriptionTile extends StatelessWidget {
//   final String name;
//   final String date;
//
//   const PrescriptionTile({
//     super.key,
//     required this.name,
//     required this.date,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//
//           /// LEFT
//           Row(
//             children: [
//               const Icon(Icons.description,
//                   size: 16, color: Colors.black54),
//               const SizedBox(width: 8),
//
//               Text(
//                 name,
//                 style: const TextStyle(fontSize: 12),
//               ),
//             ],
//           ),
//
//           /// RIGHT
//           Text(
//             date,
//             style: const TextStyle(
//               fontSize: 11,
//               color: Colors.black54,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }