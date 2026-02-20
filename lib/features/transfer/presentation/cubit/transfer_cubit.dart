import 'package:bloc/bloc.dart';
import 'package:btech_wallet_app/features/transfer/data/datasources/dto/request/transfer/transfer_request.dart';
import 'package:btech_wallet_app/features/transfer/domain/repository/transfer_repository.dart';
import 'package:btech_wallet_app/shared/constant/label.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/base_state/view_data.dart';

part 'transfer_cubit.freezed.dart';
part 'transfer_state.dart';

class TransferCubit extends Cubit<TransferState> {
  final TransferRepository transferRepository;
  CancelToken cancelToken = CancelToken();
  TransferCubit({required this.transferRepository})
    : super(TransferState(transferStatus: ViewData.initial()));

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }

  Future<void> transfer({
    required String email,
    required String amount,
    required String notes,
  }) async {
    emit(state.copyWith(transferStatus: ViewData.loading()));
    if (email.isEmpty || amount.isEmpty) {
      return emit(
        state.copyWith(transferStatus: ViewData.error(message: Label.fillAll)),
      );
    } else {
      final result = await transferRepository.transfer(
        request: TransferRequest(
          recipient: email,
          amount: int.parse(amount),
          notes: notes,
        ),
        cancelToken: cancelToken,
      );

      if (isClosed) return;

      result.fold(
        (l) => emit(
          state.copyWith(transferStatus: ViewData.error(message: l.message)),
        ),
        (r) =>
            emit(state.copyWith(transferStatus: ViewData.success(data: true))),
      );
    }
  }
}
