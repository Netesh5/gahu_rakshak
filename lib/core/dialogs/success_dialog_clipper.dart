import 'package:flutter/material.dart';

class SuccessDialogClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 32);
    const radius = Radius.circular(8);
    path.arcToPoint(const Offset(8, 24), radius: radius);
    path.lineTo((size.width / 2) - 25, 24);
    final start = Offset((size.width / 2) - 25, 24);
    final startMidHalf = Offset((size.width / 2) - 24, 0);
    final startHalf = Offset((size.width / 2), 0);
    final endMid = Offset((size.width / 2) + 24, 0);
    final end = Offset((size.width / 2) + 25, 24);
    path.cubicTo(
      start.dx,
      start.dy,
      startMidHalf.dx,
      startMidHalf.dy,
      startHalf.dx,
      startHalf.dy,
    );
    path.cubicTo(
      startHalf.dx,
      startHalf.dy,
      endMid.dx,
      endMid.dy,
      end.dx,
      end.dy,
    );
    path.lineTo(size.width - 8, 24);
    path.arcToPoint(Offset(size.width, 32), radius: radius);
    path.lineTo(size.width, 24);
    path.lineTo(size.width, size.height - 8);
    path.arcToPoint(Offset(size.width - 8, size.height), radius: radius);
    path.lineTo(8, size.height);
    path.arcToPoint(Offset(0, size.height - 8), radius: radius);
    path.lineTo(0, 24);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
