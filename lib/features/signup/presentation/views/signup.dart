import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/theme/app_scalar.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/buildradiotile.dart';
import '../../../../shared/widgets/guestloginwidget.dart';
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
        _receiveMethod = null;
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.screensbg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: AppScaler.scaleHeight(context, 110),
                  ),
                  child: Image.asset(
                    Assets.images.logo2.path,
                    width: AppScaler.scaleSize(context, 180),
                    height: AppScaler.scaleHeight(context, 110),
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

            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: AppScaler.scaleSize(context, 15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: AppScaler.scaleHeight(context, 36)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AppButton(
                                buttonSize: Size(
                                  double.infinity,
                                  AppScaler.scaleHeight(context, 52),
                                ),
                                onPressed: () {
                                  context.goNamed(AppRoutes.home.name);
                                },
                                title: 'Google Login',
                                color: AppColors.graylight,
                                prefixIcon: Image.asset(
                                  Assets.images.googleicon.path,
                                  width: AppScaler.scaleSize(context, 26),
                                  height: AppScaler.scaleHeight(context, 26),
                                ),
                                buttonGradient: [
                                  AppColors.graylight,
                                  AppColors.graylight,
                                ],
                              ),
                            ),
                            SizedBox(width: AppScaler.scaleSize(context, 10)),
                            Expanded(
                              child: AppButton(
                                buttonSize: Size(
                                  double.infinity,
                                  AppScaler.scaleHeight(context, 52),
                                ),
                                onPressed: () {
                                  context.goNamed(AppRoutes.home.name);
                                },
                                title: 'Apple Login',
                                color: AppColors.graylight,
                                prefixIcon: Image.asset(
                                  Assets.images.appleicon.path,
                                  width: AppScaler.scaleSize(context, 26),
                                  height: AppScaler.scaleHeight(context, 26),
                                ),
                                buttonGradient: [
                                  AppColors.graylight,
                                  AppColors.graylight,
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 10)),
                        AppButton(
                          buttonSize: Size(
                            double.infinity,
                            AppScaler.scaleHeight(context, 52),
                          ),
                          onPressed: () {
                            GuestHelper.isGuest = true;
                            context.goNamed(AppRoutes.home.name);
                          },
                          buttonGradient: [
                            AppColors.graylight,
                            AppColors.graylight,
                          ],
                          title: 'Continue as Guest',
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 36)),

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
                        SizedBox(height: AppScaler.scaleHeight(context, 15)),

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
                        SizedBox(height: AppScaler.scaleHeight(context, 15)),

                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   decoration: BoxDecoration(
                        //     color: AppColors.tfield,
                        //     borderRadius: BorderRadius.circular(5),
                        //   ),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       PoppinsText(
                        //         context,
                        //         "Receive Code Via",
                        //         fontSize: PoppinsFontSizeVariant.size12,
                        //         fontWeight: PoppinsFontWeightVariant.regular,
                        //         color: customColors.labelColor,
                        //       ),
                        //       SizedBox(
                        //         height: AppScaler.scaleHeight(context, 10),
                        //       ),

                        //       Row(
                        //         children: [
                        //           Expanded(
                        //             child: CustomRadioTile(
                        //               title: 'Email Address',
                        //               value: 'Email',
                        //               groupValue: _receiveMethod,
                        //               onChanged: (value) {
                        //                 setState(() {
                        //                   _receiveMethod = value;
                        //                 });
                        //               },
                        //             ),
                        //           ),
                        //           Expanded(
                        //             child: CustomRadioTile(
                        //               title: 'Phone Number',
                        //               value: 'Phone',
                        //               groupValue: _receiveMethod,
                        //               onChanged: (value) {
                        //                 setState(() {
                        //                   _receiveMethod = value;
                        //                 });
                        //               },
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(height: AppScaler.scaleHeight(context, 15)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: AppScaler.scaleHeight(context, 14),
                              width: AppScaler.scaleSize(context, 14),
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,

                                onTap: () => onRememberMeChanged(!rememberMe),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: rememberMe
                                        ? null
                                        : Border.all(color: AppColors.white),
                                  ),
                                  child: rememberMe
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
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
                            SizedBox(width: AppScaler.scaleSize(context, 5)),
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: PoppinsText(
                                      context,
                                      "I agree to the ",
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      color: customColors.textColor,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
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
                                          context,
                                          "Terms & Conditions",
                                          fontSize:
                                              PoppinsFontSizeVariant.size12,
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
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
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
                                          context,
                                          "Privacy Policy.",
                                          fontSize:
                                              PoppinsFontSizeVariant.size12,
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
                          ],
                        ),

                        SizedBox(height: AppScaler.scaleHeight(context, 40)),
                        AppButton(
                          onPressed: () {
                            context.goNamed(AppRoutes.createAccountCodeScreen.name);
                          },
                          title: "Create Account",
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 60)),
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
                                  context.pushNamed(AppRoutes.loginScreen.name);
                                },
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
          ],
        ),
      ),
    );
  }
}
