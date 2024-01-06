// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/core/utils/snack_bar_utils.dart';
import 'package:gahurakshak/core/widgets/loading/loading_dialog.dart';
import 'package:gahurakshak/features/auth/data/models/login_with_account_param.dart';
import 'package:gahurakshak/features/auth/data/models/register_new_account_param.dart';

class AuthRepo with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> registerNewAccount(
      BuildContext context, RegisterNewAccountParam param) async {
    showLoadingDialog(context, true);

    try {
      final _ = await auth
          .createUserWithEmailAndPassword(
              email: param.email.trim(), password: param.password.trim())
          .then(
        (value) {
          showLoadingDialog(context, false);
          Navigator.pop(context);
          SnackBarUtils.showSuccessMessage(
            context: context,
            message: LocaleKeys.accountCreated,
          );
          Navigator.of(context).pop();
        },
      );
    } on FirebaseAuthException catch (e) {
      showLoadingDialog(context, false);
      Navigator.pop(context);
      SnackBarUtils.showErrorMessage(
        context: context,
        message: e.message ?? "Something went Wrong",
      );
    }
    notifyListeners();
  }

  Future<void> loginAccount(
      BuildContext context, LoginWithAccountParam param) async {
    showLoadingDialog(context, true);
    try {
      final _ = await auth
          .signInWithEmailAndPassword(
              email: param.email.trim(), password: param.password.trim())
          .then(
        (value) {
          showLoadingDialog(context, false);
          Navigator.pop(context);
          SnackBarUtils.showErrorMessage(
            context: context,
            message: LocaleKeys.loggedInSuccessfully,
          );
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.homepage, (route) => false);
        },
      );
    } on FirebaseException catch (e) {
      showLoadingDialog(context, false);
      Navigator.pop(context);
      SnackBarUtils.showErrorMessage(
        context: context,
        message: e.message ?? "Something went Wrong",
      );
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    final user = auth.currentUser;
    if (user != null) {
      await auth.signOut();
    }
    notifyListeners();
  }
}
