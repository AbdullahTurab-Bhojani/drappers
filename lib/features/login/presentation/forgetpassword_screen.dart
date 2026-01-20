// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/textfield_new.dart';
import '../providers/forget_provider.dart';

class ForgetpasswordScreen extends ConsumerStatefulWidget {
  const ForgetpasswordScreen({super.key});

  @override
  ConsumerState<ForgetpasswordScreen> createState() =>
      _ForgetpasswordScreenState();
}

class _ForgetpasswordScreenState extends ConsumerState<ForgetpasswordScreen> {
  final _emailController = TextEditingController();
  bool isLoading = false;

  bool isPhone = true;

  void submitForgetPassword() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    final email = _emailController.text.trim();
    setState(() {
      isLoading = true;
    });
    try {
      final message = await ref.read(forgetPasswordProvider(email).future);

      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
      context.pushNamed(AppRoutes.loginScreen.name);
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        child: Padding(
          padding: EdgeInsets.only(
            left: AppScaler.scaleSize(context, 20),
            right: AppScaler.scaleSize(context, 20),
            top: AppScaler.scaleHeight(context, 118),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,

                onTap: () {
                  context.pop();
                },
                child: Image.asset(Assets.images.backicon.path),
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 40)),
              PoppinsText(
                context,
                "Forget Password?",
                fontSize: PoppinsFontSizeVariant.size24,
                fontWeight: PoppinsFontWeightVariant.semiBold,
                color: customColors.textColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 4)),
              PoppinsText(
                context,
                'Don’t worry, this happens.',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 36)),

              PoppinsText(
                context,
                'Receive Code Via email',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 24)),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
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
                      // RadioTileWidget(
                      //   selected: isPhone,
                      //   title: "Enter Your Email ",
                      //   subtitle: "jo********@gmail.co|",
                      //   onTap: () {
                      //     setState(() {
                      //       isPhone = true;
                      //     });
                      //   },
                      // ),

                      // RadioTileWidget(
                      //   selected: !isPhone,
                      //   title: "Enter Phone ",
                      //   subtitle: "03xxxxxxx59",
                      //   onTap: () {
                      //     setState(() {
                      //       isPhone = false;
                      //     });
                      //   },
                      // ),
                      SizedBox(height: AppScaler.scaleHeight(context, 24)),
                      AppButton(
                        onPressed: () {
                          if (!isLoading) {
                            submitForgetPassword();
                          }
                        },
                        title: isLoading ? 'Loading...' : 'Submit',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioTileWidget extends StatelessWidget {
  final bool selected;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const RadioTileWidget({
    super.key,
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppScaler.scaleHeight(context, 8),
        ),
        margin: EdgeInsets.only(bottom: AppScaler.scaleHeight(context, 14)),
        decoration: BoxDecoration(
          color: Color(0xFF101317),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Radio(
                value: true,
                groupValue: selected,
                onChanged: (_) => onTap(),
                activeColor: Colors.blue,
              ),
            ),
            // SizedBox(width: 8),
            Container(
              width: AppScaler.scaleSize(context, 0.5),
              height: AppScaler.scaleHeight(context, 24),
              color: AppColors.white,
            ),
            SizedBox(width: AppScaler.scaleSize(context, 12)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText(
                  context,
                  title,
                  fontSize: PoppinsFontSizeVariant.size12,
                  color: AppColors.bGrey,
                  fontWeight: PoppinsFontWeightVariant.regular,
                ),
                PoppinsText(
                  context,
                  subtitle,
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
