import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_data_response.freezed.dart';
part 'auth_data_response.g.dart';

@freezed
abstract class AuthDataResponse with _$AuthDataResponse {
  const factory AuthDataResponse({String? data}) = _AuthDataResponse;

  factory AuthDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthDataResponseFromJson(json);
}
