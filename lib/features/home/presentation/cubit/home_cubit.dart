import 'package:bloc/bloc.dart';
import 'package:btech_wallet_app/core/base_state/view_data.dart';
import 'package:btech_wallet_app/features/home/domain/entity/auth_data/auth_data.dart';
import 'package:btech_wallet_app/features/home/domain/entity/balance/balance.dart';
import 'package:btech_wallet_app/features/home/domain/entity/transaction/transaction.dart';
import 'package:btech_wallet_app/features/home/domain/repository/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  CancelToken cancelToken = CancelToken();
  HomeCubit({required this.homeRepository})
    : super(
        HomeState(
          authData: ViewData.initial(),
          balance: ViewData.initial(),
          transactions: ViewData.initial(),
        ),
      );

  Future<void> initial() async {
    getAuthData();
    getBalance();
    getTransaction();
  }

  Future<void> getAuthData() async {
    emit(state.copyWith(authData: ViewData.initial()));
    final result = await homeRepository.me(cancelToken: cancelToken);
    result.fold(
      (failure) => emit(
        state.copyWith(authData: ViewData.error(message: failure.message)),
      ),
      (success) {
        emit(state.copyWith(authData: ViewData.success(data: success)));
      },
    );
  }

  Future<void> getBalance() async {
    emit(state.copyWith(balance: ViewData.initial()));
    final result = await homeRepository.getBalance(cancelToken: cancelToken);
    result.fold(
      (failure) => emit(
        state.copyWith(balance: ViewData.error(message: failure.message)),
      ),
      (success) =>
          emit(state.copyWith(balance: ViewData.success(data: success))),
    );
  }

  Future<void> getTransaction() async {
    emit(state.copyWith(transactions: ViewData.initial()));
    final result = await homeRepository.getTransaction(
      cancelToken: cancelToken,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(transactions: ViewData.error(message: failure.message)),
      ),
      (success) =>
          emit(state.copyWith(transactions: ViewData.success(data: success))),
    );
  }
}
