part of 'register_cubit.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    required ViewData<bool> registerStatus,
    required bool passwordObsecure,
    required bool passwordConfirmationObsecure,
  }) = _RegisterState;
}
