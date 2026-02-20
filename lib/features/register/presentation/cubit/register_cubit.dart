import 'package:bloc/bloc.dart';
import 'package:btech_wallet_app/features/register/data/datasources/dto/request/register/register_request.dart';
import 'package:btech_wallet_app/features/register/domain/repository/register_repository.dart';
import 'package:btech_wallet_app/shared/constant/label.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/base_state/view_data.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository registerRepository;
  CancelToken cancelToken = CancelToken();
  RegisterCubit({required this.registerRepository})
    : super(
        RegisterState(
          registerStatus: ViewData.initial(),
          passwordObsecure: false,
          passwordConfirmationObsecure: false,
        ),
      );

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }

  void tooglePassword() {
    emit(
      state.copyWith(
        passwordObsecure: !state.passwordObsecure,
        registerStatus: ViewData.initial(),
      ),
    );
  }

  void tooglePasswordConfirmation() {
    emit(
      state.copyWith(
        passwordConfirmationObsecure: !state.passwordConfirmationObsecure,
        registerStatus: ViewData.initial(),
      ),
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(state.copyWith(registerStatus: ViewData.loading()));
    if (email.isEmpty || password.isEmpty || passwordConfirmation.isEmpty) {
      return emit(
        state.copyWith(registerStatus: ViewData.error(message: Label.fillAll)),
      );
    } else {
      final result = await registerRepository.register(
        request: RegisterRequest(
          email: email,
          password: password,
          confirmPassword: passwordConfirmation,
        ),
        cancelToken: cancelToken,
      );

      if (isClosed) return;

      result.fold(
        (l) => emit(
          state.copyWith(registerStatus: ViewData.error(message: l.message)),
        ),
        (r) =>
            emit(state.copyWith(registerStatus: ViewData.success(data: true))),
      );
    }
  }
}
