// import 'package:flutter/material.dart';
//
// class MedicalInputField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hint;
//   final int maxLines;
//
//   const MedicalInputField({
//     super.key,
//     required this.controller,
//     required this.hint,
//     this.maxLines = 1,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//
//       child: TextField(
//         controller: controller,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           hintText: hint,
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }