import 'package:flutter/material.dart';

// class TimePickerField extends StatelessWidget {
//
//   final String label;
//   final String value;
//   final VoidCallback onTap;
//
//   const TimePickerField({
//     super.key,
//     required this.label,
//     required this.value,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//
//         Text(label),
//
//         const SizedBox(height: 6),
//
//         GestureDetector(
//           onTap: onTap,
//
//           child: Container(
//             padding: const EdgeInsets.all(12),
//
//             decoration: BoxDecoration(
//               border: Border.all(color: Color(0xffD2B8A3)),
//               borderRadius: BorderRadius.circular(10),
//             ),
//
//             child: Text(value),
//           ),
//         ),
//       ],
//     );
//   }
// }






class TimeBox extends StatelessWidget {

  final String value;
  final VoidCallback onTap;

  const TimeBox({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffD2B8A3)),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Text(value),
      ),
    );
  }
}