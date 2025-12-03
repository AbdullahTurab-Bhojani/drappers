// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../shared/widgets/textfield_new.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});
  

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isPhone = true;
  bool isShow = false;

 final TextEditingController _changePasswordController =
  TextEditingController();

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
          padding: EdgeInsets.only(left: 20, right: 20, top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  context.go('/login');
                },
                child: Image.asset(Assets.images.backicon.path),
              ),
              SizedBox(height: 40),
              PoppinsText(
                "Change Password?",
                fontSize: PoppinsFontSizeVariant.size24,
                fontWeight: PoppinsFontWeightVariant.semiBold,
                color: customColors.textColor,
              ),
              SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Column(
                  children: [
                    AppPasswordField(
                        controller: _changePasswordController,
                        labelText: "Old Password*",
                        hintText: "123456789",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Full name required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      AppPasswordField(
                        controller: _changePasswordController,
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
                        controller: _changePasswordController, // FIXED
                        labelText: "Confirm Password*",
                        hintText: "**********",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Full name required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      PoppinsText(
                "Make sure your password has at least 8 characters, including a letter, a number, and a symbol!",
                fontSize: PoppinsFontSizeVariant.size11,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.greyColor,
              ),
                      SizedBox(height: 32),
                    AppButton(
                      onPressed: () {
                        context.pop();
                      },
                      title: "Continue",
                    ),
                    SizedBox(height: 40),
              GestureDetector(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

