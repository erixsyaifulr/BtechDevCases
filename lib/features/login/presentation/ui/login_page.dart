import 'package:auto_route/auto_route.dart';
import 'package:btech_wallet_app/config/di/injector.dart';
import 'package:btech_wallet_app/config/router/app_router.dart';
import 'package:btech_wallet_app/core/base_state/view_data.dart';
import 'package:btech_wallet_app/core/base_state/view_state.dart';
import 'package:btech_wallet_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:btech_wallet_app/shared/constant/assets_icon.dart';
import 'package:btech_wallet_app/shared/constant/assets_image.dart';
import 'package:btech_wallet_app/shared/constant/label.dart';
import 'package:btech_wallet_app/shared/constant/palette.dart';
import 'package:btech_wallet_app/shared/extension/size_extension.dart';
import 'package:btech_wallet_app/shared/widget/button/custom_button.dart';
import 'package:btech_wallet_app/shared/widget/dialog/custom_dialog.dart';
import 'package:btech_wallet_app/shared/widget/form/filled_text_field.dart';
import 'package:btech_wallet_app/shared/widget/spaces/spaces.dart';
import 'package:btech_wallet_app/shared/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => getIt<LoginCubit>(), child: this);
  }
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Palette.white,
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
                    Container(
                      margin: EdgeInsets.only(top: 20.h),
                      child: Center(
                        child: CustomText(
                          text: Label.btechWallet,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          fontSize: 16.sp,
                        ),
                      ),
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
                          FilledTextField(
                            textEditingController: emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: Label.email,
                            margin: EdgeInsets.zero,
                            backgroundColor: Palette.white,
                            prefixIcon: Container(
                              padding: EdgeInsets.symmetric(vertical: 12.w),
                              child: Image.asset(AssetsIcon.email),
                            ),
                          ),
                          BlocBuilder<LoginCubit, LoginState>(
                            buildWhen: (previous, current) =>
                                previous.obsecurePassword !=
                                current.obsecurePassword,
                            builder: (context, state) {
                              final cubit = context.read<LoginCubit>();
                              return FilledTextField(
                                textEditingController: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                hintText: Label.password,
                                backgroundColor: Palette.white,
                                obscureText: state.obsecurePassword,
                                prefixIcon: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12.w),
                                  child: Image.asset(
                                    AssetsIcon.lock,
                                    color: Palette.grey,
                                  ),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () => cubit.showPassword(),
                                  child: Icon(
                                    state.obsecurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Palette.grey,
                                  ),
                                ),
                              );
                            },
                          ),

                          // Login button
                          BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              state.loginStatus.listen(
                                error: (message) => showErrorDialog(
                                  context: context,
                                  message: message,
                                ),
                                success: (data) =>
                                    context.replaceRoute(HomeRoute()),
                              );
                            },
                            builder: (context, state) {
                              final cubit = context.read<LoginCubit>();
                              return CustomButton(
                                title: Label.login,
                                loading: state.loginStatus.status.isLoading,
                                margin: EdgeInsets.only(
                                  top: 30.h,
                                  bottom: 20.h,
                                ),
                                onPressed: () {
                                  cubit.submitLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                },
                                buttonRadius: 32.r,
                              );
                            },
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10.w,
                            children: [
                              Expanded(
                                child: CustomText(text: Label.dontHaveAccount),
                              ),
                              InkWell(
                                onTap: () {
                                  context.pushRoute(RegisterRoute());
                                },
                                child: CustomText(
                                  text: Label.register,
                                  color: Palette.primary,
                                ),
                              ),
                            ],
                          ),

                          SpaceHeight(40.h),
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
