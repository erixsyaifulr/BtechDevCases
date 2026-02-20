import 'package:btech_wallet_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:btech_wallet_app/features/login/data/datasources/login_local_datasource.dart';
import 'package:btech_wallet_app/features/login/data/datasources/login_remote_datasource.dart';
import 'package:btech_wallet_app/features/register/data/datasources/register_remote_datasource.dart';
import 'package:btech_wallet_app/features/splash/data/datasources/splash_remote_datasource.dart';
import 'package:btech_wallet_app/features/transfer/data/datasources/transfer_remote_datasource.dart';

import '/config/di/injector.dart';

class DatasourceInjection {
  static void init() {
    //* Splash
    getIt.registerLazySingleton<SplashLocalDatasource>(
      () => SplashLocalDatasource(preferences: getIt()),
    );

    //* Login
    getIt.registerLazySingleton<LoginLocalDatasource>(
      () => LoginLocalDatasource(preferences: getIt()),
    );
    getIt.registerLazySingleton<LoginRemoteDatasource>(
      () => LoginRemoteDatasource(dio: getIt()),
    );

    //* Register
    getIt.registerLazySingleton<RegisterRemoteDatasource>(
      () => RegisterRemoteDatasource(dio: getIt()),
    );

    //* Home
    getIt.registerLazySingleton<HomeRemoteDatasource>(
      () => HomeRemoteDatasource(dio: getIt()),
    );

    //* Transfer
    getIt.registerLazySingleton<TransferRemoteDatasource>(
      () => TransferRemoteDatasource(dio: getIt()),
    );
  }
}
