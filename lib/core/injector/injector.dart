import 'package:gahurakshak/core/injector/auth_injector.dart';
import 'package:gahurakshak/core/injector/firestore_injector.dart';
import 'package:get_it/get_it.dart';

class DI {
  static final instance = GetIt.instance;
  static Future<void> init() async {
    AuthInjector.init();
    FireStoreInjector.init();
  }
}
