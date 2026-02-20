import 'package:btech_wallet_app/features/home/domain/entity/transaction/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_response.freezed.dart';
part 'transaction_response.g.dart';

@freezed
abstract class TransactionResponse with _$TransactionResponse {
  const factory TransactionResponse({List<Transaction>? transactions}) =
      _TransactionResponse;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);
}
