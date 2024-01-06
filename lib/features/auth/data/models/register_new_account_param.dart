class RegisterNewAccountParam {
  String fullname;
  String email;
  String password;
  String phoneNo;

  RegisterNewAccountParam({
    required this.fullname,
    required this.email,
    required this.password,
    required this.phoneNo,
  });

  toJson() {
    return <String, String>{
      "fullname": fullname,
      "email": email,
      "password": password,
      "phoneNo": phoneNo
    };
  }
}
