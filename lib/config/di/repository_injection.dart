import 'package:btech_wallet_app/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:btech_wallet_app/features/home/domain/repository/home_repository.dart';
import 'package:btech_wallet_app/features/login/data/repository_impl/login_repository_impl.dart';
import 'package:btech_wallet_app/features/login/domain/repository/login_repository.dart';
import 'package:btech_wallet_app/features/register/data/repository_impl/register_repository_impl.dart';
import 'package:btech_wallet_app/features/register/domain/repository/register_repository.dart';
import 'package:btech_wallet_app/features/splash/data/repositories_impl/splash_repository_impl.dart';
import 'package:btech_wallet_app/features/splash/domain/repositories/splash_repository.dart';
import 'package:btech_wallet_app/features/transfer/data/repositories_impl/transfer_repository_impl.dart';
import 'package:btech_wallet_app/features/transfer/domain/repository/transfer_repository.dart';

import '/config/di/injector.dart';

class RepositoryInjection {
  static void init() {
    //* Splash
    getIt.registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(splashLocalDatasource: getIt()),
    );

    //* Login
    getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(
        loginLocalDatasource: getIt(),
        loginRemoteDatasource: getIt(),
      ),
    );

    //* Register
    getIt.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(registerRemoteDatasource: getIt()),
    );

    //* Home
    getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDatasource: getIt()),
    );

    //* Transfer
    getIt.registerLazySingleton<TransferRepository>(
      () => TransferRepositoryImpl(transferRemoteDatasource: getIt()),
    );
  }
}
