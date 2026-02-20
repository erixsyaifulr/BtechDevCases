import 'package:dartz/dartz.dart';

import '/core/local_storage/preferences.dart';
import '/core/local_storage/preferences_key.dart';
import '/core/network/typedef/base_result.dart';

class LoginLocalDatasource {
  Preferences preferences;
  LoginLocalDatasource({required this.preferences});

  BaseResult<void> saveToken({required String token}) async {
    await preferences.store(PreferencesKey.accessToken, token);
    return Right(null);
  }
}
