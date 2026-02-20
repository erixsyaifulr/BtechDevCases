import 'package:auto_route/auto_route.dart';
import 'package:btech_wallet_app/features/home/presentation/ui/home_page.dart';
import 'package:btech_wallet_app/features/login/presentation/ui/login_page.dart';
import 'package:btech_wallet_app/features/register/presentation/ui/register_page.dart';
import 'package:btech_wallet_app/features/splash/presentation/ui/splash_page.dart';
import 'package:btech_wallet_app/features/transfer/presentation/ui/transfer_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/', initial: true),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: TransferRoute.page),
  ];
}
