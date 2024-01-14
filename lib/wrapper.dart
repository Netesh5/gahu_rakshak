import 'package:flutter/material.dart';
import 'package:gahurakshak/core/models/user_model.dart';

import 'package:gahurakshak/core/shared_prefrences/user_shared_prefrences.dart';
import 'package:gahurakshak/features/auth/presentation/pages/login_view.dart';
import 'package:gahurakshak/features/dashboard/presentation/pages/dashboard_view.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({
    super.key,
    required this.userSharedPrefrences,
  });
  final UserToken userSharedPrefrences;

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  UserModel? token;
  void getUser() async {
    token = await widget.userSharedPrefrences.fetchUser();
    setState(() {});
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (token?.uid != null) {
      return const DashboardView();
    } else {
      return const LoginView();
    }
  }
}
