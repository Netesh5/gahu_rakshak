import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      splash: "assets/images/Ghau Rakshak.png",
      backgroundColor: AppColors.backgroundColor,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: width * 0.7,
      nextScreen: Wrapper(
        userToken: DI.instance(),
      ),
    );
  }
}
