import 'package:btech_wallet_app/features/home/data/datasources/dto/response/auth_data/auth_data_response.dart';
import 'package:btech_wallet_app/features/home/data/datasources/dto/response/balance/balance_response.dart';
import 'package:btech_wallet_app/features/home/data/datasources/dto/response/transaction/transaction_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/core/network/client/api_endpoints.dart';
import '/core/network/client/dio_client.dart';
import '/core/network/exception/failure_exception.dart';
import '/core/network/typedef/base_result.dart';

class HomeRemoteDatasource {
  final DioClient dio;

  HomeRemoteDatasource({required this.dio});

  BaseResult<AuthDataResponse> me({CancelToken? cancelToken}) async {
    try {
      final response = await dio.get(ApiEndpoints.me, cancelToken: cancelToken);
      return Right(AuthDataResponse.fromJson(response.data));
    } on FailureException catch (e) {
      return Left(e);
    }
  }

  BaseResult<BalanceResponse> getBalance({CancelToken? cancelToken}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.balance,
        cancelToken: cancelToken,
      );
      return Right(BalanceResponse.fromJson(response.data));
    } on FailureException catch (e) {
      return Left(e);
    }
  }

  BaseResult<TransactionResponse> getTransaction({
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.get(
        ApiEndpoints.transferHistory,
        cancelToken: cancelToken,
      );
      return Right(TransactionResponse.fromJson(response.data));
    } on FailureException catch (e) {
      return Left(e);
    }
  }
}
