// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:gahurakshak/core/widgets/loading/loading_dialog.dart';
import 'package:gahurakshak/features/homepage/data/repositories/upload_analyze_data_repo.dart';
import 'package:gahurakshak/features/homepage/presentation/widgets/choose_model_bottom_sheet.dart';

import 'package:image_picker/image_picker.dart';

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
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 256,
      maxWidth: 256,
    );
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
        // img.Image? oriImage = img.decodeJpg(await file!.readAsBytes());
        // img.Image resizedImage =
        //     img.copyResize(oriImage!, height: 256, width: 256);

        // final newFile = img.encodeJpg(resizedImage);

        // File wheatImage = File(file!.path);
        // wheatImage = await wheatImage.writeAsBytes(newFile);

        // final output = await WheatDieseaseTFModel().makePredictions(file!.path);

        // await uploadAnalyzeDataRepo.uploadAnalyzeData(
        //   context: context,
        //   param: checkResult(output, value),
        // );

        // Navigator.pop(context);
        // Navigator.pop(context);
        // Navigator.of(context).pushNamed(
        //   Routes.result,
        //   arguments: checkResult(output, value),
        // );
        showChooseModelBottomSheet(
            context, file!.path, value, uploadAnalyzeDataRepo);
      },
    );

    notifyListeners();
  }

  takeImageFromCamera(BuildContext context) async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxHeight: 224,
      maxWidth: 224,
    );
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
        // await uploadAnalyzeDataRepo.uploadAnalyzeData(
        //   context: context,
        //   param: ResultModel(
        //     diseaseName: "Testing Disease",
        //     dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        //     imagePath: value,
        //     confidence: "1.0",
        //   ),
        // );
        // final bytes = await file!.readAsBytes();

        showChooseModelBottomSheet(
            context, file!.path, value, uploadAnalyzeDataRepo);

        // final output = await WheatDieseaseTFModel()
        //     .makePredictions(img.decodeImage(bytes) as img.Image);
        // // final output = await WheatDieseaseTFModel().makePredictions(file!.path);
        // Navigator.pop(context);
        // Navigator.pop(context);
        // Navigator.of(context).pushNamed(
        //   Routes.result,
        //   arguments: checkResult(output, file!.path),
        // );
      },
    );
    notifyListeners();
  }
}
