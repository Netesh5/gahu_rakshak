import 'package:easy_localization/easy_localization.dart';

import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/constants/similar_images.dart';

import 'package:gahurakshak/features/result/data/models/result_model.dart';

ResultModel checkResult(String output, String imagePath) {
  switch (output) {
    case "Brown_rust":
      return ResultModel(
        diseaseName: LocaleKeys.brownRust.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.brownRustDesc.tr(),
        recommendation: LocaleKeys.brownRustRecommendation.tr(),
        medicine:
            "${LocaleKeys.triazoleP.tr()}\n${LocaleKeys.strobilurins.tr()}\n${LocaleKeys.trifloxystrobin.tr()}\n${LocaleKeys.flutriafol.tr()}",
        similarImg: brownRustImg,
      );

    case "Healthy":
      return ResultModel(
        diseaseName: LocaleKeys.healthy.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: "",
        recommendation: "",
        medicine: "",
        similarImg: healthyImg,
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
      );
    case "leaf_rust":
      return ResultModel(
        diseaseName: LocaleKeys.leafRust.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.leafRustDesc.tr(),
        recommendation: LocaleKeys.leafRustRecommendation.tr(),
        medicine:
            "${LocaleKeys.triazoleP.tr()}\n${LocaleKeys.strobilurins.tr()}\n${LocaleKeys.tebuconazole.tr()}\n${LocaleKeys.fluxapyroxad.tr()}",
        similarImg: leafRust,
      );
    case "septoria":
      return ResultModel(
        diseaseName: LocaleKeys.brownRust.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.brownRustDesc,
        recommendation: LocaleKeys.recommendation,
        medicine:
            "${LocaleKeys.azoxystrobin.tr()}\n${LocaleKeys.payraclostrobin.tr()}\n${LocaleKeys.propiconazole.tr()}\n${LocaleKeys.tebuconazole.tr()}",
        similarImg: septoriaImg,
      );
    case "stripe_rust":
      return ResultModel(
        diseaseName: LocaleKeys.brownRust.tr(),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        description: LocaleKeys.brownRustDesc,
        recommendation: LocaleKeys.recommendation,
        medicine:
            "${LocaleKeys.triazolesF.tr()}\n${LocaleKeys.strobilurinsT.tr()}\n${LocaleKeys.azoxystrobin.tr()}\n${LocaleKeys.propiconazole.tr()}",
        similarImg: stripRust,
      );
    default:
      return ResultModel(
          diseaseName: "diseaseName", dateTime: "", imagePath: imagePath);
  }
}

// Brown_rust
// Healthy
// Wheat___Yellow_Rust
// leaf_rust
// septoria
// stripe_rust

ResultModel showResultInHistory(
    String diseaseName, String dateTime, String imagePath, int index) {
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
      );

    case "Healthy":
      return ResultModel(
        diseaseName: "No Disease Detected",
        dateTime: dateTime,
        imagePath: imagePath,
        index: index,
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
      );
    case "Septoria":
      return ResultModel(
        diseaseName: LocaleKeys.brownRust.tr(),
        dateTime: dateTime,
        imagePath: imagePath,
        description: LocaleKeys.brownRustDesc,
        recommendation: LocaleKeys.recommendation,
        medicine:
            "${LocaleKeys.azoxystrobin.tr()}\n${LocaleKeys.payraclostrobin.tr()}\n${LocaleKeys.propiconazole.tr()}\n${LocaleKeys.tebuconazole.tr()}",
        similarImg: septoriaImg,
        index: index,
      );
    case "Stripe Rust":
      return ResultModel(
        diseaseName: LocaleKeys.brownRust.tr(),
        dateTime: dateTime,
        imagePath: imagePath,
        description: LocaleKeys.brownRustDesc,
        recommendation: LocaleKeys.recommendation,
        medicine:
            "${LocaleKeys.triazolesF.tr()}\n${LocaleKeys.strobilurinsT.tr()}\n${LocaleKeys.azoxystrobin.tr()}\n${LocaleKeys.propiconazole.tr()}",
        similarImg: stripRust,
        index: index,
      );
    default:
      return ResultModel(
          diseaseName: "diseaseName", dateTime: "", imagePath: imagePath);
  }
}
