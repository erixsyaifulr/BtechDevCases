import 'package:btech_wallet_app/features/login/data/datasources/dto/request/login/login_request.dart';
import 'package:btech_wallet_app/features/login/data/datasources/dto/response/login/login_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/core/network/client/api_endpoints.dart';
import '/core/network/client/dio_client.dart';
import '/core/network/exception/failure_exception.dart';
import '/core/network/typedef/base_result.dart';

class LoginRemoteDatasource {
  final DioClient dio;

  LoginRemoteDatasource({required this.dio});

  BaseResult<LoginResponse> login({
    required LoginRequest request,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: request.toJson(),
        cancelToken: cancelToken,
      );
      return Right(LoginResponse.fromJson(response.data));
    } on FailureException catch (e) {
      return Left(e);
    }
  }
}
