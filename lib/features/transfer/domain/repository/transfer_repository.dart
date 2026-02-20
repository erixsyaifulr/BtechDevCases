import 'package:btech_wallet_app/features/transfer/data/datasources/dto/request/transfer/transfer_request.dart';
import 'package:dio/dio.dart';

import '/core/network/typedef/base_result.dart';

abstract class TransferRepository {
  BaseResult<void> transfer({
    required TransferRequest request,
    CancelToken? cancelToken,
  });
}
