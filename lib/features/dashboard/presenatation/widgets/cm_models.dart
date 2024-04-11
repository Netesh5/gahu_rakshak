import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/features/confusion_matrix/confusion_matrix.dart';

class VGGCMWidget extends StatelessWidget {
  const VGGCMWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "Confusion Matrix : VGG-16",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomPaint(
            size: const Size(double.infinity, 360),
            painter: ConfusionMatrixPainter(
              xAxis: ["A", "B", "C", "D", "E", "F"],
              yAxis: ["A", "B", "C", "D", "E", "F"],
              data: [
                [90, 0, 1, 1, 0, 1],
                [5, 57, 1, 6, 0, 2],
                [3, 0, 68, 1, 0, 0],
                [12, 0, 2, 69, 2, 7],
                [0, 0, 0, 2, 90, 0],
                [8, 0, 2, 5, 0, 55],
              ],
              color: Colors.red,
              cellWidth: 60,
              cellHeight: 60,
            ),
          ),
        ),
        const Text(
          "Labels : ",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "A - Crown and Root Rot",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "B - Fusarium Head Blight ",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "C - Leaf Rust",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "D - Wheat Loose Smut",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "E - Wheat___Yellow_Rust",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "F - Wheat_healthy",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class CNN30Widget extends StatelessWidget {
  const CNN30Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "Confusion Matrix : CNN-30",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomPaint(
            size: const Size(double.infinity, 360),
            painter: ConfusionMatrixPainter(
              xAxis: ["A", "B", "C", "D", "E", "F"],
              yAxis: ["A", "B", "C", "D", "E", "F"],
              data: [
                [17, 8, 27, 8, 16, 17],
                [16, 8, 18, 10, 11, 8],
                [21, 11, 35, 17, 10, 27],
                [13, 9, 20, 9, 10, 11],
                [11, 12, 32, 7, 13, 17],
                [17, 12, 29, 11, 14, 9],
              ],
              color: Colors.red,
              cellWidth: 60,
              cellHeight: 60,
            ),
          ),
        ),
        const Text(
          "Labels : ",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "A - Crown and Root Rot",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "B - Fusarium Head Blight ",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "C - Wheat_healthy",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "D - Leaf Rust",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "E - Wheat Loose Smut",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "F - Wheat___Yellow_Rust",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class ResnetWidget extends StatelessWidget {
  const ResnetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "Confusion Matrix : Resnet",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomPaint(
            size: const Size(double.infinity, 360),
            painter: ConfusionMatrixPainter(
              xAxis: ["A", "B", "C", "D", "E", "F"],
              yAxis: ["A", "B", "C", "D", "E", "F"],
              data: [
                [19, 1, 36, 4, 25, 8],
                [2, 17, 24, 1, 19, 14],
                [3, 1, 85, 8, 23, 1],
                [6, 0, 20, 30, 10, 6],
                [8, 2, 29, 4, 43, 6],
                [1, 2, 2, 14, 7, 66],
              ],
              color: Colors.red,
              cellWidth: 60,
              cellHeight: 60,
            ),
          ),
        ),
        const Text(
          "Labels : ",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "A - Crown and Root Rot",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "B - Fusarium Head Blight ",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "C - Wheat_healthy",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "D - Leaf Rust",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "E - Wheat Loose Smut",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "F - Wheat___Yellow_Rust",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class MobileNetWidget extends StatelessWidget {
  const MobileNetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "Confusion Matrix : Mobile Net",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomPaint(
            size: const Size(double.infinity, 360),
            painter: ConfusionMatrixPainter(
              xAxis: ["A", "B", "C", "D", "E", "F"],
              yAxis: ["A", "B", "C", "D", "E", "F"],
              data: [
                [34, 0, 1, 11, 16, 1],
                [5, 47, 1, 6, 0, 2],
                [3, 4, 68, 1, 10, 2],
                [12, 1, 2, 57, 2, 7],
                [0, 10, 12, 2, 65, 0],
                [8, 0, 2, 5, 0, 55],
              ],
              color: Colors.red,
              cellWidth: 60,
              cellHeight: 60,
            ),
          ),
        ),
        const Text(
          "Labels : ",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "A - Crown and Root Rot",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "B - Fusarium Head Blight ",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "C - Leaf Rust",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "D - Wheat Loose Smut",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "E - Wheat___Yellow_Rust",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.hp,
        ),
        const Text(
          "F - Wheat_healthy",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
