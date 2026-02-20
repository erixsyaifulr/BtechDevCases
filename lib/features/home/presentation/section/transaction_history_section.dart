import 'package:btech_wallet_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:btech_wallet_app/features/home/presentation/widget/transaction_history_card.dart';
import 'package:btech_wallet_app/shared/constant/label.dart';
import 'package:btech_wallet_app/shared/extension/build_context_extension.dart';
import 'package:btech_wallet_app/shared/extension/size_extension.dart';
import 'package:btech_wallet_app/shared/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionHistorySection extends StatelessWidget {
  const TransactionHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: Label.transferHistory),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state.transactions.when(
                  initial: () => Container(
                    padding: EdgeInsets.all(16.w),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          child: CustomShimmer(
                            width: context.deviceWidth,
                            height: 40.h,
                          ),
                        );
                      },
                    ),
                  ),
                  orElse: (status, data, message) {
                    if (data == null || data.isEmpty) {
                      return Center(
                        child: CustomText(text: Label.noTransaction),
                      );
                    }
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return TransactionHistoryCard(transaction: data[index]);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
