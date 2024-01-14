import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/features/auth/data/respository/firestore_repo.dart';
import 'package:gahurakshak/features/homepage/data/repositories/upload_analyze_data_repo.dart';
import 'package:gahurakshak/features/result/data/respository/upload_image.dart';

class FireStoreInjector {
  static init() {
    DI.instance.registerLazySingleton<FirestoreRepo>(() => FirestoreRepo());

    DI.instance.registerLazySingleton<UploadImage>(() => UploadImage());
    DI.instance.registerLazySingleton<UploadAnalyzeDataRepo>(
      () => UploadAnalyzeDataRepo(
        token: DI.instance(),
      ),
    );
  }
}
