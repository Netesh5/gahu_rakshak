import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';

class AppDecorationTheme extends ThemeExtension<AppDecorationTheme> {
  final BoxShadow e0;
  final BoxShadow e1;
  final BoxShadow e2;
  final BoxShadow e3;

  const AppDecorationTheme({
    required this.e0,
    required this.e1,
    required this.e2,
    required this.e3,
  });

  factory AppDecorationTheme.light() {
    const grayColor = AppColors.grey;
    return AppDecorationTheme(
      e0: BoxShadow(
        offset: const Offset(0, 0),
        color: grayColor.withOpacity(0.1),
        blurRadius: 4,
      ),
      e1: BoxShadow(
        offset: const Offset(0, 4),
        color: grayColor.withOpacity(0.1),
        blurRadius: 10,
      ),
      e2: BoxShadow(
        offset: const Offset(0, 4),
        color: grayColor.withOpacity(0.2),
        blurRadius: 20,
      ),
      e3: BoxShadow(
        offset: const Offset(0, 4),
        color: grayColor.withOpacity(0.2),
        blurRadius: 60,
      ),
    );
  }

  @override
  ThemeExtension<AppDecorationTheme> copyWith({
    BoxShadow? e0,
    BoxShadow? e1,
    BoxShadow? e2,
    BoxShadow? e3,
  }) {
    return AppDecorationTheme(
      e0: e0 ?? this.e0,
      e1: e1 ?? this.e1,
      e2: e2 ?? this.e2,
      e3: e3 ?? this.e3,
    );
  }

  @override
  ThemeExtension<AppDecorationTheme> lerp(
      covariant ThemeExtension<AppDecorationTheme>? other, double t) {
    return this;
  }
}
