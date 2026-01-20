// ignore_for_file: deprecated_member_use, dead_code

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
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
    setState(() {
      rememberMe = value ?? false;
    });
  }

  @override
  void initState() {
    final pref = ref.read(localDataProvider);
    debugPrint(pref.accessToken);
    super.initState();
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProviderProvider);
    final bool isLoading = state.isLoading;

    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return WillPopScope(
      onWillPop: () async {
        exit(0);
      },
      child: Scaffold(
        // Prevents the background from being squeezed when keyboard opens
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.screensbg.path),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                children: [
                  // Logo and Header Section
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
                                behavior: HitTestBehavior.opaque,
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

                  // Form Section
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppScaler.scaleSize(context, 15),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: AppScaler.scaleHeight(context, 28)),
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
                            keyboardType: TextInputType.text,
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
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () =>
                                        onRememberMeChanged(!rememberMe),
                                    child: Container(
                                      height: AppScaler.scaleHeight(
                                        context,
                                        18,
                                      ),
                                      width: AppScaler.scaleSize(context, 18),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          AppScaler.scaleSize(context, 4),
                                        ),
                                        border: rememberMe
                                            ? null
                                            : Border.all(
                                                color: AppColors.white,
                                              ),
                                        gradient: rememberMe
                                            ? const LinearGradient(
                                                colors: [
                                                  Color(0xFF1FCFFF),
                                                  Color(0xFF0063FF),
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              )
                                            : null,
                                      ),
                                      child: rememberMe
                                          ? Icon(
                                              Icons.check,
                                              size: AppScaler.scaleSize(
                                                context,
                                                14,
                                              ),
                                              color: AppColors.white,
                                            )
                                          : null,
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppScaler.scaleSize(context, 6),
                                  ),
                                  PoppinsText(
                                    context,
                                    "Remember Me",
                                    fontSize: PoppinsFontSizeVariant.size14,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
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
                              FocusScope.of(context).unfocus();
                              if (!isLoading) {
                                onSubmit();
                              }
                            },
                            title: isLoading ? "Loading..." : "Continue",
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
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  context.pushNamed(
                                    AppRoutes.signupScreen.name,
                                  );
                                },
                                child: ShaderMask(
                                  shaderCallback: (bounds) =>
                                      const LinearGradient(
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
                                  child: PoppinsText(
                                    context,
                                    "Sign Up",
                                    fontSize: PoppinsFontSizeVariant.size16,
                                    fontWeight: PoppinsFontWeightVariant.medium,
                                    decoration: TextDecoration.underline,
                                    // Set color to white so shader shows
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
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
