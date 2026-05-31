import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    final XFile? file =
    await _picker.pickImage(source: ImageSource.gallery);

    return file != null ? File(file.path) : null;
  }

  Future<File?> pickImageFromCamera() async {
    final XFile? file =
    await _picker.pickImage(source: ImageSource.camera);

    return file != null ? File(file.path) : null;
  }

  Future<File?> pickVideoFromGallery() async {
    final XFile? file =
    await _picker.pickVideo(source: ImageSource.gallery);

    return file != null ? File(file.path) : null;
  }

  Future<File?> pickVideoFromCamera() async {
    final XFile? file =
    await _picker.pickVideo(source: ImageSource.camera);

    return file != null ? File(file.path) : null;
  }
}