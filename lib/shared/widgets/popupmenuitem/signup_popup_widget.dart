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
      height: 340,
      width: double.infinity,
      padding:  EdgeInsets.only(top: 24, bottom: 24, left: 12, right: 12),
      decoration: BoxDecoration(
        color:  customColors.popupdelete,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.images.logout123.path, height: 54, width: 54,),
          SizedBox(height: 40),
           PoppinsText(
                      "Are you sure you want to Sign Out?",
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: customColors.textColor,
                    ),
           SizedBox(height: 40),
            AppButton(
                        onPressed: () {
                          context.pushReplacement(AppRoutes.loginScreen.path);
                        },
                        title: "Sign Out",
                      ),
          // Container(
          //   width: double.infinity,
          //   height: 45,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50),
          //     gradient:  LinearGradient(
          //       colors: [
          //         Color(0xFF23A6F0),
          //         Color(0xFF3C6FF0),
          //       ],
          //     ),
          //   ),
          //   child: Center(
          //     child: PoppinsText(
          //       "Sign Out",
          //       fontSize: PoppinsFontSizeVariant.size16,
          //             fontWeight: PoppinsFontWeightVariant.medium,
          //             color: customColors.textColor,
          //           ),
          //   ),
          // ),

           SizedBox(height: 14),
           AppButtonwithoudbg(
                        onPressed: () {
                          context.pop();
                        },
                        title: "Cancel",
                      ),
          // Container(
          //   width: double.infinity,
          //   height: 45,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(30),
          //     border: Border.all(color: Colors.white.withOpacity(0.3)),
          //   ),
          //   child: Center(
          //     child: PoppinsText(
          //       "Cancel",
          //       fontSize: PoppinsFontSizeVariant.size16,
          //             fontWeight: PoppinsFontWeightVariant.medium,
          //             color: customColors.textColor,
                    
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

