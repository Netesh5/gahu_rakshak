import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/core/shared_prefrences/user_shared_prefrences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesInjector {
  static init() async {
    DI.instance.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance(),
    );
    await DI.instance.isReady<SharedPreferences>();
    DI.instance.registerLazySingleton<UserToken>(
      () => UserToken(
        sp: DI.instance(),
      ),
    );
  }
}
