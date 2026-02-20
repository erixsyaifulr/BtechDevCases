import 'package:bloc/bloc.dart';
import 'package:btech_wallet_app/features/login/data/datasources/dto/request/login/login_request.dart';
import 'package:btech_wallet_app/features/login/domain/repository/login_repository.dart';
import 'package:btech_wallet_app/shared/constant/label.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/base_state/view_data.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  CancelToken cancelToken = CancelToken();
  LoginCubit({required this.loginRepository})
    : super(
        LoginState(obsecurePassword: false, loginStatus: ViewData.initial()),
      );

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }

  void showPassword() {
    emit(
      state.copyWith(
        obsecurePassword: !state.obsecurePassword,
        loginStatus: ViewData.initial(),
      ),
    );
  }

  Future<void> submitLogin({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(loginStatus: ViewData.loading()));
    if (email.isEmpty || password.isEmpty) {
      return emit(
        state.copyWith(loginStatus: ViewData.error(message: Label.fillAll)),
      );
    } else {
      final result = await loginRepository.login(
        request: LoginRequest(email: email, password: password),
        cancelToken: cancelToken,
      );

      if (isClosed) return;

      result.fold(
        (l) => emit(
          state.copyWith(loginStatus: ViewData.error(message: l.message)),
        ),
        (r) {
          emit(state.copyWith(loginStatus: ViewData.success(data: true)));
        },
      );
    }
  }
}
