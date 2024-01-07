import 'package:flutter/material.dart';
import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/features/auth/data/respository/auth_repo.dart';
import 'package:gahurakshak/features/auth/presentation/widget/forget_password_body.dart';
import 'package:provider/provider.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthRepo(firestoreRepo: DI.instance()),
      child: ForgetPasswordBody(),
    );
  }
}
