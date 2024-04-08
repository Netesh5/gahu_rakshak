import 'package:flutter/material.dart';
import 'package:gahurakshak/core/pages/routes_not_found.dart';
import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/features/auth/presentation/pages/forget_password_view.dart';
import 'package:gahurakshak/features/auth/presentation/pages/login_view.dart';
import 'package:gahurakshak/features/auth/presentation/pages/signup_view.dart';
import 'package:gahurakshak/features/board/presentation/pages/board_view.dart';
import 'package:gahurakshak/features/dashboard/presenatation/data/models/ml_data_models.dart';
import 'package:gahurakshak/features/dashboard/presenatation/pages/model_detail_view.dart';
import 'package:gahurakshak/features/fertilizer_calculator/presentation/pages/fertilizer_calculator_view.dart';
import 'package:gahurakshak/features/history/presentation/pages/history_detail_view.dart';
import 'package:gahurakshak/features/homepage/presentation/pages/homepage_view.dart';
import 'package:gahurakshak/features/pets_diseases/data/models/disease_detail_param.dart';
import 'package:gahurakshak/features/pets_diseases/presentation/pages/disease_detail_view.dart';
import 'package:gahurakshak/features/pets_diseases/presentation/pages/pets_disease_view.dart';
import 'package:gahurakshak/features/profile/presentation/pages/profile_view.dart';
import 'package:gahurakshak/features/result/data/models/result_model.dart';
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
            param: setting.arguments as ResultModel,
          ),
          type: PageTransitionType.fade,
        );
      case Routes.board:
        return PageTransition(
          child: const BoardView(),
          type: PageTransitionType.fade,
        );
      case Routes.result:
        return PageTransition(
          child: ResultView(
            param: setting.arguments as ResultModel,
          ),
          type: PageTransitionType.fade,
        );
      case Routes.fertilizerCalculator:
        return PageTransition(
          child: const FertilizerCalculatorView(),
          type: PageTransitionType.fade,
        );
      case Routes.diseases:
        return PageTransition(
          child: const PetsAndDiseasesView(),
          type: PageTransitionType.fade,
        );
      case Routes.diseasesDetail:
        return PageTransition(
          child:
              DiseaseDetailView(param: setting.arguments as DiseaseDetailParam),
          type: PageTransitionType.fade,
        );
      case Routes.modelDetail:
        return PageTransition(
          child: ModelDetailView(
              dataModel: setting.arguments as List<MLDataModel>),
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
