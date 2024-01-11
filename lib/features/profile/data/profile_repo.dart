import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileRepo {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Future<void> saveUserInfo({required String name}) async {
  //   try {
  //     final _ = await firebaseFirestore
  //         .collection("profile")
  //         .doc()
  //         .set({"Full Name": name});
  //   } on FirebaseException catch (e) {
  //     print(e);
  //   }
  // }
}
