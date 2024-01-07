// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/core/utils/snack_bar_utils.dart';
import 'package:gahurakshak/core/widgets/loading/loading_dialog.dart';
import 'package:gahurakshak/features/auth/data/models/login_with_account_param.dart';
import 'package:gahurakshak/features/auth/data/models/register_new_account_param.dart';
import 'package:gahurakshak/features/auth/data/models/user_param.dart';
import 'package:gahurakshak/features/auth/data/respository/exception_handler.dart';
import 'package:gahurakshak/features/auth/data/respository/firestore_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo with ChangeNotifier {
  FirestoreRepo firestoreRepo;
  FirebaseAuth auth = FirebaseAuth.instance;
  AuthRepo({
    required this.firestoreRepo,
  });
  User? user;
  Future<void> registerNewAccount(
      BuildContext context, RegisterNewAccountParam param) async {
    showLoadingDialog(context, true);

    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
              email: param.email.trim(), password: param.password.trim());
      final _ = await firestoreRepo
          .saveUserInfo(
        context: context,
        param: param,
        userParam: UserParam(
          user: userCredential.user,
        ),
      )
          .then(
        (value) async {
          showLoadingDialog(context, false);
          Navigator.pop(context);
          SnackBarUtils.showSuccessMessage(
            context: context,
            message: LocaleKeys.accountCreated.tr(),
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
          SnackBarUtils.showSuccessMessage(
            context: context,
            message: LocaleKeys.loggedInSuccessfully.tr(),
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
        message: getMessageFromErrorCode(e),
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

  Future<void> loginWithGoogle(BuildContext context) async {
    showLoadingDialog(context, true);
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication authentication =
            await googleSignInAccount.authentication;

        final OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: authentication.accessToken,
            idToken: authentication.idToken);

        await auth.signInWithCredential(credential).then((value) {
          showLoadingDialog(context, false);
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homepage, (route) => false);
        });
      } else {
        showLoadingDialog(context, false);
        Navigator.pop(context);
        return;
      }
    } on FirebaseException catch (e) {
      showLoadingDialog(context, false);
      Navigator.pop(context);

      SnackBarUtils.showErrorMessage(
        context: context,
        message: getMessageFromErrorCode(e),
      );
    }
    notifyListeners();
  }
}
