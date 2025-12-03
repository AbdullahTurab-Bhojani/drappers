import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class DeletePopupWidget extends StatefulWidget {
  final bool showSaveIcon;

  const DeletePopupWidget({super.key, this.showSaveIcon = true});

  @override
  State<DeletePopupWidget> createState() => _DeletePopupWidget();
}

class _DeletePopupWidget extends State<DeletePopupWidget> {
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
          Image.asset(Assets.images.delete123.path, height: 54, width: 54),
          SizedBox(height: 40),
          PoppinsText(
            "Are you sure you want to delete",
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
          PoppinsText(
            "your account?",
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
          SizedBox(height: 40),
          AppButton(
            onPressed: () {
              context.pushNamed(AppRoutes.loginScreen.name);
            },
            title: "Yes, delete",
          ),

         
          SizedBox(height: 11),
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
