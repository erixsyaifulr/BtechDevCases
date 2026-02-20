import '/core/network/typedef/base_result.dart';

abstract class SplashRepository {
  BaseResult<String?> getAccessToken();
}
