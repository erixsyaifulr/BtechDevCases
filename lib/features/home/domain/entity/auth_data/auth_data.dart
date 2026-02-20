import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_data.freezed.dart';
part 'auth_data.g.dart';

@freezed
abstract class AuthData with _$AuthData {
  const factory AuthData({String? data}) = _AuthData;

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);
}
