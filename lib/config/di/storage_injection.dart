import '/config/di/injector.dart';
import '/core/local_storage/preferences.dart';

class StorageInjection {
  static Future<void> init() async {
    getIt.registerLazySingleton<Preferences>(() => Preferences());
  }
}
