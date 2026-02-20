import 'package:dio/dio.dart';

import '/config/di/injector.dart';
import '/core/local_storage/preferences.dart';
import '/core/local_storage/preferences_key.dart';
import '../exception/api_error.dart';

class DioClient {
  final Dio dio;
  final ApiError apiError;

  DioClient({required this.dio, required this.apiError});

  Map<String, dynamic> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      headers["Content-Type"] = "application/json";
      headers["Accept"] = "application/json";

      final token = await getIt<Preferences>().read(PreferencesKey.accessToken);
      if (token != null) {
        headers["Authorization"] = "Bearer $token";
      }
      final response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      apiError.errorHandler(e);
    }
  }

  Future<dynamic> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool formData = false,
    bool urlEncoded = false,
  }) async {
    try {
      final token = await getIt<Preferences>().read(PreferencesKey.accessToken);
      if (token != null) {
        headers["Authorization"] = "Bearer $token";
        headers["Content-Type"] = "application/json";
      }

      if (urlEncoded) {
        headers["Content-Type"] = "application/x-www-form-urlencoded";
      }

      if (formData) {
        headers["Content-Type"] = "multipart/form-data";
      }
      final response = await dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      apiError.errorHandler(e);
    }
  }

  Future<dynamic> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool formData = false,
    bool urlEncoded = false,
  }) async {
    try {
      final token = await getIt<Preferences>().read(PreferencesKey.accessToken);
      if (token != null) {
        headers["Authorization"] = "Bearer $token";
        headers["Content-Type"] = "application/json";
      }

      if (urlEncoded) {
        headers["Content-Type"] = "application/x-www-form-urlencoded";
      }

      if (formData) {
        headers["Content-Type"] = "multipart/form-data";
      }
      final response = await dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      apiError.errorHandler(e);
    }
  }

  Future<dynamic> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      headers["Content-Type"] = "application/json";
      headers["Accept"] = "application/json";
      final token = await getIt<Preferences>().read(PreferencesKey.accessToken);
      if (token != null) {
        headers["Authorization"] = "Bearer $token";
      }
      final response = await dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      apiError.errorHandler(e);
    }
  }
}
