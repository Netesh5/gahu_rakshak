import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  TextStyle bodyLargeMedium;
  TextStyle bodyLargeRegular;
  TextStyle bodyLargeSemiBold;
  TextStyle bodyNormalMedium;
  TextStyle bodyNormalRegular;
  TextStyle bodyNormalSemiBold;
  TextStyle bodyNormalBold;
  TextStyle bodyOddNormal;
  TextStyle bodyOddMedium;
  TextStyle bodyOddSemibold;
  TextStyle pageHeader;
  TextStyle button;
  TextStyle header;
  TextStyle navBar;
  TextStyle bodySmallRegular;
  TextStyle bodySmallMedium;
  TextStyle label;
  TextStyle formInput;
  TextStyle formhelper;
  TextStyle cardHeader;
  TextStyle drawerHeader;
  TextStyle sectionHeader;

  AppTextTheme({
    required this.bodyLargeMedium,
    required this.bodyLargeRegular,
    required this.bodyLargeSemiBold,
    required this.bodyNormalMedium,
    required this.bodyNormalRegular,
    required this.bodyNormalSemiBold,
    required this.bodyOddNormal,
    required this.bodyOddMedium,
    required this.bodyOddSemibold,
    required this.pageHeader,
    required this.header,
    required this.navBar,
    required this.button,
    required this.bodySmallRegular,
    required this.bodySmallMedium,
    required this.label,
    required this.formInput,
    required this.formhelper,
    required this.cardHeader,
    required this.bodyNormalBold,
    required this.drawerHeader,
    required this.sectionHeader,
  });

  factory AppTextTheme.light() {
    return AppTextTheme(
      bodyLargeRegular: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColor.textColor,
      ),
      bodyLargeMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
        color: AppColor.textColor,
      ),
      bodyLargeSemiBold: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: AppColor.textColor,
      ),
      bodyNormalMedium: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.25,
        color: AppColor.textColor,
      ),
      bodyNormalRegular: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColor.textColor,
      ),
      bodyNormalBold: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.5,
        color: AppColor.textColor,
      ),
      bodyOddNormal: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: AppColor.textColor),
      bodyOddMedium: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        height: 1.5,
        color: AppColor.textColor,
      ),
      bodyOddSemibold: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: AppColor.textColor,
      ),
      bodyNormalSemiBold: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: AppColor.textColor,
      ),
      button: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.25,
        color: AppColor.textColor,
      ),
      pageHeader: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.25,
        color: AppColor.textColor,
      ),
      header: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: AppColor.textColor,
      ),
      navBar: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.35,
        color: AppColor.textColor,
      ),
      bodySmallRegular: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.3,
        color: AppColor.textColor,
      ),
      bodySmallMedium: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.3,
        color: AppColor.textColor,
      ),
      label: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.2,
        color: AppColor.textColor,
      ),
      formInput: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColor.textColor,
      ),
      formhelper: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.3,
        color: AppColor.textColor,
      ),
      cardHeader: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: AppColor.textColor,
      ),
      drawerHeader: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.2,
        color: AppColor.textColor,
      ),
      sectionHeader: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: AppColor.textColor,
      ),
    );
  }

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? bodyLargeRegular,
    TextStyle? bodyLargeMedium,
    TextStyle? bodyLargeSemiBold,
    TextStyle? bodyNormalMedium,
    TextStyle? bodyNormalRegular,
    TextStyle? button,
    TextStyle? header,
    TextStyle? navBar,
    TextStyle? pageHeader,
    TextStyle? bodySmallRegular,
    TextStyle? bodySmallMedium,
    TextStyle? bodyNormalSemiBold,
    TextStyle? bodyNormalBold,
    TextStyle? bodyOddNormal,
    TextStyle? bodyOddMedium,
    TextStyle? bodyOddSemibold,
    TextStyle? label,
    TextStyle? formInput,
    TextStyle? formhelper,
    TextStyle? cardHeader,
    TextStyle? drawerHeader,
    TextStyle? sectionHeader,
  }) {
    return AppTextTheme(
      bodyLargeRegular: bodyLargeRegular ?? this.bodyLargeRegular,
      bodyLargeMedium: bodyLargeMedium ?? this.bodyLargeMedium,
      bodyLargeSemiBold: bodyLargeSemiBold ?? this.bodyLargeSemiBold,
      bodyNormalMedium: bodyNormalMedium ?? this.bodyNormalMedium,
      bodyNormalRegular: bodyNormalRegular ?? this.bodyNormalRegular,
      header: header ?? this.header,
      navBar: navBar ?? this.navBar,
      pageHeader: pageHeader ?? this.pageHeader,
      button: button ?? this.button,
      bodySmallRegular: bodySmallRegular ?? this.bodySmallRegular,
      bodyNormalSemiBold: bodyNormalSemiBold ?? this.bodyNormalSemiBold,
      bodyNormalBold: bodyNormalBold ?? this.bodyNormalBold,
      bodyOddNormal: bodyOddNormal ?? this.bodyOddNormal,
      bodyOddMedium: bodyOddMedium ?? this.bodyOddMedium,
      bodyOddSemibold: bodyOddSemibold ?? this.bodyOddSemibold,
      label: label ?? this.label,
      formInput: formInput ?? this.formInput,
      formhelper: formhelper ?? this.formhelper,
      cardHeader: cardHeader ?? this.cardHeader,
      drawerHeader: drawerHeader ?? this.drawerHeader,
      sectionHeader: sectionHeader ?? this.sectionHeader,
      bodySmallMedium: bodySmallMedium ?? this.bodySmallMedium,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
      covariant ThemeExtension<AppTextTheme>? other, double t) {
    return this;
  }
}
