import 'package:flutter/material.dart';
import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/features/auth/data/respository/auth_repo.dart';
import 'package:gahurakshak/features/auth/presentation/widget/signup_body.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthRepo(
        firestoreRepo: DI.instance(),
      ),
      child: SignupBody(),
    );
  }
}
