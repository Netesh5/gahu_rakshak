class UserCredentialParam {
  String uid;

  UserCredentialParam({
    required this.uid,
  });

  toMap() {
    return <String, String>{
      "uid": uid,
    };
  }
}
