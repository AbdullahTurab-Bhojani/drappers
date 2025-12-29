// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/popupmenuitem/delete_popup_widget.dart';

class DeleteDetailScreen extends StatefulWidget {
  const DeleteDetailScreen({super.key});

  @override
  State<DeleteDetailScreen> createState() => _DeleteDetailScreenState();
}

class _DeleteDetailScreenState extends State<DeleteDetailScreen> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppMainBar(
              leading: GestureDetector(
                behavior: HitTestBehavior.opaque,
        
                onTap: () => Navigator.of(context).pop(),
                child: Image.asset(
                  Assets.images.backicon.path,
                  width: 20,
                  height: 20,
                ),
              ),
              title: "",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SizedBox(height: 30),
            PoppinsText(
              'Before you delete your account',
              fontSize: PoppinsFontSizeVariant.size24,
              fontWeight: PoppinsFontWeightVariant.semiBold,
              color: customColors.textColor,
            ),
            SizedBox(height: 20),
            PoppinsText(
              'Would you like to try one of these alternatives\ninstead?',
              fontSize: PoppinsFontSizeVariant.size16,
              fontWeight: PoppinsFontWeightVariant.regular,
              color: customColors.textColor,
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.images.signout1234.path,
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinsText(
                        "Remove devices instead?",
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        color: customColors.textColor,
                      ),
                      SizedBox(height: 6),
                      PoppinsText(
                        "Sign out from specific devices only",
                        fontSize: PoppinsFontSizeVariant.size16,
                        color: customColors.textColor,
                        fontWeight: PoppinsFontWeightVariant.regular,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.images.reset123.path,
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinsText(
                        "Clear watch history only?",
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        color: customColors.textColor,
                      ),
                      SizedBox(height: 6),
                      PoppinsText(
                        "Reset recommendations while keeping\naccount",
                        fontSize: PoppinsFontSizeVariant.size16,
                        color: customColors.textColor,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: customColors.mahroon,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText(
                    "Still want to delete your account?",
                    fontSize: PoppinsFontSizeVariant.size12,
                    fontWeight: PoppinsFontWeightVariant.regular,
                    color: customColors.rednormal,
                  ),
                  SizedBox(height: 6),
                  PoppinsText(
                    "This will permanently remove all your data including "
                    "profiles, watch history, preferences, and any active subscriptions.",
                    fontSize: PoppinsFontSizeVariant.size16,
                    color: customColors.textColor,
                    fontWeight: PoppinsFontWeightVariant.regular,
                  ),
                ],
              ),
            ),
        
            SizedBox(height: 40),
            AppButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    backgroundColor: Colors.transparent,
                    child: DeletePopupWidget(),
                  ),
                );
              },
              title: "Delete Account",
            ),
            SizedBox(height: 20),
            AppButton(
              color: Colors.transparent,
              borderColor: customColors.textColor,
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
    );
  }
}
