import 'package:btech_wallet_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:btech_wallet_app/features/home/domain/entity/auth_data/auth_data.dart';
import 'package:btech_wallet_app/features/home/domain/entity/balance/balance.dart';
import 'package:btech_wallet_app/features/home/domain/entity/transaction/transaction.dart';
import 'package:btech_wallet_app/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/core/network/typedef/base_result.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;
  HomeRepositoryImpl({required this.homeRemoteDatasource});

  @override
  BaseResult<AuthData> me({CancelToken? cancelToken}) async {
    final result = await homeRemoteDatasource.me(cancelToken: cancelToken);

    return await result.fold((failure) => Left(failure), (success) async {
      return Right(AuthData(data: success.data));
    });
  }

  @override
  BaseResult<Balance> getBalance({CancelToken? cancelToken}) async {
    final result = await homeRemoteDatasource.getBalance(
      cancelToken: cancelToken,
    );

    return await result.fold((failure) => Left(failure), (success) async {
      return Right(Balance(balance: success.balance));
    });
  }

  @override
  BaseResult<List<Transaction>> getTransaction({
    CancelToken? cancelToken,
  }) async {
    final result = await homeRemoteDatasource.getTransaction(
      cancelToken: cancelToken,
    );
    return await result.fold((failure) => Left(failure), (success) async {
      return Right(success.transactions ?? []);
    });
  }
}
