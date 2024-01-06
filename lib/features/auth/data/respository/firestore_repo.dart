// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/utils/snack_bar_utils.dart';

import 'package:gahurakshak/features/auth/data/models/register_new_account_param.dart';
import 'package:gahurakshak/features/auth/data/models/user_param.dart';

class FirestoreRepo {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> saveUserInfo({
    required BuildContext context,
    required RegisterNewAccountParam param,
    required UserParam userParam,
  }) async {
    try {
      final _ = await firebaseFirestore
          .collection("users")
          .doc(userParam.user?.uid)
          .set(param.toJson());
    } on FirebaseException catch (e) {
      SnackBarUtils.showErrorMessage(
          context: context, message: e.message ?? "Something went wrong");
    }
  }
}
