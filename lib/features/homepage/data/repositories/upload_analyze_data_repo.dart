// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:gahurakshak/core/shared_prefrences/user_shared_prefrences.dart';
import 'package:gahurakshak/core/utils/snack_bar_utils.dart';
import 'package:gahurakshak/features/result/data/models/result_model.dart';

class UploadAnalyzeDataRepo {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  UserToken token;
  UploadAnalyzeDataRepo({
    required this.token,
  });
  uploadAnalyzeData(
      {required BuildContext context, required ResultModel param}) async {
    try {
      final res = await token.fetchUser();
      final _ = await firebaseFirestore
          .collection("result")
          .doc(res.uid)
          .collection("disease")
          .add(param.toMap());
    } on FirebaseException catch (e) {
      SnackBarUtils.showErrorMessage(
        context: context,
        message: e.message ?? "Something went wrong",
      );
    }
  }
}
