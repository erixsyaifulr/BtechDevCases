import 'package:bloc/bloc.dart';
import 'package:btech_wallet_app/core/base_state/view_data.dart';
import 'package:btech_wallet_app/features/splash/domain/repositories/splash_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashRepository splashRepository;
  SplashCubit({required this.splashRepository})
    : super(SplashState(isAuthenticated: ViewData.initial(data: false)));

  Future<void> initial() async {
    final result = await splashRepository.getAccessToken();
    result.fold(
      (failure) =>
          emit(state.copyWith(isAuthenticated: ViewData.error(data: false))),
      (token) =>
          emit(state.copyWith(isAuthenticated: ViewData.success(data: true))),
    );
  }
}
