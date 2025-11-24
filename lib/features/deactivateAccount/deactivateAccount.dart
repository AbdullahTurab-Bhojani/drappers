import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
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
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppMainBar(
                leadingIcon: Icons.arrow_back_ios,
                title: "",
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              SizedBox(height: 30),
              PoppinsText(
                'Deactivate Account',
                fontSize: PoppinsFontSizeVariant.size24,
                fontWeight: PoppinsFontWeightVariant.semiBold,
                color: customColors.textColor,
              ),
              SizedBox(height: 20),
              PoppinsText(
                'Temporarily pause your account',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
              ),
              SizedBox(height: 30),
              PoppinsText(
                'What happens when you deactivate:',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: customColors.textColor,
              ),
              SizedBox(height: 16),
              PoppinsText(
                '• All your data will be preserved',
                fontSize: PoppinsFontSizeVariant.size12,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
              ),
              SizedBox(height: 6),
              PoppinsText(
                '• You can reactivate anytime by signing in',
                fontSize: PoppinsFontSizeVariant.size12,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
              ),
              SizedBox(height: 40),
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
              SizedBox(height: 20),
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
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
