import 'dart:async';

import 'package:btech_wallet_app/config/di/injector.dart';
import 'package:btech_wallet_app/config/router/app_router.dart';
import 'package:btech_wallet_app/core/local_storage/preferences.dart';
import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 &&
        !err.requestOptions.uri.toString().contains("login")) {
      await logout();
      return;
    }

    handler.next(err);
  }

  Future<void> logout() async {
    await getIt<Preferences>().clear();
    await getIt<AppRouter>().pushAndPopUntil(
      LoginRoute(),
      predicate: (route) => false,
    );
  }
}
