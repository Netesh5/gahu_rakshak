import 'package:easy_localization/easy_localization.dart';

import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/constants/similar_images.dart';

import 'package:gahurakshak/features/result/data/models/result_model.dart';

ResultModel checkResult(dynamic output, String imagePath) {
  switch (output["label"]) {
    case "Crown and Root Rot":
      return ResultModel(
        diseaseName: LocaleKeys.crownRootRot.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.crownRootRotDesc.tr(),
        recommendation: LocaleKeys.crownRootRecommenadtion.tr(),
        medicine:
            "${LocaleKeys.triazoleP.tr()}\n${LocaleKeys.strobilurins.tr()}\n${LocaleKeys.trifloxystrobin.tr()}\n${LocaleKeys.flutriafol.tr()}",
        similarImg: crownRoot,
        confidence: output["confidence"].toString(),
      );

    case "Wheat_healthy":
      return ResultModel(
        diseaseName: LocaleKeys.healthy.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: "",
        recommendation: "",
        medicine: "",
        similarImg: healthyImg,
        confidence: output["confidence"].toString(),
      );
    case "Wheat___Yellow_Rust":
      return ResultModel(
        diseaseName: LocaleKeys.yellowRust.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.yellowRustDesc.tr(),
        recommendation: LocaleKeys.yellowRustRecommendation.tr(),
        medicine:
            "${LocaleKeys.triazolesT.tr()}\n${LocaleKeys.dmiFungicides.tr()}\n${LocaleKeys.azoxystrobin.tr()}\n${LocaleKeys.flutriafol.tr()}",
        similarImg: yellowRustImg,
        confidence: (output["confidence"]).toString(),
      );
    case "Leaf Rust":
      return ResultModel(
        diseaseName: LocaleKeys.leafRust.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.leafRustDesc.tr(),
        recommendation: LocaleKeys.leafRustRecommendation.tr(),
        medicine:
            "${LocaleKeys.triazoleP.tr()}\n${LocaleKeys.strobilurins.tr()}\n${LocaleKeys.tebuconazole.tr()}\n${LocaleKeys.fluxapyroxad.tr()}",
        similarImg: leafRust,
        confidence: output["confidence"].toString(),
      );
    case "Wheat Loose Smut":
      return ResultModel(
        diseaseName: LocaleKeys.wheatLooseSmut.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.wheatLooseSmutDesc.tr(),
        recommendation: LocaleKeys.wheatLooseSmutRecommendation.tr(),
        medicine:
            "${LocaleKeys.azoxystrobin.tr()}\n${LocaleKeys.payraclostrobin.tr()}\n${LocaleKeys.propiconazole.tr()}\n${LocaleKeys.tebuconazole.tr()}",
        similarImg: looseSmut,
        confidence: output["confidence"].toString(),
      );
    case "Fusarium Head Blight":
      return ResultModel(
        diseaseName: LocaleKeys.fusariumHeadBlight.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.fusariumDesc.tr(),
        recommendation: LocaleKeys.fusarumRecommendation.tr(),
        medicine:
            "${LocaleKeys.triazolesF.tr()}\n${LocaleKeys.strobilurinsT.tr()}\n${LocaleKeys.azoxystrobin.tr()}\n${LocaleKeys.propiconazole.tr()}",
        similarImg: fusarium,
        confidence: output["confidence"].toString(),
      );
    default:
      return ResultModel(
        diseaseName: "diseaseName",
        dateTime: "",
        imagePath: imagePath,
        confidence: "",
      );
  }
}

// Brown_rust
// Healthy
// Wheat___Yellow_Rust
// leaf_rust
// septoria
// stripe_rust

ResultModel showResultInHistory(String diseaseName, String dateTime,
    String imagePath, int index, String confidence) {
  switch (diseaseName) {
    case "Crown Root Rot":
      return ResultModel(
        diseaseName: LocaleKeys.crownRootRot.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.crownRootRotDesc.tr(),
        recommendation: LocaleKeys.crownRootRecommenadtion.tr(),
        medicine:
            "${LocaleKeys.triazoleP.tr()}\n${LocaleKeys.strobilurins.tr()}\n${LocaleKeys.trifloxystrobin.tr()}\n${LocaleKeys.flutriafol.tr()}",
        similarImg: crownRoot,
        index: index,
        confidence: confidence,
      );

    case "Healthy":
      return ResultModel(
        diseaseName: "No Disease Detected",
        dateTime: dateTime,
        imagePath: imagePath,
        index: index,
        confidence: confidence,
      );
    case "Yellow Rust":
      return ResultModel(
        diseaseName: LocaleKeys.yellowRust.tr(),
        dateTime: dateTime,
        imagePath: imagePath,
        description: LocaleKeys.yellowRustDesc.tr(),
        recommendation: LocaleKeys.yellowRustRecommendation.tr(),
        medicine:
            "${LocaleKeys.triazolesT.tr()}\n${LocaleKeys.dmiFungicides.tr()}\n${LocaleKeys.azoxystrobin.tr()}\n${LocaleKeys.flutriafol.tr()}",
        similarImg: yellowRustImg,
        index: index,
        confidence: confidence,
      );
    case "Leaf Rust":
      return ResultModel(
        diseaseName: LocaleKeys.leafRust.tr(),
        dateTime: dateTime,
        imagePath: imagePath,
        description: LocaleKeys.leafRustDesc.tr(),
        recommendation: LocaleKeys.leafRustRecommendation.tr(),
        medicine:
            "${LocaleKeys.triazoleP.tr()}\n${LocaleKeys.strobilurins.tr()}\n${LocaleKeys.tebuconazole.tr()}\n${LocaleKeys.fluxapyroxad.tr()}",
        similarImg: leafRust,
        index: index,
        confidence: confidence,
      );
    case "Wheat Loose Smut":
      return ResultModel(
        diseaseName: LocaleKeys.wheatLooseSmut.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.wheatLooseSmutDesc.tr(),
        recommendation: LocaleKeys.wheatLooseSmutRecommendation.tr(),
        medicine:
            "${LocaleKeys.azoxystrobin.tr()}\n${LocaleKeys.payraclostrobin.tr()}\n${LocaleKeys.propiconazole.tr()}\n${LocaleKeys.tebuconazole.tr()}",
        similarImg: looseSmut,
        index: index,
        confidence: confidence,
      );
    case "Fusarium Head Blight":
      return ResultModel(
        diseaseName: LocaleKeys.fusariumHeadBlight.tr(),
        dateTime: dateTime,
        imagePath: imagePath,
        description: LocaleKeys.fusariumDesc.tr(),
        recommendation: LocaleKeys.fusarumRecommendation.tr(),
        medicine:
            "${LocaleKeys.triazolesF.tr()}\n${LocaleKeys.strobilurinsT.tr()}\n${LocaleKeys.azoxystrobin.tr()}\n${LocaleKeys.propiconazole.tr()}",
        similarImg: fusarium,
        index: index,
        confidence: confidence,
      );
    default:
      return ResultModel(
        diseaseName: "diseaseName",
        dateTime: "",
        imagePath: imagePath,
        confidence: confidence,
      );
  }
}
