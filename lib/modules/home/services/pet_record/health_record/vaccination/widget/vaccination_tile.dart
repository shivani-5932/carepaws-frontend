// import 'package:flutter/material.dart';
//
// class VaccinationTile extends StatelessWidget {
//   final String name;
//   final String date;
//
//   const VaccinationTile({
//     super.key,
//     required this.name,
//     required this.date,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//
//           /// Left Side
//           Row(
//             children: [
//               const Icon(Icons.pets, size: 16, color: Colors.black54),
//               const SizedBox(width: 8),
//
//               Text(
//                 name,
//                 style: const TextStyle(fontSize: 12),
//               ),
//             ],
//           ),
//
//           /// Right Date
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