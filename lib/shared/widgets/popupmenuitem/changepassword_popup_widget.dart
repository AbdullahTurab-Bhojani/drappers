import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class ChangepasswordPopupWidget extends StatefulWidget {
  const ChangepasswordPopupWidget({super.key});

  @override
  State<ChangepasswordPopupWidget> createState() =>
      _ChangepasswordPopupWidgetState();
}

class _ChangepasswordPopupWidgetState extends State<ChangepasswordPopupWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: AppScaler.scaleHeight(context, 24),
        bottom: AppScaler.scaleHeight(context, 24),
        left: AppScaler.scaleSize(context, 32),
        right: AppScaler.scaleSize(context, 32),
      ),
      decoration: BoxDecoration(
        color: customColors.regular,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.check.path,
            height: AppScaler.scaleHeight(context, 54),
            width: AppScaler.scaleSize(context, 54),
          ),

          SizedBox(height: AppScaler.scaleHeight(context, 40)),

          PoppinsText(
            context,
            'Your password is changed',
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: AppScaler.scaleHeight(context, 40)),

          AppButton(
            buttonSize: Size(316, 45),
            borderColor: customColors.greyColor,
            borderWidth: 1,
            border: true,
            onPressed: () {
              context.pushNamed(AppRoutes.settingpreferencesScreen.name);
            },
            title: "Close",
          ),
        ],
      ),
    );
  }
}
