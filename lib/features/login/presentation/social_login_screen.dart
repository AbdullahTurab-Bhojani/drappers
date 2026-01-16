// ignore_for_file: deprecated_member_use, sized_box_for_whitespace

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/guestloginwidget.dart';
import '../../authentication/data/dto/social_dto/social_dto.dart';
import '../providers/social_auth_provider.dart';

class SocialLoginScreen extends ConsumerStatefulWidget {
  const SocialLoginScreen({super.key});

  @override
  ConsumerState<SocialLoginScreen> createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends ConsumerState<SocialLoginScreen> {
  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppScaler.scaleSize(context, 16),
            ),
            child: Column(
              children: [
                SizedBox(height: AppScaler.scaleHeight(context, 110)),

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
                  onPressed: () async {
                    final authService = ref.read(socialAuthServiceProvider);
                    final result = await authService.googleSignIn();

                    if (result != null) {
                      final socialDto = SocialDTO(
                        subjectToken: result['subject_token'] ?? '',
                        subjectIssuer: result['subject_issuer'] ?? 'google',
                        email: result['subject_email'] ?? '',
                      );
                      final success = await authService.onSocialAuthApi(
                        socialDto,
                      );
                      if (success && context.mounted) {
                        context.goNamed(AppRoutes.home.name);
                      }
                    } else {
                      debugPrint("Google Login Cancelled or Failed");
                    }
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
                  children: [
                    Expanded(child: Divider(color: AppColors.color6B7280)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppScaler.scaleSize(context, 8),
                      ),
                      child: PoppinsText(
                        context,
                        "or",
                        color: AppColors.color6B7280,
                        fontSize: PoppinsFontSizeVariant.size12,
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.color6B7280)),
                  ],
                ),

                SizedBox(height: AppScaler.scaleHeight(context, 28)),

                AppButton(
                  onPressed: () {
                    GuestHelper.isGuest = true;
                    context.goNamed(AppRoutes.home.name);
                  },
                  title: 'Continue as Guest',
                  buttonGradient: [AppColors.graylight, AppColors.graylight],
                ),

                SizedBox(height: AppScaler.scaleHeight(context, 48)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PoppinsText(
                      context,
                      "Need to create an account?",
                      fontSize: PoppinsFontSizeVariant.size16,
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
      ),
    );
  }
}
