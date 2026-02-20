import 'dart:developer';

import 'package:btech_wallet_app/core/network/client/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '/config/di/injector.dart';
import '/config/env/env_config.dart';
import '/core/network/client/dio_client.dart';
import '/core/network/exception/api_error.dart';

class ClientInjection {
  static void init() {
    getIt.registerLazySingleton<DioClient>(
      () => DioClient(
        apiError: ApiError(),
        dio:
            Dio(
                BaseOptions(
                  baseUrl: EnvConfig.baseUrl,
                  connectTimeout: const Duration(seconds: 30),
                  receiveTimeout: const Duration(seconds: 30),
                  contentType: Headers.jsonContentType,
                  responseType: ResponseType.json,
                ),
              )
              ..interceptors.addAll([
                DioInterceptor(),
                PrettyDioLogger(
                  requestHeader: true,
                  requestBody: true,
                  responseBody: true,
                  responseHeader: false,
                  compact: true,
                  maxWidth: 120,
                  logPrint: (obj) {
                    if (kDebugMode) log(obj.toString(), name: 'DIO');
                  },
                ),
              ]),
      ),
    );
  }
}
