import 'package:btech_wallet_app/features/login/data/datasources/dto/request/login/login_request.dart';
import 'package:btech_wallet_app/features/login/domain/entity/authorization/authorization.dart';
import 'package:dio/dio.dart';

import '/core/network/typedef/base_result.dart';

abstract class LoginRepository {
  BaseResult<Authorization> login({
    required LoginRequest request,
    CancelToken? cancelToken,
  });
}
