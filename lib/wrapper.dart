import 'package:flutter/material.dart';
import 'package:gahurakshak/core/models/user_model.dart';

import 'package:gahurakshak/core/shared_prefrences/user_shared_prefrences.dart';
import 'package:gahurakshak/features/auth/presentation/pages/login_view.dart';
import 'package:gahurakshak/features/board/presentation/pages/board_view.dart';
import 'package:gahurakshak/features/select_langauage/pages/select_language_view.dart';
import 'package:gahurakshak/main.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({
    super.key,
    required this.userToken,
  });
  final UserToken userToken;

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  UserModel? token;

  void getUser() async {
    token = await widget.userToken.fetchUser();
    setState(() {});
  }

  @override
  void initState() {
    getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstTime!) {
      return const SelectLanguageView();
    } else {
      if (token?.uid != null) {
        return const BoardView();
      } else {
        return const LoginView();
      }
    }
  }
}
