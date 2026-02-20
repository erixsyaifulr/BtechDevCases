import 'package:btech_wallet_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:btech_wallet_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:btech_wallet_app/features/register/presentation/cubit/register_cubit.dart';
import 'package:btech_wallet_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:btech_wallet_app/features/transfer/presentation/cubit/transfer_cubit.dart';

import '/config/di/injector.dart';

class BlocInjection {
  static void init() {
    //* Splash
    getIt.registerFactory<SplashCubit>(
      () => SplashCubit(splashRepository: getIt()),
    );

    //* Login
    getIt.registerFactory<LoginCubit>(
      () => LoginCubit(loginRepository: getIt()),
    );

    //* Register
    getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(registerRepository: getIt()),
    );

    //* Home
    getIt.registerFactory<HomeCubit>(() => HomeCubit(homeRepository: getIt()));

    //* Transfer
    getIt.registerFactory<TransferCubit>(
      () => TransferCubit(transferRepository: getIt()),
    );
  }
}
