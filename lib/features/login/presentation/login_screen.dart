import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/textfield_new.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
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

    return Scaffold(
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 110),
                child: Image.asset(Assets.images.logo2.path),
              ),
              SizedBox(height: 28),
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
                      controller: _emailController,
                      labelText: "Enter your Email Address or Phone*",
                      hintText: "Enter your email",
                      filledColor: AppColors.tfield,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Email required";
                        }
                        if (!value.contains("@")) return "Enter valid email";
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    NewTextField(
                      controller: _emailController,
                      labelText: "Password",
                      hintText: "Enter your Password",
                      filledColor: AppColors.tfield,
                      keyboardType: TextInputType.emailAddress,
                      // sufixIcon: Image.asset(
                      //   Assets.images.hideicon.path
                      // ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Email required";
                        }
                        if (!value.contains("@")) return "Enter valid email";
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
                            onTap: () => onRememberMeChanged(!rememberMe),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: rememberMe
                                    ? null
                                    : Border.all(color: Colors.grey.shade600),
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
                        context.pushReplacement(AppRoutes.dashboard.path);
                      },
                      title: "Continue",
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      height: 52,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            context.goNamed(
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
                      children: [
                        Expanded(
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              color: AppColors.color101010,
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(
                                  Assets.images.googlelogo.path,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              color: AppColors.color101010,
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(Assets.images.applelogo.path),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.color101010,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          'Continue as Guest',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Need to create an account?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: customColors.textColor,
                          ),
                        ),
                        SizedBox(width: 4),
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
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
                                onTap: () {
                                  context.goNamed(AppRoutes.signupScreen.name);
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 1.5,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF1FCFFF),
                                      Color(0xFF0063FF),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String label,
    required String icon,
    required VoidCallback onPressed,
  }) {
    Color inputFieldColor = Color(0xFF17244D);
    const Color textColor = Colors.white;

    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: inputFieldColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white10),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                icon,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
