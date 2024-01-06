import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/features/auth/data/respository/auth_repo.dart';

class AuthInjector {
  static init() {
    DI.instance.registerLazySingleton<AuthRepo>(
      () => AuthRepo(
        firestoreRepo: DI.instance(),
      ),
    );
  }
}
