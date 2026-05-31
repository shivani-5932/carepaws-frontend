// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class CallController {
//
//   late RtcEngine engine;
//
//   bool isMuted = false;
//   bool isVideoOff = false;
//   int? remoteUid;
//
//   Future<void> init() async {
//
//     await [Permission.microphone, Permission.camera].request();
//
//     engine = createAgoraRtcEngine();
//     await engine.initialize(RtcEngineContext(appId: appId));
//
//     engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onUserJoined: (connection, uid, elapsed) {
//           remoteUid = uid;
//         },
//         onUserOffline: (connection, uid, reason) {
//           remoteUid = null;
//         },
//       ),
//     );
//
//     await engine.enableVideo();
//
//     await engine.joinChannel(
//       token: token,
//       channelId: channelName,
//       uid: 0,
//       options: const ChannelMediaOptions(),
//     );
//   }
//
//   void toggleMute() {
//     isMuted = !isMuted;
//     engine.muteLocalAudioStream(isMuted);
//   }
//
//   void toggleVideo() {
//     isVideoOff = !isVideoOff;
//     engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   Future<void> dispose() async {
//     await engine.leaveChannel();
//     await engine.release();
//   }
// }
// await engine.enableVirtualBackground(
// enabled: true,
// backgroundSource: VirtualBackgroundSource(
// backgroundSourceType: BackgroundSourceType.backgroundBlur,
// blurDegree: BackgroundBlurDegree.blurDegreeMedium,
// ),
// );
// IconButton(
// icon: Icon(
// controller.isMuted ? Icons.mic_off : Icons.mic,
// ),
// onPressed: (){
// controller.toggleMute();
// setState(() {});
// },
// ),
//
// IconButton(
// icon: Icon(
// controller.isVideoOff ? Icons.videocam_off : Icons.videocam,
// ),
// onPressed: (){
// controller.toggleVideo();
// setState(() {});
// },
// ),
// const appId = "YOUR_AGORA_APP_ID";
// const token = "YOUR_TEMP_TOKEN";
// const channelName = "testChannel";

// import 'dart:async';
//
// Timer? callTimer;
// int callDuration = 0; // seconds
//
// void startCallTimer(Function onEnd) {
//
//   callTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//
//     callDuration++;
//
//     /// 🔥 35 MIN = 2100 sec
//     if(callDuration >= 2100){
//
//       timer.cancel();
//       onEnd(); // auto end call
//     }
//   });
// }

// void stopTimer(){
//   callTimer?.cancel();
// }
// Future<void> dispose() async {
//
//   stopTimer(); // 🔥 IMPORTANT
//
//   await engine.leaveChannel();
//   await engine.release();
// }
// void endCall() async {
//
//   await controller.dispose();
//
//   if(mounted){
//     Navigator.pop(context);
//   }
// }

// String get formattedTime {
//   final minutes = (callDuration ~/ 60).toString().padLeft(2, '0');
//   final seconds = (callDuration % 60).toString().padLeft(2, '0');
//   return "$minutes:$seconds";
// }
// void startCallTimer(Function onEnd, Function onWarning) {
//
//   callTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//
//     callDuration++;
//
//     /// 🔔 34 min warning
//     if(callDuration == 2040){
//       onWarning();
//     }
//
//     /// ⛔ 35 min auto end
//     if(callDuration >= 2100){
//       timer.cancel();
//       onEnd();
//     }
//   });
// }