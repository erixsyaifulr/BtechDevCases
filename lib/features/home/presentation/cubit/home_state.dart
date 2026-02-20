part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required ViewData<AuthData> authData,
    required ViewData<Balance> balance,
    required ViewData<List<Transaction>> transactions,
  }) = _HomeState;
}
