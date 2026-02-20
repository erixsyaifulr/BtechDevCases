import 'package:btech_wallet_app/features/splash/data/datasources/splash_remote_datasource.dart';
import 'package:btech_wallet_app/features/splash/domain/repositories/splash_repository.dart';
import 'package:dartz/dartz.dart';

import '/core/network/typedef/base_result.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashLocalDatasource splashLocalDatasource;
  SplashRepositoryImpl({required this.splashLocalDatasource});

  @override
  BaseResult<String?> getAccessToken() async {
    final result = await splashLocalDatasource.getAccessToken();
    return result.fold((failure) => Left(failure), (token) => Right(token));
  }
}
