import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/buildradiotile.dart';
import '../../../../shared/widgets/phonefield_code.dart';
import '../../../../shared/widgets/textfield_new.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _receiveMethod;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final otpController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
      if (email.isNotEmpty && phone.isEmpty) {
        _receiveMethod = "Email";
      } else if (phone.isNotEmpty && email.isEmpty) {
        _receiveMethod = "Phone";
      } else if (email.isNotEmpty && phone.isNotEmpty) {
        _receiveMethod = null; // Both filled → user must choose manually
      }
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Scaffold(
      backgroundColor: customColors.dark,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.screensbg.path),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Image.asset(Assets.images.logo2.path),
                          ),
                          SizedBox(height: 15),
                          PoppinsText(
                            "Get Started with Draper",
                            fontSize: PoppinsFontSizeVariant.size24,
                            fontWeight: PoppinsFontWeightVariant.semiBold,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    NewTextField(
                      fieldbg: AppColors.tfield,
                      controller: _fullNameController,
                      labelText: "Full Name",
                      hintText: "John Mackson",
                      filledColor: AppColors.tfield,
                    ),
                    SizedBox(height: 15),
                    NewTextField(
                      fieldbg: AppColors.tfield,
                      controller: _emailController,
                      labelText: "Enter your Email Address*",
                      hintText: "Jerrymackson@gmail.com",
                      filledColor: AppColors.tfield,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 15),
                    PhoneOtpField(
                      phoneController: _phoneController,
                      otpController: otpController,
                      fieldbg: AppColors.tfield,
                      labelText: 'Phone Number*',
                      onSendCode: () {},
                    ),
                    AppPasswordField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _passwordController,
                      labelText: "Create Password*",
                      hintText: "**********",
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Full name required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    AppPasswordField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _confirmPasswordController,
                      labelText: "Confirm Password*",
                      hintText: "**********",
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Full name required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.tfield,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PoppinsText(
                            "Receive Code Via",
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.labelColor,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: CustomRadioTile(
                                  title: 'Email Address',
                                  value: 'Email',
                                  groupValue: _receiveMethod,
                                  onChanged: (value) {
                                    setState(() {
                                      _receiveMethod = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: CustomRadioTile(
                                  title: 'Phone Number',
                                  value: 'Phone',
                                  groupValue: _receiveMethod,
                                  onChanged: (value) {
                                    setState(() {
                                      _receiveMethod = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Checkbox area
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: PoppinsText(
                                  "I agree to the ",
                                  fontSize: PoppinsFontSizeVariant.size12,
                                  color: customColors.textColor,
                                  fontWeight: PoppinsFontWeightVariant.regular,
                                ),
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,

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
                                      "Terms & Conditions",
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      color: Colors.white,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: PoppinsText(
                                  " and ",
                                  fontSize: PoppinsFontSizeVariant.size12,
                                  color: customColors.textColor,
                                  fontWeight: PoppinsFontWeightVariant.regular,
                                ),
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,

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
                                      "Privacy Policy.",
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      color: Colors.white,
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
                      ],
                    ),

                    const SizedBox(height: 20),
                    AppButton(
                      onPressed: () {
                        context.pushNamed(
                          AppRoutes.createAccountCodeScreen.name,
                        );
                      },
                      title: "Create Account",
                    ),
                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: customColors.labelColor,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: PoppinsText(
                            "or",
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.labelColor,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: customColors.labelColor,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppButton(
                          onPressed: () {},
                          title: 'Google',
                          buttonSize: Size(180, 52),
                          color: Color(0xff202020),
                          prefixIcon: Image.asset(
                            Assets.images.googleicon.path,
                            width: 26,
                            height: 26,
                          ),
                          buttonGradient: [
                            Color(0xff202020),
                            Color(0xff202020),
                          ],
                        ),
                        AppButton(
                          onPressed: () {},
                          title: 'Apple',
                          buttonSize: Size(180, 52),
                          color: Color(0xff202020),
                          prefixIcon: Image.asset(
                            Assets.images.appleicon.path,
                            width: 26,
                            height: 26,
                          ),
                          buttonGradient: [
                            Color(0xff202020),
                            Color(0xff202020),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    AppButton(
                      onPressed: () {
                        context.pushNamed(AppRoutes.home.name);
                      },
                      title: 'Continue as Guest',
                      buttonGradient: [Color(0xff202020), Color(0xff202020)],
                      color: Color(0xff202020),
                    ),

                    SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PoppinsText(
                          "Already have an account?",
                          fontSize: PoppinsFontSizeVariant.size14,
                          fontWeight: PoppinsFontWeightVariant.medium,
                          color: customColors.textColor,
                        ),
                        SizedBox(width: 10),
                        ShaderMask(
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
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,

                            onTap: () {
                              context.pushNamed(AppRoutes.loginScreen.name);
                            },
                            child: PoppinsText(
                              "Sign in",
                              fontSize: PoppinsFontSizeVariant.size14,
                              fontWeight: PoppinsFontWeightVariant.medium,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
