import 'dart:io';
import 'package:image_picker/image_picker.dart';

enum MediaType { image, video }

class MediaPickerService {
  final ImagePicker _picker = ImagePicker();

  /// 🔥 Gallery (Image / Video dono)
  Future<File?> pickFromGallery(MediaType type) async {
    XFile? file;

    if (type == MediaType.image) {
      file = await _picker.pickImage(source: ImageSource.gallery);
    } else {
      file = await _picker.pickVideo(source: ImageSource.gallery);
    }

    return file != null ? File(file.path) : null;
  }

  /// 🔥 Camera (Image / Video dono)
  Future<File?> pickFromCamera(MediaType type) async {
    XFile? file;

    if (type == MediaType.image) {
      file = await _picker.pickImage(source: ImageSource.camera);
    } else {
      file = await _picker.pickVideo(source: ImageSource.camera);
    }

    return file != null ? File(file.path) : null;
  }
}