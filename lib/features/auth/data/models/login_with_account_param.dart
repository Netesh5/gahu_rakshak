class LoginWithAccountParam {
  String email;
  String password;
  LoginWithAccountParam({
    required this.email,
    required this.password,
  });

  toJson() {
    return <String, String>{
      "email": email,
      "password": password,
    };
  }
}
