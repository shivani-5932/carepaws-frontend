// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter/material.dart';
//
// class SelfViewWidget extends StatelessWidget {
//
//   final String image;
//
//   const SelfViewWidget({super.key, required this.image});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       height: 120,
//       width: 90,
//
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white,
//       ),
//
//       child: AgoraVideoView(
//         controller: VideoViewController(
//           rtcEngine: controller.engine,
//           canvas: const VideoCanvas(uid: 0),
//         ),
//        )
//         // ClipRRect(
//       //   borderRadius: BorderRadius.circular(16),
//       //   child: Image.asset(
//       //     image,
//       //     fit: BoxFit.cover,
//       //   ),
//       // ),
//     );
//   }
// }