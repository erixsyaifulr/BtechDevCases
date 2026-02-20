import 'package:auto_route/auto_route.dart';
import 'package:btech_wallet_app/config/di/injector.dart';
import 'package:btech_wallet_app/config/router/app_router.dart';
import 'package:btech_wallet_app/core/base_state/view_data.dart';
import 'package:btech_wallet_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:btech_wallet_app/shared/constant/assets_image.dart';
import 'package:btech_wallet_app/shared/constant/palette.dart';
import 'package:btech_wallet_app/shared/extension/build_context_extension.dart';
import 'package:btech_wallet_app/shared/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget implements AutoRouteWrapper {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => getIt<SplashCubit>(), child: this);
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<SplashCubit>().initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Palette.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        state.isAuthenticated.listen(
          error: (message) => context.router.replace(const LoginRoute()),
          success: (data) => context.router.replace(const HomeRoute()),
        );
      },
      child: Container(
        width: context.deviceWidth,
        height: context.deviceHeight,
        color: Palette.white,
        child: Center(child: Image.asset(AssetsImage.logo, width: 150.w)),
      ),
    );
  }
}
