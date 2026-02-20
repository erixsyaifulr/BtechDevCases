import 'dart:io';

import 'package:dio/dio.dart';

import 'failure_exception.dart';

class ApiError {
  ApiError();

  void errorHandler(DioException e) {
    if (e.response?.data != null && e.response?.data is Map) {
      final data = e.response!.data as Map;
      final msg = data['message']?.toString() ?? e.message ?? "Unknown Error";
      throw ServerException(response: e.response, message: msg);
    }

    if (e.type == DioExceptionType.connectionError ||
        e.error is SocketException) {
      throw NetworkException(message: "Internet Error");
    }

    throw UnknownException(message: "Unknown Error");
  }
}
