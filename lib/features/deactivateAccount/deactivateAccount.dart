// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../core/theme/app_scalar.dart';
import '../../shared/widgets/popupmenuitem/deactivate_popup_widget.dart';

class DeactivateAccountScreen extends StatefulWidget {
  const DeactivateAccountScreen({super.key});

  @override
  State<DeactivateAccountScreen> createState() =>
      _DeactivateAccountScreenState();
}

class _DeactivateAccountScreenState extends State<DeactivateAccountScreen> {
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
          padding: EdgeInsets.symmetric(
            horizontal: AppScaler.scaleSize(context, 12),
            vertical: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppMainBar(
                leading: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.of(context).pop(),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: AppScaler.scaleSize(context, 20),
                    height: AppScaler.scaleHeight(context, 20),
                  ),
                ),
                title: "",
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 30)),
              PoppinsText(
                context,
                'Deactivate Account',
                fontSize: PoppinsFontSizeVariant.size24,
                fontWeight: PoppinsFontWeightVariant.semiBold,
                color: customColors.textColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 5)),
              PoppinsText(
                context,
                'Temporarily pause your account',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 20)),
              PoppinsText(
                context,
                'What happens when you deactivate:',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: customColors.textColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 10)),
              PoppinsText(
                context,
                '• All your data will be preserved',
                fontSize: PoppinsFontSizeVariant.size12,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 6)),
              PoppinsText(
                context,
                '• You can reactivate anytime by signing in',
                fontSize: PoppinsFontSizeVariant.size12,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 30)),
              AppButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: DeactivatePopupWidget(),
                    ),
                  );
                },
                title: "Deactivate Account",
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 20)),
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
        ),
      ),
    );
  }
}
