import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    String? id,
    String? senderId,
    String? recipientId,
    int? amount,
    String? notes,
    String? createdAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
