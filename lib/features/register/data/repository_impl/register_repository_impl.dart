import 'package:btech_wallet_app/features/register/data/datasources/dto/request/register/register_request.dart';
import 'package:btech_wallet_app/features/register/data/datasources/register_remote_datasource.dart';
import 'package:btech_wallet_app/features/register/domain/repository/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/core/network/typedef/base_result.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDatasource registerRemoteDatasource;
  RegisterRepositoryImpl({required this.registerRemoteDatasource});

  @override
  BaseResult<void> register({
    required RegisterRequest request,
    CancelToken? cancelToken,
  }) async {
    final result = await registerRemoteDatasource.register(
      request: request,
      cancelToken: cancelToken,
    );

    return await result.fold((failure) => Left(failure), (success) async {
      return Right(success);
    });
  }
}
