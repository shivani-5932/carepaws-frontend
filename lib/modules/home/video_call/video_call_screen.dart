// import 'package:care_paws/modules/home/video_call/widgets/self_view_widget.dart';
// import 'package:care_paws/modules/home/video_call/widgets/video_controls_widget.dart';
// import 'package:care_paws/modules/home/video_call/widgets/video_top_info_widget.dart';
// import 'package:flutter/material.dart';
//
// class VideoCallScreen extends StatelessWidget {
//   const VideoCallScreen({super.key});
//
// @override
// void initState() {
//   super.initState();
//
//   controller.init();
//
//   controller.startCallTimer(() {
//     endCall();
//   });
// }
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       body: Stack(
//         children: [
//
//           /// 🔥 FULL SCREEN VIDEO
//           SizedBox.expand(
//             child: Image.asset(
//               "assets/images/doc1.png",
//               fit: BoxFit.cover,
//             ),
//           ),
//
//           /// 🔥 TOP INFO
//           const SafeArea(
//             child: Padding(
//               padding: EdgeInsets.only(top: 10),
//               child: Center(
//                 child: VideoTopInfoWidget(
//                   name: "Dr. Sofia",
//                   time: "20:45",
//                 ),
//               ),
//             ),
//           ),
//
//           /// 🔥 SELF VIEW (BOTTOM RIGHT)
//           const Positioned(
//             bottom: 140,
//             right: 16,
//             child: SelfViewWidget(
//               image: "assets/images/user.png",
//             ),
//           ),
//
//           /// 🔥 CONTROLS
//           Positioned(
//             bottom: 40,
//             left: 0,
//             right: 0,
//             child: VideoControlsWidget(
//               onEnd: (){
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }

// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(
// content: Text("Call ended (35 min limit reached)"),
// ),
// );

// if(callDuration == 2040){
// // 34 min
// showWarning("Call will end in 1 minute");
// }

// @override
// void initState() {
//   super.initState();
//
//   controller.init();
//
//   controller.startCallTimer(
//     endCall,
//     showWarning,
//   );
// }
// void showWarning(){
//   ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar(
//       content: Text("Call will end in 1 minute"),
//     ),
//   );
// }
// void endCall() async {
//
//   await controller.dispose();
//
//   if(mounted){
//     Navigator.pop(context);
//   }
// }
// final String timer;
// required this.timer,
// Text(
// timer,
// style: const TextStyle(
// color: Colors.white70,
// fontSize: 13,
// ),
// ),
// VideoTopInfoWidget(
// name: "Dr. Sofia",
// time: "20:45",
// timer: controller.formattedTime, // 🔥 LIVE TIMER
// ),
// controller.startCallTimer(
// (){
// endCall();
// },
// (){
// showWarning();
// },
// );
//
// Timer.periodic(const Duration(seconds: 1), (_){
// if(mounted){
// setState(() {});
// }
// });
// Text(
// controller.formattedTime,
// style: const TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.w600,
// fontSize: 14,
// ),
// ),