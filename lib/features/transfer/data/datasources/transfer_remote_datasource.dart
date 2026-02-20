import 'package:btech_wallet_app/features/transfer/data/datasources/dto/request/transfer/transfer_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/core/network/client/api_endpoints.dart';
import '/core/network/client/dio_client.dart';
import '/core/network/exception/failure_exception.dart';
import '/core/network/typedef/base_result.dart';

class TransferRemoteDatasource {
  final DioClient dio;

  TransferRemoteDatasource({required this.dio});

  BaseResult<void> transfer({
    required TransferRequest request,
    CancelToken? cancelToken,
  }) async {
    try {
      await dio.post(
        ApiEndpoints.transfer,
        data: request.toJson(),
        cancelToken: cancelToken,
      );
      return Right(null);
    } on FailureException catch (e) {
      return Left(e);
    }
  }
}
