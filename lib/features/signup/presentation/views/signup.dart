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
  bool _agreedToTerms = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                        hintText: "Enter your full name",
                        filledColor: AppColors.tfield,
                        // validator: (value) {
                        //   if (value == null || value.trim().isEmpty) {
                        //     return "Full name required";
                        //   }
                        //   return null;
                        // },
                      ),
                      SizedBox(height: 15),

                      // Email Address
                      NewTextField(
                        fieldbg: AppColors.tfield,

                        controller: _emailController,
                        labelText: "Email Address",
                        hintText: "Enter your email",
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
                        labelText: "Phone Number",
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
                        labelText: "Create Password",
                        hintText: "Enter your Password ",
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
                        labelText: "Confirm Password",
                        hintText: "Enter Confirm your Password",
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
                          Transform.scale(
                            scale: 0.6,
                            child: Checkbox(
                              value: _agreedToTerms,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  _agreedToTerms = newValue ?? false;
                                });
                              },
                              activeColor: customColors.light,
                              checkColor: Colors.white,
                              side: BorderSide(
                                color: customColors.textColor,
                                width: 0.9,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: RichText(
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
                                        child: PoppinsText(
                                          "Terms & Conditions",
                                          fontSize:
                                              PoppinsFontSizeVariant.size12,
                                          color:
                                              customColors.buttonColors.first,
                                          fontWeight:
                                              PoppinsFontWeightVariant.regular,

                                          decoration: TextDecoration.underline,
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
                                        child: PoppinsText(
                                          "Privacy Policy.",
                                          fontSize:
                                              PoppinsFontSizeVariant.size12,
                                          color: customColors.buttonColors.last,
                                          fontWeight:
                                              PoppinsFontWeightVariant.regular,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                        children: [
                          Expanded(
                            child: Container(
                              height: 52,
                              decoration: BoxDecoration(
                                color: customColors.bgcontainerlight,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 52,
                                    width: 52,

                                    decoration: BoxDecoration(
                                      // color: customColors.bgcontainerlight,
                                      // borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          Assets.images.googlelogo.path,
                                        ),
                                      ),
                                    ),
                                  ),
                                  PoppinsText(
                                    "Google",
                                    fontSize: PoppinsFontSizeVariant.size16,
                                    fontWeight: PoppinsFontWeightVariant.medium,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 52,
                              decoration: BoxDecoration(
                                color: customColors.bgcontainerlight,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Container(
                                    height: 52,
                                    width: 52,

                                    decoration: BoxDecoration(
                                      // color: customColors.bgcontainerlight,
                                      // borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          Assets.images.applelogo.path,
                                        ),
                                      ),
                                    ),
                                  ),
                                  PoppinsText(
                                    "Apple",
                                    fontSize: PoppinsFontSizeVariant.size16,
                                    fontWeight: PoppinsFontWeightVariant.medium,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Expanded(
                          //   child: Container(
                          //     height: 52,
                          //     decoration: BoxDecoration(
                          //       color: customColors.bgcontainerlight,
                          //       borderRadius: BorderRadius.circular(30),
                          //       image: DecorationImage(
                          //         image: AssetImage(Assets.images.applelogo.path),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 52,
                        decoration: BoxDecoration(
                          color: customColors.bgcontainerlight,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: PoppinsText(
                            'Continue as Guest',
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                        ),
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
                                    context.goNamed(AppRoutes.loginScreen.name);
                                  },
                                  child: PoppinsText(
                                    "Sign in",
                                    fontSize: PoppinsFontSizeVariant.size14,
                                    fontWeight: PoppinsFontWeightVariant.medium,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
