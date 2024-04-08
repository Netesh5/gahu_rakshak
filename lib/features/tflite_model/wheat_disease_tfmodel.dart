import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image/image.dart' as img;

class WheatDieseaseTFModel {
  loadModel() async {
    disposeModel();
    final res = await Tflite.loadModel(
      model: "assets/tflite/converted_cnn30model.tflite",
      labels: "assets/tflite/label.txt",
    );
    debugPrint(res);
  }

  makePredictions(String imgPath) async {
    await loadModel();
    final output = await Tflite.runModelOnImage(
      path: imgPath,
      imageMean: 0,
      numResults: 6,
      imageStd: 224.0,
      threshold: 0.3,
      asynch: true,
    );
    debugPrint(output.toString());
    //  await disposeModel();
    return output?.first;
  }

  // makePredictions(img.Image image) async {
  //   // final output = await Tflite.runModelOnImage(
  //   //   path: imgPath,
  //   //   threshold: 0.5,
  //   //   imageMean: 127.5,
  //   //   imageStd: 127.5,
  //   //   numResults: 6,
  //   // );

  //   try {
  //     final output = await Tflite.runModelOnBinary(
  //       threshold: 0.5,
  //       numResults: 6,
  //       binary: imageToByteListUint8(image, 256),
  //     );

  //     debugPrint(output.toString());
  //     return output?.first["label"];
  //   } on Exception catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  Uint8List imageToByteListUint8(img.Image image, int inputSize) {
    var convertedBytes = Uint8List(4 * inputSize * inputSize * 3);
    Uint8List buffer = Uint8List.view(convertedBytes.buffer);
    debugPrint(buffer.toString());
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        int pixel = image.getPixel(j, i);

        buffer[pixelIndex++] = img.getRed(pixel);
        buffer[pixelIndex++] = img.getGreen(pixel);
        buffer[pixelIndex++] = img.getBlue(pixel);
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  disposeModel() {
    Tflite.close();
  }
}
