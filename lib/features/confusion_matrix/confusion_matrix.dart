import 'dart:math';

import 'package:flutter/material.dart';

class ConfusionMatrixPainter extends CustomPainter {
  final List<String> xAxis;
  final List<String> yAxis;
  final List<List<num>> data;
  final Color color;
  final double cellWidth;
  final double cellHeight;
  final num backgroundOpacity;

  ConfusionMatrixPainter({
    required this.xAxis,
    required this.yAxis,
    required this.data,
    required this.color,
    required this.cellWidth,
    required this.cellHeight,
    this.backgroundOpacity = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data[i].length; j++) {
        final Rect rect = Rect.fromLTWH(
          j * cellWidth,
          i * cellHeight,
          cellWidth,
          cellHeight,
        );
        num value = data[i][j];
        Color cellColor = getColor(value);
        Paint paint = Paint()..color = cellColor;
        canvas.drawRect(rect, paint);

        // Draw dividers between cells
        final Paint dividerPaint = Paint()..color = Colors.white;
        canvas.drawLine(
          Offset((j + 1) * cellWidth, i * cellHeight),
          Offset((j + 1) * cellWidth, (i + 1) * cellHeight),
          dividerPaint,
        );
        canvas.drawLine(
          Offset(j * cellWidth, (i + 1) * cellHeight),
          Offset((j + 1) * cellWidth, (i + 1) * cellHeight),
          dividerPaint,
        );

        // Display unique data within each cell
        final TextSpan span = TextSpan(
          text: value.toString(),
          style: const TextStyle(color: Colors.white),
        );
        final TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        final double dx = j * cellWidth + (cellWidth - tp.width) / 2;
        final double dy = i * cellHeight + (cellHeight - tp.height) / 2;
        tp.paint(canvas, Offset(dx, dy));
      }
    }

    // Draw labels on top side
    for (int i = 0; i < xAxis.length; i++) {
      final TextSpan span = TextSpan(
        text: xAxis[i],
      );
      final TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      final double dx = i * cellWidth + (cellWidth - tp.width) / 2;
      final double dy = -tp.height; // Move labels above the heatmap
      tp.paint(canvas, Offset(dx, dy));
    }

    // Draw labels on left side
    for (int j = 0; j < yAxis.length; j++) {
      final TextSpan span = TextSpan(
        text: yAxis[j],
      );
      final TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      final double dx = -tp.width - 2; // Move labels to the left of the heatmap
      final double dy = j * cellHeight + (cellHeight - tp.height) / 2;
      tp.paint(canvas, Offset(dx, dy));
    }
  }

  Color getColor(num value) {
    List<num> result = minMax(data);
    double minVal = result[0].toDouble();
    double maxVal = result[1].toDouble();
    double ratio = (value - minVal) / (maxVal - minVal);

    // To create the background color according to box
    Color baseColor = color
        .withRed(color.red ~/ backgroundOpacity)
        .withGreen(color.green ~/ backgroundOpacity)
        .withBlue(color.blue ~/ backgroundOpacity);

    // Interpolate between the adjusted base color and the provided color based on the ratio
    return Color.lerp(baseColor, color, ratio)!;
  }

  List<num> minMax(List<List<num>> list) {
    return list.reduce(
      (previous, current) {
        final minVal = min(previous[0], current.reduce(min));
        final maxVal = max(previous[1], current.reduce(max));
        return [minVal, maxVal];
      },
    );
  }

  @override
  bool shouldRepaint(ConfusionMatrixPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ConfusionMatrixPainter oldDelegate) => false;
}
