import 'package:flutter/material.dart';
import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/features/auth/data/respository/auth_repo.dart';
import 'package:gahurakshak/features/profile/presentation/widgets/profile_body.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthRepo(
        firestoreRepo: DI.instance(),
        userSharedPrefrences: DI.instance(),
      ),
      child: ProfileBody(
        userToken: DI.instance(),
      ),
    );
  }
}
