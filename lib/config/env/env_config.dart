import 'env.dart';

enum EnvConfigEnum { development, staging, production }

class EnvConfig {
  static String baseUrl = Env.baseUrl;

  static String get appEnv {
    switch (Env.environment) {
      case "dev":
        return EnvConfigEnum.development.name;
      case "stag":
        return EnvConfigEnum.staging.name;
      case "prod":
        return EnvConfigEnum.production.name;
      default:
        return "dev";
    }
  }

  static bool get isDevelopment {
    switch (Env.environment) {
      case "prod":
        return false;
      default:
        return true;
    }
  }
}
