import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/features/auth/data/respository/firestore_repo.dart';

class FireStoreInjector {
  static init() {
    DI.instance.registerLazySingleton<FirestoreRepo>(() => FirestoreRepo());
  }
}
