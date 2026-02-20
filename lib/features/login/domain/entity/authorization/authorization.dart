import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorization.freezed.dart';
part 'authorization.g.dart';

@freezed
abstract class Authorization with _$Authorization {
  const factory Authorization({String? token}) = _Authorization;

  factory Authorization.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFromJson(json);
}
