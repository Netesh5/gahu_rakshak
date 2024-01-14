// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:gahurakshak/core/shared_prefrences/user_shared_prefrences.dart';

class FetchResultDetail {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  UserToken userToken;
  FetchResultDetail({
    required this.userToken,
  });
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchResultDetail() async* {
    final res = await userToken.fetchUser();

    yield* firebaseFirestore
        .collection("result")
        .doc(res.uid)
        .collection("disease")
        .snapshots();
  }
}
