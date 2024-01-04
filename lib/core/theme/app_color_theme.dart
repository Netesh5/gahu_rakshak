import 'package:flutter/material.dart';

class AppColor extends ThemeExtension<AppColor> {
  static const Color primaryLight = Color(0xff001B2B);
  static const Color goldenColor = Color(0xffFFBD59);
  static const Color textColor = Color(0xffD9D9D9);
  static const Color grey = Color.fromARGB(255, 205, 203, 203);
  static const Color backgroundColor = Color(0xff001B2B);
  static const Color red = Colors.red;
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  @override
  ThemeExtension<AppColor> lerp(
      covariant ThemeExtension<AppColor>? other, double t) {
    return this;
  }

  @override
  ThemeExtension<AppColor> copyWith() {
    throw UnimplementedError();
  }
}
