import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class RemovePopup extends StatefulWidget {
  const RemovePopup({super.key});

  @override
  State<RemovePopup> createState() => _RemovePopupState();
}

class _RemovePopupState extends State<RemovePopup> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Container(
      height: AppScaler.scaleHeight(context, 350),
      width: double.infinity,
      padding: EdgeInsets.only(
        top: AppScaler.scaleHeight(context, 24),
        bottom: AppScaler.scaleHeight(context, 24),
        left: AppScaler.scaleSize(context, 20),
        right: AppScaler.scaleSize(context, 20),
      ),
      decoration: BoxDecoration(
        color: customColors.regular,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.images.delete123.path,
            height: AppScaler.scaleHeight(context, 54),
            width: AppScaler.scaleSize(context, 54),
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 40)),
          PoppinsText(
            context,
            "Are you sure you want to remove this?",
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 40),
          AppButton(
            buttonSize: Size(316, 45),

            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();

              context.pushNamed(AppRoutes.watchlist.name);
            },
            title: "Yes, Remove",
          ),

          SizedBox(height: 11),
          AppButton(
            buttonSize: Size(316, 45),
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
