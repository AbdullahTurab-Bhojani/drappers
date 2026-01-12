// ignore_for_file: deprecated_member_use, sized_box_for_whitespace

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/guestloginwidget.dart';

class SocialLoginScreen extends StatefulWidget {
  const SocialLoginScreen({super.key});

  @override
  State<SocialLoginScreen> createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends State<SocialLoginScreen> {
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
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: AppScaler.scaleHeight(context, 110),
                  left: AppScaler.scaleSize(context, 10),
                ),
              ),
              Image.asset(
                Assets.images.logo2.path,
                width: AppScaler.scaleSize(context, 180),
                height: AppScaler.scaleHeight(context, 110),
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 26)),
              PoppinsText(
                context,
                'Get Started with Draper',
                fontSize: PoppinsFontSizeVariant.size24,
                fontWeight: PoppinsFontWeightVariant.semiBold,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 28)),
              AppButton(
                onPressed: () {
                  context.goNamed(AppRoutes.home.name);
                },
                title: 'Login with Google',
                color: AppColors.graylight,
                prefixIcon: Image.asset(
                  Assets.images.googleicon.path,
                  width: AppScaler.scaleSize(context, 26),
                  height: AppScaler.scaleHeight(context, 26),
                ),
                buttonGradient: [AppColors.graylight, AppColors.graylight],
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 28)),
              AppButton(
                onPressed: () {
                  context.goNamed(AppRoutes.home.name);
                },
                title: 'Login with Apple',
                color: AppColors.graylight,
                prefixIcon: Image.asset(
                  Assets.images.appleicon.path,
                  width: AppScaler.scaleSize(context, 26),
                  height: AppScaler.scaleHeight(context, 26),
                ),
                buttonGradient: [AppColors.graylight, AppColors.graylight],
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 28)),
              AppButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.loginScreen.name);
                },
                title: 'Login via email',
                color: AppColors.graylight,
                prefixIcon: Image.asset(
                  Assets.images.at.path,
                  width: AppScaler.scaleSize(context, 26),
                  height: AppScaler.scaleHeight(context, 26),
                ),
                buttonGradient: [AppColors.graylight, AppColors.graylight],
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 28)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.color6B7280,
                      thickness: AppScaler.scaleSize(context, 1),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppScaler.scaleSize(context, 8),
                    ),
                    child: PoppinsText(
                      context,
                      "or",
                      color: AppColors.color6B7280,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      fontSize: PoppinsFontSizeVariant.size12,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.color6B7280,
                      thickness: AppScaler.scaleSize(context, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 28)),
              AppButton(
                buttonSize: Size(
                  double.infinity,
                  AppScaler.scaleHeight(context, 52),
                ),
                onPressed: () {
                  GuestHelper.isGuest = true;
                  context.goNamed(AppRoutes.home.name);
                },
                buttonGradient: [AppColors.graylight, AppColors.graylight],
                title: 'Continue as Guest',
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 48)),
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
                          colors: [Color(0xFF1FCFFF), Color(0xFF0063FF)],
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
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
    );
  }
}
