import 'package:gahurakshak/core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserToken {
  final SharedPreferences sp;
  UserToken({
    required this.sp,
  });
  Future<void> saveUser(UserModel param) async {
    sp.setString("token", param.toJson());
  }

  Future<UserModel> fetchUser() async {
    final user = sp.getString("token");
    UserModel userValue = UserModel.fromJson(user!);
    return userValue;
  }
}
