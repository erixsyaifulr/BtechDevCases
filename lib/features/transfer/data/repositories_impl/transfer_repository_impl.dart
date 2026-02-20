import 'package:btech_wallet_app/features/transfer/data/datasources/dto/request/transfer/transfer_request.dart';
import 'package:btech_wallet_app/features/transfer/data/datasources/transfer_remote_datasource.dart';
import 'package:btech_wallet_app/features/transfer/domain/repository/transfer_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/core/network/typedef/base_result.dart';

class TransferRepositoryImpl implements TransferRepository {
  final TransferRemoteDatasource transferRemoteDatasource;
  TransferRepositoryImpl({required this.transferRemoteDatasource});

  @override
  BaseResult<void> transfer({
    required TransferRequest request,
    CancelToken? cancelToken,
  }) async {
    final result = await transferRemoteDatasource.transfer(
      request: request,
      cancelToken: cancelToken,
    );

    return await result.fold((failure) => Left(failure), (success) async {
      return Right(success);
    });
  }
}
