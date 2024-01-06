import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/core/routes/routes_generator.dart';
import 'package:gahurakshak/core/theme/custom_theme.dart';
import 'package:gahurakshak/features/auth/presentation/pages/login_view.dart';
import 'package:gahurakshak/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('np', 'NP')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: Routes.login,
      onGenerateRoute: RouteGenerator.routeGenerator,
      home: const LoginView(),
    );
  }
}
