import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/textfield_new.dart';

class UpdatepasswordScreen extends StatefulWidget {
  const UpdatepasswordScreen({super.key});

  @override
  State<UpdatepasswordScreen> createState() => _UpdatepasswordScreenState();
}

class _UpdatepasswordScreenState extends State<UpdatepasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
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
                behavior: HitTestBehavior.opaque,

                onTap: () {
                  context.goNamed(AppRoutes.verfiicationcodeScreen.name);
                },
                child: Image.asset(Assets.images.backicon.path),
              ),
              SizedBox(height: 40),
              PoppinsText(
                "Update your password",
                fontSize: PoppinsFontSizeVariant.size24,
                fontWeight: PoppinsFontWeightVariant.semiBold,
                color: customColors.textColor,
              ),
              SizedBox(height: 40),
              AppPasswordField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: _passwordController,
                labelText: "New Password",
                hintText: "********",
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return "Full name required";
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 15),
              AppPasswordField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: _confirmPasswordController,
                labelText: "Confirm Password*",
                hintText: "********",
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return "Full name required";
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 15),
              PoppinsText(
                "Make sure your password has at least 8 characters, including a letter, a number, and a symbol!",
                fontSize: PoppinsFontSizeVariant.size12,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.greyColor,
              ),
              SizedBox(height: 40),
              AppButton(
                onPressed: () {
                  context.goNamed(AppRoutes.loginScreen.name);
                },
                title: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
