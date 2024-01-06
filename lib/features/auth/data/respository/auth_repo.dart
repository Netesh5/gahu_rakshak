// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/utils/snack_bar_utils.dart';
import 'package:gahurakshak/features/auth/data/models/login_with_account_param.dart';
import 'package:gahurakshak/features/auth/data/models/register_new_account_param.dart';

class AuthRepo {
  FirebaseAuth auth = FirebaseAuth.instance;

  registerNewAccount(BuildContext c, RegisterNewAccountParam param) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: param.email, password: param.password)
          .then(
            (value) => SnackBarUtils.showSuccessMessage(
              context: c,
              message: LocaleKeys.accountCreated,
            ),
          );
    } on FirebaseAuthException catch (e) {
      SnackBarUtils.showErrorMessage(
        context: c,
        message: e.message ?? "Something went Wrong",
      );
    }
  }

  loginAccount(BuildContext c, LoginWithAccountParam param) async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: param.email, password: param.password)
          .then((value) => SnackBarUtils.showErrorMessage(
                context: c,
                message: LocaleKeys.loggedInSuccessfully,
              ));
    } on FirebaseException catch (e) {
      SnackBarUtils.showErrorMessage(
        context: c,
        message: e.message ?? "Something went Wrong",
      );
    }
  }
}
