import 'package:flutter/material.dart';
import 'package:gahurakshak/core/pages/routes_not_found.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> routeGenerator(RouteSettings setting) {
    switch (setting.name) {
      // case Routes.splash:
      //   return PageTransition(
      //     child: const SplashView(),
      //     type: PageTransitionType.fade,
      //   );
      // case Routes.login:
      //   return PageTransition(
      //     child: const LoginView(),
      //     type: PageTransitionType.fade,
      //   );
      // case Routes.dashboard:
      //   return PageTransition(
      //     child: const DashboardView(),
      //     type: PageTransitionType.fade,
      //   );
      default:
        return PageTransition(
          child: const RouteNotFound(),
          type: PageTransitionType.fade,
        );
    }
  }
}
