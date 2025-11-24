import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class DeactivatePopupWidget extends StatefulWidget {
  final bool showSaveIcon;

  const DeactivatePopupWidget({super.key, this.showSaveIcon = true});

  @override
  State<DeactivatePopupWidget> createState() => _DeactivatePopupWidget();
}

class _DeactivatePopupWidget extends State<DeactivatePopupWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Container(
      height: 350,
      width: 480,
      padding:  EdgeInsets.only(top: 24, bottom: 24, left: 12, right: 12),
      decoration: BoxDecoration(
        color:  customColors.regular,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.images.ban123.path, height: 54, width: 54,),
          SizedBox(height: 30),
           Center(
             child: PoppinsText(
                        "Are you sure you want to deactivate",
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                        color: customColors.textColor,
                      ),
           ),
            Center(
             child: PoppinsText(
                        "your account?",
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                        color: customColors.textColor,
                      ),
                      
           ),
           SizedBox(height: 30),
            AppButton(
                        onPressed: () {
                          context.pushReplacement(AppRoutes.loginScreen.path);
                        },
                        title: "Yes, deactivate",
                      ),
                       SizedBox(height: 14),
           AppButtonwithoudbg(
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

