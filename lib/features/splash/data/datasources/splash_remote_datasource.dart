import 'package:dartz/dartz.dart';

import '/core/local_storage/preferences.dart';
import '/core/local_storage/preferences_key.dart';
import '/core/network/exception/failure_exception.dart';
import '/core/network/typedef/base_result.dart';

class SplashLocalDatasource {
  final Preferences preferences;
  SplashLocalDatasource({required this.preferences});

  BaseResult<String?> getAccessToken() async {
    final result = await preferences.read(PreferencesKey.accessToken);
    if (result != null) {
      return Right(result);
    } else {
      return Left(ServerException(message: ""));
    }
  }
}
