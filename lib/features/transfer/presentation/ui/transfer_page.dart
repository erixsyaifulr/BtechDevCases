import 'package:auto_route/auto_route.dart';
import 'package:btech_wallet_app/config/di/injector.dart';
import 'package:btech_wallet_app/core/base_state/view_data.dart';
import 'package:btech_wallet_app/core/base_state/view_state.dart';
import 'package:btech_wallet_app/features/transfer/presentation/cubit/transfer_cubit.dart';
import 'package:btech_wallet_app/shared/constant/label.dart';
import 'package:btech_wallet_app/shared/constant/palette.dart';
import 'package:btech_wallet_app/shared/extension/size_extension.dart';
import 'package:btech_wallet_app/shared/widget/form/filled_text_field.dart';
import 'package:btech_wallet_app/shared/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TransferPage extends StatefulWidget implements AutoRouteWrapper {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => getIt<TransferCubit>(), child: this);
  }
}

class _TransferPageState extends State<TransferPage> {
  final emailController = TextEditingController();
  final amountController = TextEditingController();
  final notesController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    amountController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Palette.white,
      appBar: baseAppBar(title: CustomText(text: Label.transferBalance)),
      body: Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Form
            Container(
              margin: EdgeInsets.only(top: 20.h),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.r),
                  topRight: Radius.circular(50.r),
                ),
              ),
              child: Column(
                children: [
                  // Email
                  FilledTextField(
                    textEditingController: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: Label.emailRecipient,
                    textInputAction: TextInputAction.next,
                    margin: EdgeInsets.zero,
                    backgroundColor: Palette.white,
                  ),

                  // Amount
                  FilledTextField(
                    textEditingController: amountController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    hintText: Label.totalTransfer,
                    backgroundColor: Palette.white,
                  ),

                  // Notes
                  FilledTextField(
                    textEditingController: notesController,
                    keyboardType: TextInputType.text,
                    hintText: Label.notes,
                    maxLines: 4,
                    height: 100.h,
                    backgroundColor: Palette.white,
                  ),

                  // Transfer button
                  BlocConsumer<TransferCubit, TransferState>(
                    listener: (context, state) {
                      state.transferStatus.listen(
                        error: (message) =>
                            showErrorDialog(context: context, message: message),
                        success: (data) => showSuccessDialog(
                          context: context,
                          message: Label.transferSuccess,
                          dismissible: false,
                          bottomContent: CustomButton(
                            title: Label.ok,
                            margin: EdgeInsets.only(
                              bottom: 16.w,
                              left: 16.w,
                              right: 16.w,
                            ),
                            onPressed: () {
                              context.maybePop().then(
                                (value) => context.maybePop(),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    builder: (context, state) {
                      final cubit = context.read<TransferCubit>();
                      return CustomButton(
                        title: Label.register,
                        loading: state.transferStatus.status.isLoading,
                        margin: EdgeInsets.only(top: 30.h, bottom: 20.h),
                        onPressed: () {
                          cubit.transfer(
                            email: emailController.text,
                            amount: amountController.text,
                            notes: notesController.text,
                          );
                        },
                        buttonRadius: 32.r,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
