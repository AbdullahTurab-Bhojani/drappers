import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/textfield_new.dart';

class UpdatepasswordScreen extends StatefulWidget {
  final bool openDialogOnContinue;

  const UpdatepasswordScreen({super.key, this.openDialogOnContinue = true});

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
                "Update your password",
                fontSize: PoppinsFontSizeVariant.size24,
                fontWeight: PoppinsFontWeightVariant.semiBold,
                color: customColors.textColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 40)),
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
              SizedBox(height: AppScaler.scaleHeight(context, 15)),
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
              SizedBox(height: AppScaler.scaleHeight(context, 15)),
              PoppinsText(
                context,
                "Make sure your password has at least 8 characters, including a letter, a number, and a symbol!",
                fontSize: PoppinsFontSizeVariant.size12,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.greyColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 40)),
              AppButton(
                onPressed: () {
                  // if (widget.openDialogOnContinue) {
                  //   showDialog(
                  //     context: context,
                  //     builder: (context) => Dialog(
                  //       backgroundColor: Colors.transparent,
                  //       child: ChangepasswordPopupWidget(),
                  //     ),
                  //   );
                  // } else {
                  context.pushNamed(AppRoutes.loginScreen.name);
                  // }
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
