import 'package:btech_wallet_app/features/register/data/datasources/dto/request/register/register_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/core/network/client/api_endpoints.dart';
import '/core/network/client/dio_client.dart';
import '/core/network/exception/failure_exception.dart';
import '/core/network/typedef/base_result.dart';

class RegisterRemoteDatasource {
  final DioClient dio;

  RegisterRemoteDatasource({required this.dio});

  BaseResult<void> register({
    required RegisterRequest request,
    CancelToken? cancelToken,
  }) async {
    try {
      await dio.post(
        ApiEndpoints.register,
        data: request.toJson(),
        cancelToken: cancelToken,
      );
      return Right(null);
    } on FailureException catch (e) {
      return Left(e);
    }
  }
}
