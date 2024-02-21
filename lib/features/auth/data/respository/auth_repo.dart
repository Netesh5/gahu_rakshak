// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';

import 'package:gahurakshak/core/models/user_model.dart';
import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/core/shared_prefrences/user_shared_prefrences.dart';
import 'package:gahurakshak/core/utils/snack_bar_utils.dart';
import 'package:gahurakshak/core/widgets/loading/loading_dialog.dart';
import 'package:gahurakshak/features/auth/data/models/forget_password_param.dart';
import 'package:gahurakshak/features/auth/data/models/login_with_account_param.dart';
import 'package:gahurakshak/features/auth/data/models/register_new_account_param.dart';
import 'package:gahurakshak/features/auth/data/models/user_param.dart';
import 'package:gahurakshak/features/auth/data/respository/exception_handler.dart';
import 'package:gahurakshak/features/auth/data/respository/firestore_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo with ChangeNotifier {
  FirestoreRepo firestoreRepo;
  FirebaseAuth auth = FirebaseAuth.instance;
  UserToken userSharedPrefrences;
  AuthRepo({
    required this.firestoreRepo,
    required this.userSharedPrefrences,
  });
  User? user;
  UserCredential? userCredential;
  Stream<User?> get authState {
    return auth.authStateChanges();
  }

  Future<void> registerNewAccount(
      BuildContext context, RegisterNewAccountParam param) async {
    showLoadingDialog(context, true);

    try {
      userCredential = await auth
          .createUserWithEmailAndPassword(
        email: param.email.trim(),
        password: param.password.trim(),
      )
          .then((value) async {
        await value.user?.updateDisplayName(param.fullname);
        return value;
      });
      final _ = await firestoreRepo
          .saveUserInfo(
        context: context,
        param: param,
        userParam: UserParam(
          user: userCredential?.user,
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
      userCredential = await auth
          .signInWithEmailAndPassword(
        email: param.email.trim(),
        password: param.password.trim(),
      )
          .then(
        (value) async {
          await userSharedPrefrences.saveUser(
            UserModel(
              displayName: value.user?.displayName ?? "",
              email: value.user?.email ?? "",
              uid: value.user?.uid ?? "",
              token: value.user?.refreshToken ?? "",
              photoUrl: "",
            ),
          );
          showLoadingDialog(context, false);
          Navigator.pop(context);
          SnackBarUtils.showSuccessMessage(
            context: context,
            message: LocaleKeys.loggedInSuccessfully.tr(),
          );
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.board, (route) => false);
          return value;
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

  Future<void> signOut(BuildContext context) async {
    showLoadingDialog(context, true);
    user = auth.currentUser;
    if (user != null) {
      await auth.signOut().then((value) async {
        await userSharedPrefrences.removeUser();

        Navigator.of(context)
            .pushNamedAndRemoveUntil(Routes.login, (route) => false);
        showLoadingDialog(context, false);
      });
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

        userCredential = await auth.signInWithCredential(credential).then(
          (value) async {
            await userSharedPrefrences.saveUser(
              UserModel(
                displayName: value.user?.displayName ?? "",
                email: value.user?.email ?? "",
                photoUrl: value.user?.photoURL ?? "",
                uid: value.user?.uid ?? "",
                token: value.user?.refreshToken ?? "",
              ),
            );
            showLoadingDialog(context, false);
            Navigator.pop(context);
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.board, (route) => false);
            SnackBarUtils.showSuccessMessage(
              context: context,
              message: LocaleKeys.loggedInSuccessfully.tr(),
            );
            notifyListeners();
            return value;
          },
        );
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

  Future<void> resetPassword(
      BuildContext context, ForgetPasswordParam param) async {
    showLoadingDialog(context, true);
    try {
      final _ = await auth.sendPasswordResetEmail(email: param.email);
      showLoadingDialog(context, false);
      Navigator.pop(context);
      Navigator.pop(context);
      SnackBarUtils.showSuccessMessage(
        context: context,
        message: LocaleKeys.resetPasswordLinkSentSuccessfully.tr(),
      );
    } on FirebaseException catch (e) {
      showLoadingDialog(context, false);
      Navigator.pop(context);
      SnackBarUtils.showErrorMessage(
        context: context,
        message: e.message ?? "Something Went wrong",
      );
    }
    notifyListeners();
  }
}
