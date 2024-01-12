import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService with ChangeNotifier {
  final ImagePicker picker = ImagePicker();

  XFile? file;
  pickFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    file = image;
    notifyListeners();
  }

  takeImageFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    file = image;
    notifyListeners();
  }
}
