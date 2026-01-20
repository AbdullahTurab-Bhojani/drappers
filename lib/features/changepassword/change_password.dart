// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../core/theme/app_scalar.dart';
import '../../shared/widgets/popupmenuitem/changepassword_popup_widget.dart';
import '../../shared/widgets/textfield_new.dart';
import '../authentication/data/dto/reset_dto/reset_password_dto.dart';
import 'provider/change_password_provider.dart';

class ChangePassword extends ConsumerStatefulWidget {
  const ChangePassword({super.key});

  @override
  ConsumerState<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<ChangePassword> {
  bool isPhone = true;
  bool isShow = false;

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  bool _isStrongPassword(String value) {
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&]).{8,}$');
    return regex.hasMatch(value);
  }

  Future<void> _onChangePassword() async {
    if (!_formKey.currentState!.validate()) return;

    if (newPasswordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    setState(() => isLoading = true);

    try {
      final dto = ResetPasswordDTO(
        newPassword: newPasswordController.text.trim(),
        temporary: false,
      );

      final message = await ref.read(changePasswordProvider(dto).future);

      if (!mounted) return;

      setState(() => isLoading = false);

      showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: Colors.transparent,
          child: ChangepasswordPopupWidget(),
        ),
      );
    } catch (e) {
      setState(() => isLoading = false);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
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
        child: SingleChildScrollView(
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
                  "Change Password?",
                  fontSize: PoppinsFontSizeVariant.size24,
                  fontWeight: PoppinsFontWeightVariant.semiBold,
                  color: customColors.textColor,
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 24)),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AppPasswordField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: oldPasswordController,
                          labelText: "Old Password*",
                          hintText: "**********",
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Old password required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 15)),
                        AppPasswordField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: newPasswordController,
                          labelText: "Create Password*",
                          hintText: "**********",
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "New password required";
                            }
                            if (!_isStrongPassword(value)) {
                              return 'Password must be 8 chars with letter, number & symbol';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 15)),
                        AppPasswordField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: confirmPasswordController,
                          labelText: "Confirm Password*",
                          hintText: "**********",
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Confirm password required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 10)),
                        PoppinsText(
                          context,
                          "Make sure your password has at least 8 characters, including a letter, a number, and a symbol!",
                          fontSize: PoppinsFontSizeVariant.size11,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          color: customColors.greyColor,
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 24)),
                        AppButton(
                          onPressed: () {
                            if (!isLoading) {
                              _onChangePassword();
                            }
                          },
                          title: isLoading
                              ? 'Please wait...'
                              : 'Change Password',
                        ),
                        // SizedBox(height: AppScaler.scaleHeight(context, 45)),

                        // GestureDetector(
                        //   behavior: HitTestBehavior.opaque,
                        //   onTap: () {
                        //     context.pushNamed(
                        //       AppRoutes.forgetpasswordScreen.name,
                        //     );
                        //   },
                        //   child: PoppinsText(
                        //     context,
                        //     'Forgot Password?',
                        //     decoration: TextDecoration.underline,
                        //     fontSize: PoppinsFontSizeVariant.size14,
                        //     fontWeight: PoppinsFontWeightVariant.medium,
                        //     color: AppColors.white,
                        //   ),
                        // ),
                      ],
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
