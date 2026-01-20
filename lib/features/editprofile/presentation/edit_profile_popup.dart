import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class EditProfilePopup extends StatefulWidget {
  const EditProfilePopup({super.key});

  @override
  State<EditProfilePopup> createState() => _EditProfilePopupState();
}

class _EditProfilePopupState extends State<EditProfilePopup> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: customColors.regular,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PoppinsText(
                context,
                'Customise picture',
                fontSize: PoppinsFontSizeVariant.size18,
                fontWeight: PoppinsFontWeightVariant.semiBold,
              ),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Image.asset(
                  Assets.images.crossnewicon.path,
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: 26),
          Image.asset(
            Assets.images.editprofileimage.path,
            height: 190,
            width: 190,
          ),
          SizedBox(height: 24),
          AppButton(
            buttonSize: Size(double.infinity, 40),
            onPressed: () {
              context.pop();
            },
            title: "Save Changes",
          ),
          SizedBox(height: 16),
          AppButton(
            buttonSize: Size(double.infinity, 40),
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
    );
  }
}
