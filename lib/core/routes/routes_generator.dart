import 'package:flutter/material.dart';
import 'package:gahurakshak/core/pages/routes_not_found.dart';
import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/features/auth/presentation/pages/login_view.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> routeGenerator(RouteSettings setting) {
    switch (setting.name) {
      case Routes.login:
        return PageTransition(
          child: const LoginView(),
          type: PageTransitionType.fade,
        );

      default:
        return PageTransition(
          child: const RouteNotFound(),
          type: PageTransitionType.fade,
        );
    }
  }
}
