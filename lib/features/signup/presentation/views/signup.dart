import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/theme/app_scalar.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/phonefield_code.dart';
import '../../../../shared/widgets/textfield_new.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();

  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_autoSelectReceiveMethod);
    _phoneController.addListener(_autoSelectReceiveMethod);
  }

  void onRememberMeChanged(bool? value) {
    setState(() {
      rememberMe = value ?? false;
    });
  }

  void _autoSelectReceiveMethod() {
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();

    setState(() {
      // Your logic for selecting receive method if needed
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Scaffold(
      backgroundColor: customColors.dark,
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
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppScaler.scaleSize(context, 15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: AppScaler.scaleHeight(context, 40)),
                  Image.asset(
                    Assets.images.logo2.path,
                    width: AppScaler.scaleSize(context, 180),
                    height: AppScaler.scaleHeight(context, 110),
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 26)),
                  PoppinsText(
                    context,
                    "Get Started with Draper",
                    fontSize: PoppinsFontSizeVariant.size24,
                    fontWeight: PoppinsFontWeightVariant.semiBold,
                    color: customColors.textColor,
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 36)),

                  NewTextField(
                    fieldbg: AppColors.tfield,
                    controller: _fullNameController,
                    labelText: "Full Name",
                    hintText: "John Mackson",
                    filledColor: AppColors.tfield,
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 15)),

                  NewTextField(
                    fieldbg: AppColors.tfield,
                    controller: _emailController,
                    labelText: "Enter your Email Address*",
                    hintText: "Jerrymackson@gmail.com",
                    filledColor: AppColors.tfield,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 15)),

                  PhoneOtpField(
                    phoneController: _phoneController,
                    otpController: otpController,
                    fieldbg: AppColors.tfield,
                    labelText: 'Phone Number*',
                    onSendCode: () {},
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 15)),

                  AppPasswordField(
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: _passwordController,
                    labelText: "Create Password*",
                    hintText: "**********",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Password required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 15)),

                  AppPasswordField(
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: _confirmPasswordController,
                    labelText: "Confirm Password*",
                    hintText: "**********",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Confirm password required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 15)),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => onRememberMeChanged(!rememberMe),
                        child: Container(
                          height: AppScaler.scaleHeight(context, 14),
                          width: AppScaler.scaleSize(context, 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: rememberMe
                                ? null
                                : Border.all(color: AppColors.white),
                          ),
                          child: rememberMe
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
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
                                    size: AppScaler.scaleSize(context, 12),
                                    color: AppColors.white,
                                  ),
                                )
                              : null,
                        ),
                      ),
                      SizedBox(width: AppScaler.scaleSize(context, 5)),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: PoppinsText(
                                  context,
                                  "I agree to the ",
                                  fontSize: PoppinsFontSizeVariant.size12,
                                  color: customColors.textColor,
                                  fontWeight: PoppinsFontWeightVariant.regular,
                                ),
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: ShaderMask(
                                    shaderCallback: (bounds) =>
                                        LinearGradient(
                                          colors: customColors.buttonColors,
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
                                      "Terms & Conditions",
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      color: AppColors.white,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: PoppinsText(
                                  context,
                                  " and ",
                                  fontSize: PoppinsFontSizeVariant.size12,
                                  color: customColors.textColor,
                                  fontWeight: PoppinsFontWeightVariant.regular,
                                ),
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: ShaderMask(
                                    shaderCallback: (bounds) =>
                                        LinearGradient(
                                          colors: customColors.buttonColors,
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
                                      "Privacy Policy.",
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      color: AppColors.white,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 40)),

                  AppButton(
                    onPressed: () {
                      context.goNamed(AppRoutes.createAccountCodeScreen.name);
                    },
                    title: "Create Account",
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 40)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PoppinsText(
                        context,
                        "Already have an account?",
                        fontSize: PoppinsFontSizeVariant.size14,
                        fontWeight: PoppinsFontWeightVariant.medium,
                        color: customColors.textColor,
                      ),
                      SizedBox(width: AppScaler.scaleSize(context, 10)),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRoutes.loginScreen.name);
                        },
                        child: ShaderMask(
                          shaderCallback: (bounds) =>
                              LinearGradient(
                                colors: [Color(0xFF1FCFFF), Color(0xFF0063FF)],
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
                            "Sign in",
                            fontSize: PoppinsFontSizeVariant.size14,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 50)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
