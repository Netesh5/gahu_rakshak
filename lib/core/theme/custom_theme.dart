import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static const double pagePadding = 20;
  static const double pageTopPadding = 24;
  static const double cardPadding = 16;
  static const double borderRadius = 4;
  static const double cardBorderRadius = 8;
  static const double cardBottomMargin = 24;
  static const double spaceBetween = 12;

  static const LinearGradient primaryLinearGradient = LinearGradient(
    colors: [
      Color(0xFF424176),
      Color(0xFFBAB5FE),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static ThemeData get lightTheme => ThemeData(
        primaryColor: AppColor.primaryLight,
        useMaterial3: false,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: AppTextTheme.light().navBar,
          selectedItemColor: AppColor.primaryLight,
          unselectedLabelStyle: AppTextTheme.light().navBar,
          unselectedItemColor: AppColor.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          elevation: 0,
          backgroundColor: AppColor.backgroundColor,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColor.primaryLight,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        scaffoldBackgroundColor: AppColor.backgroundColor,
        fontFamily: GoogleFonts.nunito().fontFamily,
        iconTheme: const IconThemeData(
          color: AppColor.primaryLight,
        ),
        dividerTheme: const DividerThemeData(
          thickness: 1,
          color: AppColor.grey,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryLight,
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: const BorderSide(color: AppColor.primaryLight),
        ),
        expansionTileTheme: const ExpansionTileThemeData(
          iconColor: AppColor.primaryLight,
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.symmetric(
            horizontal: CustomTheme.pagePadding,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(CustomTheme.borderRadius),
            ),
          ),
        ),
        splashColor: AppColor.primaryLight.withOpacity(0.4),
        dividerColor: Colors.transparent,
        tabBarTheme: TabBarTheme(
          labelColor: AppColor.primaryLight,
          labelStyle: AppTextTheme.light().sectionHeader,
          unselectedLabelColor: AppColor.grey,
          unselectedLabelStyle: AppTextTheme.light().bodyLargeRegular,
          indicatorColor: AppColor.primaryLight,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColor.primaryLight,
                width: 2,
              ),
            ),
          ),
        ),
        extensions: [
          AppTextTheme.light(),
        ],
      );
}
