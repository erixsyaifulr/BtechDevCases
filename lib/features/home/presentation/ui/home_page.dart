import 'package:auto_route/auto_route.dart';
import 'package:btech_wallet_app/config/di/injector.dart';
import 'package:btech_wallet_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:btech_wallet_app/features/home/presentation/section/balance_section.dart';
import 'package:btech_wallet_app/features/home/presentation/section/profile_section.dart';
import 'package:btech_wallet_app/features/home/presentation/section/transaction_history_section.dart';
import 'package:btech_wallet_app/shared/constant/label.dart';
import 'package:btech_wallet_app/shared/constant/palette.dart';
import 'package:btech_wallet_app/shared/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => getIt<HomeCubit>(), child: this);
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeCubit>().initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Palette.white,
      appBar: baseAppBar(
        title: CustomText(text: Label.btechWallet),
        withBackButton: false,
      ),
      body: BlocProvider.value(
        value: context.read<HomeCubit>(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSection(),
            BalanceSection(),
            Expanded(child: TransactionHistorySection()),
          ],
        ),
      ),
    );
  }
}
