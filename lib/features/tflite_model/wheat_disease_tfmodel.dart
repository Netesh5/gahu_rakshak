import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class WheatDieseaseTFModel {
  loadModel() async {
    await Tflite.loadModel(
      model: "assets/tflite/converted_model.tflite",
      labels: "assets/tflite/label.txt",
    );
  }

  makePredictions(String imgPath) async {
    final output = await Tflite.runModelOnImage(
      path: imgPath,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    debugPrint(output.toString());
    return output;
  }

  disposeModel() {
    Tflite.close();
  }
}
