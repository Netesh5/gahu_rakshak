import 'package:gahurakshak/core/models/user_credential_param.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserToken {
  final SharedPreferences sp;
  UserToken({
    required this.sp,
  });
  Future<void> saveUserToken(UserCredentialParam param) async {
    sp.setString("token", param.uid);
  }

  Future<String?> fetchUserToken() async {
    final token = sp.getString("token");
    return token!;
  }
}
