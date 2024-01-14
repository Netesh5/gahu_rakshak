// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gahurakshak/core/widgets/loading/loading_dialog.dart';
import 'package:gahurakshak/features/homepage/data/repositories/upload_analyze_data_repo.dart';
import 'package:gahurakshak/features/result/data/models/result_model.dart';
import 'package:image_picker/image_picker.dart';

import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/features/result/data/respository/upload_image.dart';

class ImagePickerService with ChangeNotifier {
  UploadImage uploadImage;
  UploadAnalyzeDataRepo uploadAnalyzeDataRepo;
  final ImagePicker picker = ImagePicker();

  XFile? file;
  ImagePickerService({
    required this.uploadImage,
    required this.uploadAnalyzeDataRepo,
    this.file,
  });
  pickFromGallery(BuildContext context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    file = image;
    showLoadingDialog(context, true);
    await uploadImage
        .uploadImage(
      fileName: file!.name,
      file: File(file!.path),
    )
        .then(
      (value) async {
        await uploadAnalyzeDataRepo.uploadAnalyzeData(
          context: context,
          param: ResultModel(
            diseaseName: "Testing Disease",
            dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
            imagePath: value,
          ),
        );

        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.of(context).pushNamed(Routes.result, arguments: file!.path);
      },
    );

    notifyListeners();
  }

  takeImageFromCamera(BuildContext context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    file = image;
    showLoadingDialog(context, true);
    await uploadImage
        .uploadImage(
      fileName: file!.name,
      file: File(file!.path),
    )
        .then(
      (value) async {
        await uploadAnalyzeDataRepo.uploadAnalyzeData(
          context: context,
          param: ResultModel(
            diseaseName: "Testing Disease",
            dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
            imagePath: value,
          ),
        );

        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.of(context).pushNamed(Routes.result, arguments: file!.path);
      },
    );
    notifyListeners();
  }
}
