import 'dart:io';

import 'package:image_picker/image_picker.dart';

class BaseImagePicker {
  BaseImagePicker._();

  ///#[getImageFromCamera] Get image from camera
  static Future<File?> getImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return File(image!.path);
  }

  ///#[getImageFromGallery] Get image from gallery
  static Future<File?> getImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return File(image!.path);
  }

  ///#[getImageFromCamera] Get image from camera
  static Future<List<File?>?> getMultipleImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();
    final List<File?>? result = [];
    images!.forEach((element) {
      result!.add(File(element.path));
    });
    return result;
  }

  ///#[getMultipleImagesWithLimit] get multiple images with limit
  static Future<List<File?>?> getMultipleImagesWithLimit(
      {required int maxImage}) async {
    final ImagePicker _picker = ImagePicker();
    final List<File?>? result = [];
    for (int i = 0; i < maxImage; i++) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      result?.add(File(image!.path));
    }
    return result;
  }

  ///#[getVideoFromCamera] Get video from camera
  static Future<File?> getVideoFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    return File(video!.path);
  }

  ///#[getVideoFromGallery] Get video from gallery
  static Future<File?> getVideoFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickImage(source: ImageSource.gallery);
    return File(video!.path);
  }
}
