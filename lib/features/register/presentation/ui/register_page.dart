import 'package:auto_route/auto_route.dart';
import 'package:btech_wallet_app/config/di/injector.dart';
import 'package:btech_wallet_app/core/base_state/view_data.dart';
import 'package:btech_wallet_app/core/base_state/view_state.dart';
import 'package:btech_wallet_app/features/register/presentation/cubit/register_cubit.dart';
import 'package:btech_wallet_app/shared/constant/assets_icon.dart';
import 'package:btech_wallet_app/shared/constant/assets_image.dart';
import 'package:btech_wallet_app/shared/constant/label.dart';
import 'package:btech_wallet_app/shared/constant/palette.dart';
import 'package:btech_wallet_app/shared/extension/size_extension.dart';
import 'package:btech_wallet_app/shared/widget/form/filled_text_field.dart';
import 'package:btech_wallet_app/shared/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RegisterPage extends StatefulWidget implements AutoRouteWrapper {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => getIt<RegisterCubit>(), child: this);
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Palette.white,
      appBar: baseAppBar(title: CustomText(text: Label.register)),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceHeight(100.h),

                    // App logo
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(AssetsImage.logo, width: 120.w),
                    ),

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
                            hintText: Label.email,
                            textInputAction: TextInputAction.next,
                            margin: EdgeInsets.zero,
                            backgroundColor: Palette.white,
                            prefixIcon: Container(
                              padding: EdgeInsets.symmetric(vertical: 12.w),
                              child: Image.asset(AssetsIcon.email),
                            ),
                          ),

                          // Password
                          BlocBuilder<RegisterCubit, RegisterState>(
                            buildWhen: (previous, current) =>
                                previous.passwordObsecure !=
                                current.passwordObsecure,
                            builder: (context, state) {
                              final cubit = context.read<RegisterCubit>();
                              return FilledTextField(
                                textEditingController: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.next,
                                hintText: Label.password,
                                backgroundColor: Palette.white,
                                obscureText: state.passwordObsecure,
                                prefixIcon: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12.w),
                                  child: Image.asset(
                                    AssetsIcon.lock,
                                    color: Palette.grey,
                                  ),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () => cubit.tooglePassword(),
                                  child: Icon(
                                    state.passwordObsecure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Palette.grey,
                                  ),
                                ),
                              );
                            },
                          ),

                          // Password confirmation
                          BlocBuilder<RegisterCubit, RegisterState>(
                            buildWhen: (previous, current) =>
                                previous.passwordConfirmationObsecure !=
                                current.passwordConfirmationObsecure,
                            builder: (context, state) {
                              final cubit = context.read<RegisterCubit>();
                              return FilledTextField(
                                margin: EdgeInsets.zero,
                                textEditingController:
                                    passwordConfirmationController,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                hintText: Label.passwordConfirmation,
                                backgroundColor: Palette.white,
                                obscureText: state.passwordConfirmationObsecure,
                                prefixIcon: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12.w),
                                  child: Image.asset(
                                    AssetsIcon.lock,
                                    color: Palette.grey,
                                  ),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () =>
                                      cubit.tooglePasswordConfirmation(),
                                  child: Icon(
                                    state.passwordConfirmationObsecure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Palette.grey,
                                  ),
                                ),
                              );
                            },
                          ),

                          // Register button
                          BlocConsumer<RegisterCubit, RegisterState>(
                            listener: (context, state) {
                              state.registerStatus.listen(
                                error: (message) => showErrorDialog(
                                  context: context,
                                  message: message,
                                ),
                                success: (data) => showSuccessDialog(
                                  context: context,
                                  message: Label.successRegister,
                                  dismissible: false,
                                  bottomContent: CustomButton(
                                    margin: EdgeInsets.only(
                                      bottom: 16.w,
                                      left: 16.w,
                                      right: 16.w,
                                    ),
                                    title: Label.ok,
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
                              final cubit = context.read<RegisterCubit>();
                              return CustomButton(
                                title: Label.register,
                                loading: state.registerStatus.status.isLoading,
                                margin: EdgeInsets.only(
                                  top: 30.h,
                                  bottom: 20.h,
                                ),
                                onPressed: () {
                                  cubit.register(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    passwordConfirmation:
                                        passwordConfirmationController.text,
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
          },
        ),
      ),
    );
  }
}
