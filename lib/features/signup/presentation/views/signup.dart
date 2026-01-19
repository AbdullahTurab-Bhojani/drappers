import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/theme/app_scalar.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/phonefield_code.dart';
import '../../../../shared/widgets/textfield_new.dart';
import '../../../authentication/data/dto/sign_up_dto/sign_up.dart';
import '../../provider/signup_provider.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool rememberMe = false;

  Country selectedCountry = Country.parse('US');

  void onRememberMeChanged(bool? value) {
    setState(() {
      rememberMe = value ?? false;
    });
  }

  Future<void> onSubmit() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      if (!rememberMe && mounted) {
        Fluttertoast.showToast(
          msg: "Please accept terms & conditions to sign up.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0,
        );
      }
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      Fluttertoast.showToast(
        msg: "Password and Confirm Password do not match",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0,
      );
      return;
    }

    final phoneNumber =
        '+${selectedCountry.phoneCode}${_phoneController.text.trim()}';

    final notifier = ref.read(signUpProviderProvider.notifier);

    try {
      final result = await notifier.onSubmit(
        signUpDto: SignUpDto(
          fullName: _fullNameController.text.trim(),
          email: _emailController.text.trim(),
          phoneNumber: phoneNumber,
          password: _passwordController.text,
        ),
      );

      if (!mounted) return;

      Fluttertoast.showToast(
        msg: result.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0,
      );

      if (result.isSuccess) {
        context.pushNamed(AppRoutes.signupVerification.name);
      }
    } catch (e) {
      if (!mounted) return;

      Fluttertoast.showToast(
        msg: e.toString().replaceFirst('Exception: ', ''),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0,
      );
    }
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

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppScaler.scaleSize(context, 15),
                    ),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: AppScaler.scaleHeight(context, 36),
                            ),
                            NewTextField(
                              fieldbg: AppColors.tfield,
                              controller: _fullNameController,
                              labelText: "Full Name*",
                              hintText: "John Mackson",
                              filledColor: AppColors.tfield,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Full name required";
                                }
                                if (value.trim().length < 3) {
                                  return "Full name must be at least 3 characters";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: AppScaler.scaleHeight(context, 15),
                            ),
                            NewTextField(
                              fieldbg: AppColors.tfield,
                              controller: _emailController,
                              labelText: "Enter your Email Address*",
                              hintText: "jerrymackson@gmail.com",
                              filledColor: AppColors.tfield,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Email Address required";
                                }
                                final emailRegex = RegExp(
                                  r'^[^@]+@[^@]+\.[^@]+',
                                );
                                if (!emailRegex.hasMatch(value)) {
                                  return "Enter a valid email";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: AppScaler.scaleHeight(context, 15),
                            ),
                            PhoneOtpField(
                              phoneController: _phoneController,
                              otpController: otpController,
                              fieldbg: AppColors.tfield,
                              labelText: 'Phone Number*',
                              onSendCode: () {},
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Phone number required";
                                }
                                if (value.trim().length < 10) {
                                  return "Enter a valid phone number";
                                }
                                return null;
                              },
                              countryCode: selectedCountry,
                            ),
                            AppPasswordField(
                              keyboardType: TextInputType.text,
                              controller: _passwordController,
                              labelText: "Create Password*",
                              hintText: "**********",
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Password required";
                                }
                                if (value.trim().length < 6) {
                                  return "Password must be at least 6 characters";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: AppScaler.scaleHeight(context, 15),
                            ),
                            AppPasswordField(
                              keyboardType: TextInputType.text,
                              controller: _confirmPasswordController,
                              labelText: "Confirm Password*",
                              hintText: "**********",
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Confirm Password required";
                                }
                                if (value != _passwordController.text) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: AppScaler.scaleHeight(context, 15),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: AppScaler.scaleHeight(context, 14),
                                  width: AppScaler.scaleSize(context, 14),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () =>
                                        onRememberMeChanged(!rememberMe),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: rememberMe
                                            ? null
                                            : Border.all(
                                                color: AppColors.white,
                                              ),
                                      ),
                                      child: rememberMe
                                          ? Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                gradient: LinearGradient(
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
                                SizedBox(
                                  width: AppScaler.scaleSize(context, 5),
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: PoppinsText(
                                            context,
                                            "I agree to the ",
                                            fontSize:
                                                PoppinsFontSizeVariant.size12,
                                            color: customColors.textColor,
                                            fontWeight: PoppinsFontWeightVariant
                                                .regular,
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: ShaderMask(
                                            shaderCallback: (bounds) =>
                                                LinearGradient(
                                                  colors:
                                                      customColors.buttonColors,
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
                                              fontSize:
                                                  PoppinsFontSizeVariant.size12,
                                              color: AppColors.white,
                                              fontWeight:
                                                  PoppinsFontWeightVariant
                                                      .regular,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: PoppinsText(
                                            context,
                                            " and ",
                                            fontSize:
                                                PoppinsFontSizeVariant.size12,
                                            color: customColors.textColor,
                                            fontWeight: PoppinsFontWeightVariant
                                                .regular,
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: ShaderMask(
                                            shaderCallback: (bounds) =>
                                                LinearGradient(
                                                  colors:
                                                      customColors.buttonColors,
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
                                              fontSize:
                                                  PoppinsFontSizeVariant.size12,
                                              color: AppColors.white,
                                              fontWeight:
                                                  PoppinsFontWeightVariant
                                                      .regular,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppScaler.scaleHeight(context, 40),
                            ),
                            // Submit Button
                            AppButton(
                              onPressed: onSubmit,
                              title: "Create Account",
                            ),
                            SizedBox(
                              height: AppScaler.scaleHeight(context, 40),
                            ),
                            // Already have account
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
                                SizedBox(
                                  width: AppScaler.scaleSize(context, 10),
                                ),
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
                                        AppRoutes.loginScreen.name,
                                      );
                                    },
                                    child: PoppinsText(
                                      context,
                                      "Sign in",
                                      fontSize: PoppinsFontSizeVariant.size14,
                                      fontWeight:
                                          PoppinsFontWeightVariant.medium,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppScaler.scaleHeight(context, 50),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
