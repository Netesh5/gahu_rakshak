import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/core/routes/routes_generator.dart';
import 'package:gahurakshak/core/shared_prefrences/user_shared_prefrences.dart';
import 'package:gahurakshak/core/theme/custom_theme.dart';
import 'package:gahurakshak/firebase_options.dart';
import 'package:gahurakshak/splash_screen.dart';

bool? isFirstTime;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DI.init();

  isFirstTime = await UserToken(sp: DI.instance()).getIsFirstTime() ?? true;

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ne', 'NE')],
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
      onGenerateRoute: RouteGenerator.routeGenerator,
      home: const SplashScreen(),
    );
  }
}
