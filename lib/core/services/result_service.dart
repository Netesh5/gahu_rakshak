import 'package:easy_localization/easy_localization.dart';

import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/constants/similar_images.dart';

import 'package:gahurakshak/features/result/data/models/result_model.dart';

ResultModel checkResult(dynamic output, String imagePath) {
  switch (output["label"]) {
    case "Wheat___Brown_rust":
      return ResultModel(
        diseaseName: LocaleKeys.brownRust.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.brownRustDesc.tr(),
        recommendation: LocaleKeys.brownRustRecommendation.tr(),
        medicine:
            "${LocaleKeys.triazoleP.tr()}\n${LocaleKeys.strobilurins.tr()}\n${LocaleKeys.trifloxystrobin.tr()}\n${LocaleKeys.flutriafol.tr()}",
        similarImg: brownRustImg,
        confidence: output["confidence"].toString(),
      );

    case "Healthy Wheat":
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
    case "septoria":
      return ResultModel(
        diseaseName: LocaleKeys.brownRust.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.brownRustDesc.tr(),
        recommendation: LocaleKeys.recommendation.tr(),
        medicine:
            "${LocaleKeys.azoxystrobin.tr()}\n${LocaleKeys.payraclostrobin.tr()}\n${LocaleKeys.propiconazole.tr()}\n${LocaleKeys.tebuconazole.tr()}",
        similarImg: septoriaImg,
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
        similarImg: stripRust,
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
    case "Brown Rust":
      return ResultModel(
        diseaseName: LocaleKeys.brownRust.tr(),
        dateTime: dateTime,
        imagePath: imagePath,
        description: LocaleKeys.brownRustDesc.tr(),
        recommendation: LocaleKeys.recommendation.tr(),
        medicine:
            "${LocaleKeys.triazoleP.tr()}\n${LocaleKeys.strobilurins.tr()}\n${LocaleKeys.trifloxystrobin.tr()}\n${LocaleKeys.flutriafol.tr()}",
        similarImg: brownRustImg,
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
    case "Septoria":
      return ResultModel(
        diseaseName: LocaleKeys.septoria.tr(),
        dateTime: dateTime,
        imagePath: imagePath,
        description: LocaleKeys.brownRustDesc.tr(),
        recommendation: LocaleKeys.recommendation.tr(),
        medicine:
            "${LocaleKeys.azoxystrobin.tr()}\n${LocaleKeys.payraclostrobin.tr()}\n${LocaleKeys.propiconazole.tr()}\n${LocaleKeys.tebuconazole.tr()}",
        similarImg: septoriaImg,
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
        similarImg: stripRust,
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
