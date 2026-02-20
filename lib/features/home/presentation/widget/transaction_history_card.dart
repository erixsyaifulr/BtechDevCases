import 'package:btech_wallet_app/features/home/domain/entity/transaction/transaction.dart';
import 'package:btech_wallet_app/shared/constant/palette.dart';
import 'package:btech_wallet_app/shared/extension/num_extension.dart';
import 'package:btech_wallet_app/shared/extension/size_extension.dart';
import 'package:btech_wallet_app/shared/extension/string_extension.dart';
import 'package:btech_wallet_app/shared/widget/widget.dart';
import 'package:flutter/material.dart';

class TransactionHistoryCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionHistoryCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: EdgeInsets.only(top: 16.w),
      child: Row(
        spacing: 10.w,
        children: [
          Expanded(
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: (transaction.amount ?? 0).currencyFormatRp),
                CustomText(
                  text: transaction.createdAt!.toddMMMMYYYAndHHMM,
                  fontSize: 12.sp,
                ),
              ],
            ),
          ),
          Icon(Icons.check_circle, color: Palette.primary, size: 40),
        ],
      ),
    );
  }
}
