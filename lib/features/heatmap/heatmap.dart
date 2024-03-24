// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'dart:math';

class HeatMapPainter extends CustomPainter {
  final List xAxis;
  final List yAxis;
  final List<List<num>> data;
  final Color color;
  final double cellWidth;
  final double cellHeight;
  final double cellSpacing;
  HeatMapPainter({
    required this.xAxis,
    required this.yAxis,
    required this.data,
    required this.color,
    required this.cellWidth,
    required this.cellHeight,
    required this.cellSpacing,
  });
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < xAxis.length; i++) {
      for (int j = 0; j < yAxis.length; j++) {
        final Rect rect = Rect.fromLTWH(
          i * cellWidth,
          j * cellHeight,
          cellWidth,
          cellHeight,
        );
        num value = data[i][j];
        Color color = getColor(value);
        Paint paint = Paint()..color = color;
        canvas.drawRect(rect, paint);

        // Add dividers between cells
        final Paint dividerPaint = Paint()..color = Colors.white;
        canvas.drawLine(
          Offset((i + 1) * cellWidth, j * cellHeight),
          Offset((i + 1) * cellWidth, (j + 1) * cellHeight),
          dividerPaint,
        );
        canvas.drawLine(
          Offset(i * cellWidth, (j + 1) * cellHeight),
          Offset((i + 1) * cellWidth, (j + 1) * cellHeight),
          dividerPaint,
        );

        // Display unique data within each cell
        final TextSpan span = TextSpan(
          text: i.toString(),
          style: const TextStyle(color: Colors.white),
        );
        final TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        final double dx = i * cellWidth + (cellWidth - tp.width) / 2;
        final double dy = j * cellHeight + (cellHeight - tp.height) / 2;
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
    return Color.fromRGBO((255 * ratio).toInt(), 0, 0, 1);
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
  bool shouldRepaint(HeatMapPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(HeatMapPainter oldDelegate) => false;
}
