import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class SignupPopupWidget extends StatefulWidget {
  final bool showSaveIcon;

  const SignupPopupWidget({super.key, this.showSaveIcon = true});

  @override
  State<SignupPopupWidget> createState() => _SignupPopupWidget();
}

class _SignupPopupWidget extends State<SignupPopupWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Container(
      height: 350,
      width: double.infinity,
      padding: EdgeInsets.only(top: 24, bottom: 24, left: 32, right: 32),
      decoration: BoxDecoration(
        color: customColors.regular,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.images.logout123.path, height: 54, width: 54),
          SizedBox(height: 40),
          PoppinsText(
            "Are you sure you want to Sign Out?",
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          AppButton(
            onPressed: () {
              context.pushNamed(AppRoutes.loginScreen.name);
            },
            title: "Sign Out",
          ),

          SizedBox(height: 14),
          AppButton(
            color: Colors.transparent,
            borderColor: customColors.greyColor,
            borderWidth: 1,
            border: true,
            onPressed: () {
              context.pop();
            },
            title: "Cancel",
          ),
        ],
      ),
    );
  }
}
