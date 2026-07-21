import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageService {
  final ImagePicker _picker = ImagePicker();

  /// Pick Image From Camera
  Future<File?> pickFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (image == null) return null;

      return File(image.path);
    } catch (e) {
      print("Camera Error: $e");
      return null;
    }
  }

  /// Pick Image From Gallery
  Future<File?> pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image == null) return null;

      return File(image.path);
    } catch (e) {
      print("Gallery Error: $e");
      return null;
    }
  }
}