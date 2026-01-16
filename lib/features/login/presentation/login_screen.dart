// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/textfield_new.dart';
import '../../authentication/data/dto/login_dto/login_dto.dart';
import '../providers/login_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool rememberMe = false;

  void onRememberMeChanged(bool? value) {
    rememberMe = value ?? false;
  }

  Future<void> onSubmit() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      Fluttertoast.showToast(
        msg: "Please fill all required fields",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16,
      );
      return;
    }
    final notifier = ref.read(loginProviderProvider.notifier);
    try {
      final result = await notifier.onSubmit(
        loginDto: LoginDto(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );

      if (!mounted) return;
      Fluttertoast.showToast(
        msg: result.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16,
      );
      if (result.isSuccess) {
        context.goNamed(AppRoutes.home.name);
      }
    } catch (e) {
      if (!mounted) return;

      Fluttertoast.showToast(
        msg: e.toString().replaceFirst('Exception: ', ''),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return WillPopScope(
      onWillPop: () async {
        exit(0);
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.screensbg.path),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppScaler.scaleHeight(context, 110),
                      left: AppScaler.scaleSize(context, 10),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                AppRoutes.socialLoginScreen.name,
                              );
                            },
                            child: Image.asset(Assets.images.backicon.path),
                          ),
                        ),

                        Image.asset(
                          Assets.images.logo2.path,
                          width: AppScaler.scaleSize(context, 180),
                          height: AppScaler.scaleHeight(context, 110),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppScaler.scaleHeight(context, 26)),
                  PoppinsText(
                    context,
                    "Get Started with Draper",
                    fontSize: PoppinsFontSizeVariant.size24,
                    fontWeight: PoppinsFontWeightVariant.semiBold,
                    color: customColors.textColor,
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: AppScaler.scaleSize(context, 15),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: AppScaler.scaleHeight(context, 28)),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Expanded(
                      //       child: AppButton(
                      //         buttonSize: Size(
                      //           double.infinity,
                      //           AppScaler.scaleHeight(context, 52),
                      //         ),
                      //         onPressed: () {
                      //           context.goNamed(AppRoutes.home.name);
                      //         },
                      //         title: 'Google Login',
                      //         color: AppColors.graylight,
                      //         prefixIcon: Image.asset(
                      //           Assets.images.googleicon.path,
                      //           width: AppScaler.scaleSize(context, 26),
                      //           height: AppScaler.scaleHeight(context, 26),
                      //         ),
                      //         buttonGradient: [
                      //           AppColors.graylight,
                      //           AppColors.graylight,
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(width: AppScaler.scaleSize(context, 10)),
                      //     Expanded(
                      //       child: AppButton(
                      //         buttonSize: Size(
                      //           double.infinity,
                      //           AppScaler.scaleHeight(context, 52),
                      //         ),
                      //         onPressed: () {
                      //           context.goNamed(AppRoutes.home.name);
                      //         },
                      //         title: 'Apple Login',
                      //         color: AppColors.graylight,
                      //         prefixIcon: Image.asset(
                      //           Assets.images.appleicon.path,
                      //           width: AppScaler.scaleSize(context, 26),
                      //           height: AppScaler.scaleHeight(context, 26),
                      //         ),
                      //         buttonGradient: [
                      //           AppColors.graylight,
                      //           AppColors.graylight,
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: AppScaler.scaleHeight(context, 10)),
                      // AppButton(
                      //   buttonSize: Size(
                      //     double.infinity,
                      //     AppScaler.scaleHeight(context, 52),
                      //   ),
                      //   onPressed: () {
                      //     GuestHelper.isGuest = true;
                      //     context.goNamed(AppRoutes.home.name);
                      //   },
                      //   buttonGradient: [
                      //     AppColors.graylight,
                      //     AppColors.graylight,
                      //   ],
                      //   title: 'Continue as Guest',
                      //   // color: Colors.transparent,
                      // ),
                      // SizedBox(height: AppScaler.scaleHeight(context, 28)),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Expanded(
                      //       child: Divider(
                      //         color: AppColors.color6B7280,
                      //         thickness: AppScaler.scaleSize(context, 1),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.symmetric(
                      //         horizontal: AppScaler.scaleSize(context, 8),
                      //       ),
                      //       child: PoppinsText(
                      //         context,
                      //         "or",
                      //         color: AppColors.color6B7280,
                      //         fontWeight: PoppinsFontWeightVariant.regular,
                      //         fontSize: PoppinsFontSizeVariant.size12,
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: Divider(
                      //         color: AppColors.color6B7280,
                      //         thickness: AppScaler.scaleSize(context, 1),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: AppScaler.scaleHeight(context, 28)),
                      NewTextField(
                        fieldbg: AppColors.tfield,
                        controller: _emailController,
                        labelText: "Enter your Email Address or Phone*",
                        hintText: "example@mailinator.com",
                        filledColor: AppColors.tfield,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Email required";
                          }
                          if (!value.contains("@")) {
                            return "Enter valid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppScaler.scaleSize(context, 15)),
                      AppPasswordField(
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: _passwordController,
                        labelText: "Password*",
                        hintText: "**********",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Password is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 25)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: AppScaler.scaleHeight(context, 14),
                                width: AppScaler.scaleSize(context, 14),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () => onRememberMeChanged(!rememberMe),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        AppScaler.scaleSize(context, 4),
                                      ),
                                      border: rememberMe
                                          ? null
                                          : Border.all(color: AppColors.white),
                                    ),
                                    child: rememberMe
                                        ? Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    AppScaler.scaleSize(
                                                      context,
                                                      4,
                                                    ),
                                                  ),
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Color(0xFF1FCFFF),
                                                  Color(0xFF0063FF),
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.check,
                                              size: AppScaler.scaleSize(
                                                context,
                                                12,
                                              ),
                                              color: AppColors.white,
                                            ),
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                              SizedBox(width: AppScaler.scaleSize(context, 6)),
                              PoppinsText(
                                context,
                                "Remember Me",
                                fontSize: PoppinsFontSizeVariant.size14,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                color: customColors.textColor,
                              ),
                            ],
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              context.pushNamed(
                                AppRoutes.forgetpasswordScreen.name,
                              );
                            },
                            child: PoppinsText(
                              context,
                              'Forgot Password?',
                              decoration: TextDecoration.underline,
                              fontSize: PoppinsFontSizeVariant.size14,
                              fontWeight: PoppinsFontWeightVariant.medium,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 40)),

                      AppButton(
                        onPressed: () {
                          onSubmit();
                        },
                        title: "Continue",
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 40)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PoppinsText(
                            context,
                            "Need to create an account?",
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                          SizedBox(width: AppScaler.scaleSize(context, 10)),
                          ShaderMask(
                            shaderCallback: (bounds) =>
                                LinearGradient(
                                  colors: [
                                    Color(0xFF1FCFFF),
                                    Color(0xFF0063FF),
                                  ],
                                ).createShader(
                                  Rect.fromLTWH(
                                    0,
                                    0,
                                    bounds.width,
                                    bounds.height,
                                  ),
                                ),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                context.pushNamed(AppRoutes.signupScreen.name);
                              },
                              child: PoppinsText(
                                context,
                                "Sign Up",
                                fontSize: PoppinsFontSizeVariant.size16,
                                fontWeight: PoppinsFontWeightVariant.medium,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
