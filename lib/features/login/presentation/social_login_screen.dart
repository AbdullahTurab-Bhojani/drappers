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
import '../providers/apple_auth_provider.dart';
import '../providers/social_auth_provider.dart';

class SocialLoginScreen extends ConsumerStatefulWidget {
  const SocialLoginScreen({super.key});

  @override
  ConsumerState<SocialLoginScreen> createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends ConsumerState<SocialLoginScreen> {
  bool _isGoogleLoading = false;
  bool _isAppleLoading = false;

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
              fit: BoxFit.cover,
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
                    if (!_isGoogleLoading) {
                      setState(() => _isGoogleLoading = true);

                      final socialAuthService = ref.read(
                        socialAuthServiceProvider,
                      );

                      Map<String, dynamic>? googleData;
                      try {
                        googleData = await socialAuthService.googleSignIn();
                        if (googleData == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Google Sign-In failed'),
                            ),
                          );
                          setState(() => _isGoogleLoading = false);
                          return;
                        }
                      } catch (e, st) {
                        debugPrint('Google Sign-In error: $e\n$st');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Google Sign-In encountered an error',
                            ),
                          ),
                        );
                        setState(() => _isGoogleLoading = false);
                        return;
                      }

                      final socialDto = SocialDTO(
                        subjectToken: googleData['subject_token'] ?? '',
                        subjectIssuer: googleData['subject_issuer'] ?? '',
                        email: googleData['subject_email'] ?? '',
                      );

                      bool success = false;
                      try {
                        success = await socialAuthService.onSocialAuthApi(
                          socialDto,
                        );
                      } catch (e, st) {
                        debugPrint('Backend Social Auth error: $e\n$st');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Social login API error'),
                          ),
                        );
                        setState(() => _isGoogleLoading = false);
                        return;
                      }

                      if (!context.mounted) return;

                      setState(() => _isGoogleLoading = false);

                      if (success) {
                        context.go('/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Social login failed')),
                        );
                      }
                    }
                  },
                  title: _isGoogleLoading ? '' : 'Login with Google',

                  prefixIcon: _isGoogleLoading
                      ? LoadingWidget(
                          color: AppColors.buttoncolor.first,
                          width: 22,
                          height: 22,
                        )
                      : Image.asset(
                          Assets.images.googleicon.path,
                          width: AppScaler.scaleSize(context, 26),
                          height: AppScaler.scaleHeight(context, 26),
                        ),

                  color: AppColors.graylight,
                  buttonGradient: [AppColors.graylight, AppColors.graylight],
                ),
                if (Platform.isIOS)
                  Column(
                    children: [
                      SizedBox(height: AppScaler.scaleHeight(context, 28)),

                      AppButton(
                        onPressed: () async {
                          if (_isAppleLoading) return;

                          setState(() => _isAppleLoading = true);

                          final appleAuthService = ref.read(
                            appleAuthServiceProvider,
                          );

                          Map<String, dynamic>? appleData;

                          try {
                            appleData = await appleAuthService.appleLogin();

                            if (appleData == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Apple Sign-In failed'),
                                ),
                              );
                              setState(() => _isAppleLoading = false);
                              return;
                            }
                          } catch (e, st) {
                            debugPrint('Apple Sign-In error: $e\n$st');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Apple Sign-In encountered an error',
                                ),
                              ),
                            );
                            setState(() => _isAppleLoading = false);
                            return;
                          }

                          final socialDto = SocialDTO(
                            subjectToken: appleData['subject_token'] ?? '',
                            subjectIssuer: appleData['subject_issuer'] ?? '',
                            email: appleData['subject_email'] ?? '',
                          );

                          bool success = false;

                          try {
                            success = await appleAuthService.onAppleAuthApi(
                              socialDto,
                            );
                          } catch (e, st) {
                            debugPrint('Apple Backend Auth error: $e\n$st');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Apple login API error'),
                              ),
                            );
                            setState(() => _isAppleLoading = false);
                            return;
                          }

                          if (!context.mounted) return;

                          setState(() => _isAppleLoading = false);

                          if (success) {
                            context.go('/home');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Apple login failed'),
                              ),
                            );
                          }
                        },

                        title: _isAppleLoading ? '' : 'Login with Apple',

                        prefixIcon: _isAppleLoading
                            ? LoadingWidget(
                                color: AppColors.buttoncolor.first,
                                width: 22,
                                height: 22,
                              )
                            : Image.asset(
                                Assets.images.appleicon.path,
                                width: AppScaler.scaleSize(context, 26),
                                height: AppScaler.scaleHeight(context, 26),
                              ),

                        color: AppColors.graylight,
                        buttonGradient: [
                          AppColors.graylight,
                          AppColors.graylight,
                        ],
                      ),
                    ],
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
