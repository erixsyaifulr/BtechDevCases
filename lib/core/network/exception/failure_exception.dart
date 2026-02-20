import 'package:dio/dio.dart';

class FailureException implements Exception {
  final String? message;
  Response<dynamic>? response;

  FailureException({
    this.message,
    this.response,
  });

  @override
  String toString() {
    return 'FailureException{message: $message, response: $response}';
  }
}

class NetworkException extends FailureException {
  NetworkException({super.message});
}

class ServerException extends FailureException {
  ServerException({super.message, super.response});
}

class UnknownException extends FailureException {
  UnknownException({super.message});
}

extension ExceptionFailureX on FailureException {
  bool get isNetworkException => this is NetworkException;
  bool get isServerException => this is ServerException;
  bool get isUnknownException => this is UnknownException;
}
