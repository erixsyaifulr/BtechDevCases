import 'package:auto_route/auto_route.dart';
import 'package:btech_wallet_app/config/router/app_router.dart';
import 'package:btech_wallet_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:btech_wallet_app/shared/constant/label.dart';
import 'package:btech_wallet_app/shared/extension/num_extension.dart';
import 'package:btech_wallet_app/shared/extension/size_extension.dart';
import 'package:btech_wallet_app/shared/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        spacing: 16.w,
        children: [
          CustomText(
            text: Label.totalBalance,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state.balance.when(
                initial: () => Center(
                  child: CustomShimmer(width: 200.w, height: 20.h),
                ),
                orElse: (status, data, message) {
                  return CustomText(
                    text: (data?.balance ?? 0).currencyFormatRp,
                    textAlign: TextAlign.center,
                  );
                },
              );
            },
          ),
          CustomButton(
            title: Label.transferBalance,
            onPressed: () {
              context.pushRoute(TransferRoute());
            },
          ),
        ],
      ),
    );
  }
}
