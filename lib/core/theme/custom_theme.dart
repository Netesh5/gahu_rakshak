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
        primaryColor: AppColors.primaryLight,
        useMaterial3: false,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: AppTextTheme.light().navBar,
          selectedItemColor: AppColors.primaryLight,
          unselectedLabelStyle: AppTextTheme.light().navBar,
          unselectedItemColor: AppColors.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryLight,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        fontFamily: GoogleFonts.nunito().fontFamily,
        iconTheme: const IconThemeData(
          color: AppColors.primaryLight,
        ),
        dividerTheme: const DividerThemeData(
          thickness: 1,
          color: AppColors.grey,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryLight,
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: const BorderSide(color: AppColors.primaryLight),
        ),
        expansionTileTheme: const ExpansionTileThemeData(
          iconColor: AppColors.primaryLight,
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.symmetric(
            horizontal: CustomTheme.pagePadding,
          ),
        ),
        listTileTheme: const ListTileThemeData(horizontalTitleGap: 0),
        bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(CustomTheme.borderRadius),
            ),
          ),
        ),
        splashColor: AppColors.primaryLight.withOpacity(0.4),
        dividerColor: Colors.transparent,
        tabBarTheme: TabBarTheme(
          labelColor: AppColors.primaryLight,
          labelStyle: AppTextTheme.light().sectionHeader,
          unselectedLabelColor: AppColors.grey,
          unselectedLabelStyle: AppTextTheme.light().bodyLargeRegular,
          indicatorColor: AppColors.primaryLight,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.primaryLight,
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
