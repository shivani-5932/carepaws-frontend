import 'dart:io';
import 'package:care_paws/utils/media_picker_service.dart';
import 'package:flutter/material.dart';

class CommonMediaPickerBottomSheet extends StatelessWidget {
  final Function(File file, bool isVideo) onSelected;

  const CommonMediaPickerBottomSheet({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final mediaService = MediaPickerService();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        /// 📸 CAMERA (direct open)
        ListTile(
          title: const Text("Camera"),
          onTap: () async {
            Navigator.pop(context);

            /// 👇 DEFAULT → IMAGE CAMERA OPEN
            final file = await mediaService.pickFromCamera(MediaType.image);

            if (file != null) {
              onSelected(file, false);
            }
          },
        ),

        /// 🖼️ GALLERY (direct open)
        ListTile(
          title: const Text("Gallery"),
          onTap: () async {
            Navigator.pop(context);

            /// 👇 DEFAULT → IMAGE GALLERY OPEN
            final file = await mediaService.pickFromGallery(MediaType.image);

            if (file != null) {
              onSelected(file, false);
            }
          },
        ),

      ],
    );
  }
}