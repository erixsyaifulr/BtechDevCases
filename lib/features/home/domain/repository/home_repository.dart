import 'package:btech_wallet_app/features/home/domain/entity/auth_data/auth_data.dart';
import 'package:btech_wallet_app/features/home/domain/entity/balance/balance.dart';
import 'package:btech_wallet_app/features/home/domain/entity/transaction/transaction.dart';
import 'package:dio/dio.dart';

import '/core/network/typedef/base_result.dart';

abstract class HomeRepository {
  BaseResult<AuthData> me({CancelToken? cancelToken});
  BaseResult<Balance> getBalance({CancelToken? cancelToken});
  BaseResult<List<Transaction>> getTransaction({CancelToken? cancelToken});
}
