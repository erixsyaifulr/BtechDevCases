import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_request.freezed.dart';
part 'transfer_request.g.dart';

@freezed
abstract class TransferRequest with _$TransferRequest {
  const factory TransferRequest({
    String? recipient,
    int? amount,
    String? notes,
  }) = _TransferRequest;

  factory TransferRequest.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestFromJson(json);
}
