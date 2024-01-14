import 'package:flutter/material.dart';
import 'package:gahurakshak/core/pages/routes_not_found.dart';
import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/features/auth/presentation/pages/forget_password_view.dart';
import 'package:gahurakshak/features/auth/presentation/pages/login_view.dart';
import 'package:gahurakshak/features/auth/presentation/pages/signup_view.dart';
import 'package:gahurakshak/features/dashboard/presentation/pages/dashboard_view.dart';
import 'package:gahurakshak/features/history/presentation/pages/history_detail_view.dart';
import 'package:gahurakshak/features/homepage/presentation/pages/homepage_view.dart';
import 'package:gahurakshak/features/profile/presentation/pages/profile_view.dart';
import 'package:gahurakshak/features/result/presentation/pages/result_view.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> routeGenerator(RouteSettings setting) {
    switch (setting.name) {
      case Routes.login:
        return PageTransition(
          child: const LoginView(),
          type: PageTransitionType.fade,
        );
      case Routes.signup:
        return PageTransition(
          child: const SignupView(),
          type: PageTransitionType.fade,
        );
      case Routes.forgetPassword:
        return PageTransition(
          child: const ForgetPasswordView(),
          type: PageTransitionType.fade,
        );
      case Routes.homepage:
        return PageTransition(
          child: const HomePageView(),
          type: PageTransitionType.fade,
        );
      case Routes.profile:
        return PageTransition(
          child: const ProfileView(),
          type: PageTransitionType.fade,
        );

      case Routes.historyDetail:
        return PageTransition(
          child: HistoryDetailView(
            index: setting.arguments as int,
          ),
          type: PageTransitionType.fade,
        );
      case Routes.dashboard:
        return PageTransition(
          child: const DashboardView(),
          type: PageTransitionType.fade,
        );
      case Routes.result:
        return PageTransition(
          child: ResultView(imagePath: setting.arguments as String),
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
