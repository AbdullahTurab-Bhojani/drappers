import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/buildradiotile.dart';
import '../../../../shared/widgets/textfield_new.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _receiveMethod = 'Email';

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool rememberMe = false;

  void onRememberMeChanged(bool? value) {
    setState(() {
      rememberMe = value ?? false;
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
            child: SafeArea(
              child: SingleChildScrollView(
                // Reduced overall padding
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
                            SizedBox(height: 15), // Reduced spacing
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
                        // validator: (value) {
                        //   if (value == null || value.trim().isEmpty) {
                        //     return "Full name required";
                        //   }
                        //   return null;
                        // },
                      ),
                      SizedBox(height: 15),

                      NewTextField(
                        fieldbg: AppColors.tfield,

                        controller: _emailController,
                        labelText: "Enter your Email Address*",
                        hintText: "Jerrymackson@gmail.com",
                        filledColor: AppColors.tfield,
                        keyboardType: TextInputType.emailAddress,
                        // validator: (value) {
                        //   if (value == null || value.trim().isEmpty) {
                        //     return "Email required";
                        //   }
                        //   if (!value.contains("@")) return "Enter valid email";
                        //   return null;
                        // },
                      ),
                      SizedBox(height: 15),

                      NewTextField(
                        fieldbg: AppColors.tfield,

                        controller: _emailController,
                        // controller: _phoneController,
                        labelText: "Enter your Phone Number*",
                        hintText: "03XXXXXXXXX",
                        filledColor: AppColors.tfield,
                        keyboardType: TextInputType.phone,
                        // validator: (value) {
                        //   if (value == null || value.trim().isEmpty) {
                        //     return "Phone number required";
                        //   }
                        //   if (value.length < 11) return "Enter valid phone";
                        //   return null;
                        // },
                      ),
                      SizedBox(height: 15),

                      AppPasswordField(
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
                        controller: _passwordController,
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          SizedBox(width: 5),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: PoppinsText(
                                    "I agree to the ",
                                    fontSize: PoppinsFontSizeVariant.size12,
                                    color: customColors.textColor,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
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
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
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
                          context.pushReplacement(AppRoutes.home.path);
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
                              Assets.images.googlelogo.path,
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
                              Assets.images.applelogo.path,
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
                          context.goNamed(AppRoutes.home.name);
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
                                context.goNamed(AppRoutes.loginScreen.name);
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
