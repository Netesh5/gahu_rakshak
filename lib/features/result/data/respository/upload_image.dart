import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadImage with ChangeNotifier {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadImage({
    required String fileName,
    required File file,
  }) async {
    try {
      final ref = storage.ref().child("result/$fileName");
      TaskSnapshot taskSnapshot = await ref.putFile(file);
      final downloadUrl = await taskSnapshot.ref.getDownloadURL();
      debugPrint(downloadUrl);
      notifyListeners();
      return downloadUrl;
    } on FirebaseException catch (e) {
      debugPrint(e.message);
      return "";
    }
  }
}
