// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
//
// class VideoViewWidget extends StatelessWidget {
//
//   final CallController controller;
//
//   const VideoViewWidget({super.key, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//
//     if(controller.remoteUid != null){
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: controller.engine,
//           canvas: VideoCanvas(uid: controller.remoteUid),
//           connection: const RtcConnection(channelId: channelName),
//         ),
//       );
//     } else {
//       return const Center(
//         child: Text("Connecting...", style: TextStyle(color: Colors.white)),
//       );
//     }
//   }
// }