import 'package:btech_wallet_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:btech_wallet_app/shared/constant/assets_icon.dart';
import 'package:btech_wallet_app/shared/extension/build_context_extension.dart';
import 'package:btech_wallet_app/shared/extension/size_extension.dart';
import 'package:btech_wallet_app/shared/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.authData.when(
          initial: () => Container(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomShimmer(
                    width: context.deviceWidth,
                    height: 16.w,
                  ),
                ),
                CustomShimmer(width: 40.w, height: 40.w, radius: 30.r),
              ],
            ),
          ),
          orElse: (status, auth, message) {
            return Container(
              padding: EdgeInsets.all(16.w),
              child: Row(
                spacing: 16.w,
                children: [
                  Expanded(child: CustomText(text: auth?.data ?? "-")),
                  ClipOval(child: Image.asset(AssetsIcon.profile, width: 40.w)),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
