import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/theme/app_scalar.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';

class SignupVerification extends StatefulWidget {
  const SignupVerification({super.key});

  @override
  State<SignupVerification> createState() => _SignupVerificationState();
}

class _SignupVerificationState extends State<SignupVerification> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.screensbg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppScaler.scaleSize(context, 20),
          vertical: AppScaler.scaleHeight(context, 80),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(Assets.images.logo2.path),
            Column(
              children: [
                PoppinsText(
                  context,
                  "Success! We've Created Your Account. Verify Your Account to Log In..!",
                  fontSize: PoppinsFontSizeVariant.size24,
                  fontWeight: PoppinsFontWeightVariant.semiBold,
                  textAlign: TextAlign.center,
                  color: customColors.textColor,
                  decoration: TextDecoration.none,
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 60)),
                AppButton(
                  onPressed: () {
                    context.pushReplacementNamed(AppRoutes.loginScreen.name);
                  },
                  title: "Continue",
                ),
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
