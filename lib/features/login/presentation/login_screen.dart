// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/guestloginwidget.dart';
import '../../../shared/widgets/textfield_new.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  void onRememberMeChanged(bool? value) {
    setState(() {
      rememberMe = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    // bool canExit = false;

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
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 110),
                    child: Image.asset(Assets.images.logo2.path),
                  ),
                  SizedBox(height: 26),
                  PoppinsText(
                    "Get Started with Draper",
                    fontSize: PoppinsFontSizeVariant.size24,
                    fontWeight: PoppinsFontWeightVariant.semiBold,
                    color: customColors.textColor,
                  ),
                  SizedBox(height: 28),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
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
                            if (!value.contains("@"))
                              return "Enter valid email";
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        AppPasswordField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: _passwordController,
                          labelText: "Password*",
                          hintText: "**********",
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Full name required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 14),
                        Row(
                          children: [
                            SizedBox(
                              height: 14,
                              width: 14,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,

                                onTap: () => onRememberMeChanged(!rememberMe),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: rememberMe
                                        ? null
                                        : Border.all(color: Colors.white),
                                  ),
                                  child: rememberMe
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              4,
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
                                            size: 12,
                                            color: Colors.white,
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                            ),

                            SizedBox(width: 6),
                            PoppinsText(
                              "Remember Me",
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                              color: customColors.textColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        AppButton(
                          onPressed: () {
                            context.goNamed(AppRoutes.home.name);
                          },
                          title: "Continue",
                        ),
                        SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: Center(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,

                              onTap: () {
                                context.pushNamed(
                                  AppRoutes.forgetpasswordScreen.name,
                                );
                              },
                              child: PoppinsText(
                                'Forgot Password?',
                                decoration: TextDecoration.underline,
                                fontSize: PoppinsFontSizeVariant.size14,
                                fontWeight: PoppinsFontWeightVariant.medium,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColors.color6B7280,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: PoppinsText(
                                "or",
                                color: AppColors.color6B7280,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                fontSize: PoppinsFontSizeVariant.size12,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.color6B7280,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButton(
                              onPressed: () {
                                context.goNamed(AppRoutes.home.name);
                              },
                              title: '',
                              buttonSize: Size(180, 52),
                              color: AppColors.graylight,
                              prefixIcon: Image.asset(
                                Assets.images.googleicon.path,
                                width: 26,
                                height: 26,
                              ),
                              buttonGradient: [
                                AppColors.graylight,
                                AppColors.graylight,
                              ],
                            ),
                            AppButton(
                              onPressed: () {
                                context.goNamed(AppRoutes.home.name);
                              },
                              title: '',
                              buttonSize: Size(180, 52),
                              color: AppColors.graylight,
                              prefixIcon: Image.asset(
                                Assets.images.appleicon.path,
                                width: 26,
                                height: 26,
                              ),
                              buttonGradient: [
                                AppColors.graylight,
                                AppColors.graylight,
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        AppButton(
                          onPressed: () {
                            GuestHelper.isGuest = true;
                            context.goNamed(AppRoutes.home.name);
                          },
                          title: 'Continue as Guest',
                          buttonGradient: [
                            AppColors.graylight,
                            AppColors.graylight,
                          ],
                          color: AppColors.graylight,
                        ),

                        SizedBox(height: 28),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PoppinsText(
                              "Need to create an account?",
                              fontSize: PoppinsFontSizeVariant.size14,
                              fontWeight: PoppinsFontWeightVariant.medium,
                              color: customColors.textColor,
                            ),
                            SizedBox(width: 10),
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
                                  context.pushNamed(
                                    AppRoutes.signupScreen.name,
                                  );
                                },
                                child: PoppinsText(
                                  "Sign Up",
                                  fontSize: PoppinsFontSizeVariant.size14,
                                  fontWeight: PoppinsFontWeightVariant.medium,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
