import 'package:btech_wallet_app/features/register/data/datasources/dto/request/register/register_request.dart';
import 'package:dio/dio.dart';

import '/core/network/typedef/base_result.dart';

abstract class RegisterRepository {
  BaseResult<void> register({
    required RegisterRequest request,
    CancelToken? cancelToken,
  });
}
