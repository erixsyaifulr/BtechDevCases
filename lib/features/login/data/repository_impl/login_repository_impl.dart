import 'package:btech_wallet_app/features/login/data/datasources/dto/request/login/login_request.dart';
import 'package:btech_wallet_app/features/login/data/datasources/login_local_datasource.dart';
import 'package:btech_wallet_app/features/login/data/datasources/login_remote_datasource.dart';
import 'package:btech_wallet_app/features/login/domain/entity/authorization/authorization.dart';
import 'package:btech_wallet_app/features/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/core/network/typedef/base_result.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource loginRemoteDatasource;
  final LoginLocalDatasource loginLocalDatasource;
  LoginRepositoryImpl({
    required this.loginRemoteDatasource,
    required this.loginLocalDatasource,
  });

  @override
  BaseResult<Authorization> login({
    required LoginRequest request,
    CancelToken? cancelToken,
  }) async {
    final result = await loginRemoteDatasource.login(
      request: request,
      cancelToken: cancelToken,
    );

    return await result.fold((failure) => Left(failure), (success) async {
      await loginLocalDatasource.saveToken(token: success.token!);
      return Right(Authorization(token: success.token));
    });
  }
}
