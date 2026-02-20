part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required ViewData<bool> loginStatus,
    required bool obsecurePassword,
  }) = _LoginState;
}
