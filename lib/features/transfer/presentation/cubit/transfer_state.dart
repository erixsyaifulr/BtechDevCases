part of 'transfer_cubit.dart';

@freezed
abstract class TransferState with _$TransferState {
  const factory TransferState({required ViewData<bool> transferStatus}) =
      _TransferState;
}
