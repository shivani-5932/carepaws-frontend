import 'dart:io';
import 'package:care_paws/modules/community/data/story_data.dart';
import 'package:care_paws/modules/community/uploads/story_upload/widget/story_top_bar_widget.dart';
import 'package:care_paws/modules/community/uploads/story_upload/widget/story_upload_button_widget.dart';
import 'package:care_paws/utils/media_picker_service.dart';
import 'package:flutter/material.dart';

class StoryUploadScreen extends StatefulWidget {

  final File? initialMedia;
  final bool isVideo;

  const StoryUploadScreen({
    super.key,
    this.initialMedia,
    this.isVideo = false,
  });

  @override
  State<StoryUploadScreen> createState() => _StoryUploadScreenState();
}

class _StoryUploadScreenState extends State<StoryUploadScreen> {

  File? selectedMedia;
  bool isVideo = false;

  final MediaPickerService _mediaService = MediaPickerService();
  TextEditingController textController = TextEditingController();
  bool showTextField = false;
  List<Offset?> points = [];

  void toggleText() {
    setState(() {
      showTextField = !showTextField;
    });
  }

  void openMusicPicker() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ListView(
          shrinkWrap: true,
          children: const [
            ListTile(title: Text("Song 1")),
            ListTile(title: Text("Song 2")),
            ListTile(title: Text("Song 3")),
          ],
        );
      },
    );
  }

  void toggleDraw() {
    // abhi basic draw hai (gesture se)
  }

  @override
  void initState() {
    super.initState();

    /// 🔥 PRE-SELECTED MEDIA (FROM STORY ITEM)
    if (widget.initialMedia != null) {
      selectedMedia = widget.initialMedia;
      isVideo = widget.isVideo;
    }
  }

  /// 🔥 PICK FROM CAMERA
  Future<void> pickFromCamera(MediaType type) async {
    final file = await _mediaService.pickFromCamera(type);

    if (file != null) {
      setState(() {
        selectedMedia = file;
        isVideo = type == MediaType.video;
      });
    }
  }

  /// 🔥 PICK FROM GALLERY
  Future<void> pickFromGallery(MediaType type) async {
    final file = await _mediaService.pickFromGallery(type);

    if (file != null) {
      setState(() {
        selectedMedia = file;
        isVideo = type == MediaType.video;
      });
    }
  }

  /// 🔥 UPLOAD STORY (TEMP LOCAL)
  void uploadStory() {
    if (selectedMedia != null) {
      StoryData.userStories.add(selectedMedia!);

      Navigator.pop(context);
    }
  }

  /// 🔥 PICK OPTIONS
  void showPickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            ListTile(
              title: const Text("Camera (Image)"),
              onTap: () {
                Navigator.pop(context);
                pickFromCamera(MediaType.image);
              },
            ),

            ListTile(
              title: const Text("Camera (Video)"),
              onTap: () {
                Navigator.pop(context);
                pickFromCamera(MediaType.video);
              },
            ),

            ListTile(
              title: const Text("Gallery (Image)"),
              onTap: () {
                Navigator.pop(context);
                pickFromGallery(MediaType.image);
              },
            ),

            ListTile(
              title: const Text("Gallery (Video)"),
              onTap: () {
                Navigator.pop(context);
                pickFromGallery(MediaType.video);
              },
            ),

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          /// 🔥 BACKGROUND PREVIEW
          SizedBox.expand(
            child: selectedMedia == null
                ? Image.asset(
              "assets/images/dog1.png",
              fit: BoxFit.cover,
            )
                : isVideo
                ? const Center(
              child: Icon(
                Icons.play_circle,
                size: 80,
                color: Colors.white,
              ),
            )
                : Image.file(
              selectedMedia!,
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: StoryTopBarWidget(
              onBack: () => Navigator.pop(context),
              onText: toggleText,
              onMusic: openMusicPicker,
              onDraw: toggleDraw,
            ),
          ),

          /// 🔥 UPLOAD BUTTON
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  if (selectedMedia == null) {
                    showPickerOptions(); // pick first
                  } else {
                    uploadStory(); // upload
                  }
                },
                child: const StoryUploadButtonWidget(),
              ),
            ),
          ),

        ],
      ),
    );
  }
}