import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ClipVideoWidget extends StatefulWidget {

  final String videoUrl;

  const ClipVideoWidget({super.key, required this.videoUrl});

  @override
  State<ClipVideoWidget> createState() => _ClipVideoWidgetState();
}

class _ClipVideoWidgetState extends State<ClipVideoWidget> {

  late VideoPlayerController controller;

  @override
  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    )
      ..initialize().then((_) {
        setState(() {});
        controller.setLooping(true);
        controller.play();
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void toggleVideo() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    if (!controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTap: toggleVideo,

      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: controller.value.size.width,
            height: controller.value.size.height,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );


  }
}