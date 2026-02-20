import '/config/di/injector.dart';
import '/config/router/app_router.dart';

class RouteInjection {
  static void init() {
    getIt.registerSingleton<AppRouter>(AppRouter());
  }
}
