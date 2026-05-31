import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {

  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const SearchBarWidget({
    super.key,
    this.hintText = "Search",
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 48, // slightly increased for Figma match
      padding: const EdgeInsets.symmetric(horizontal: 14),

      decoration: BoxDecoration(
        // color: const Color(0xffF7F2EE), // beige fill
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xffD6C6BA), // soft brown border
          width: 1.2,
        ),
      ),

      child: Row(
        children: [

          /// 🔍 Icon (styled)
          const Icon(
            Icons.search,
            color: Color(0xffBCA99A),
            size: 22,
          ),

          const SizedBox(width: 10),

          /// 🔤 TextField
          Expanded(
            child: TextField(

              controller: controller,
              onChanged: onChanged,

              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff4A3426),
              ),

              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xffBCA99A),
                  fontSize: 14,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class SearchBarWidget extends StatelessWidget {
//
//   final String hintText;
//   final TextEditingController? controller;
//   final Function(String)? onChanged;
//
//   const SearchBarWidget({
//     super.key,
//     this.hintText = "Search",
//     this.controller,
//     this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       height: 45,
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.brown.shade200),
//       ),
//
//       child: Row(
//         children: [
//
//           const Icon(Icons.search, color: Colors.grey),
//
//           const SizedBox(width: 8),
//
//           Expanded(
//             child: TextField(
//
//               controller: controller,
//               onChanged: onChanged,
//
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }