// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/textfield_new.dart';

class ReportContentSomehingElse extends StatefulWidget {
  const ReportContentSomehingElse({super.key});

  @override
  State<ReportContentSomehingElse> createState() =>
      _ReportContentSomehingElseState();
}

enum AccountOption { deactivate, delete }

class _ReportContentSomehingElseState extends State<ReportContentSomehingElse> {
  final TextEditingController _controller = TextEditingController();
  final int _charCount = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    const double horizontalPadding = 15.0;

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
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: "",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PoppinsText(
                      "Report Content",
                      fontSize: PoppinsFontSizeVariant.size24,
                      fontWeight: PoppinsFontWeightVariant.semiBold,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: 20),
                    PoppinsText(
                      "Help us improve your experience by sharing what's wrong.",
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: 30),
                    PoppinsText(
                      "Provide Details",
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: 5),
                    PoppinsText(
                      "(Help us understand the specific issue.)",
                      fontSize: PoppinsFontSizeVariant.size12,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: 12.0),
                    NewTextField(
                      fieldbg: customColors.bgcontainerlight,
                      controller: _controller,
                      labelText: "Description",
                      hintText: "Add reason",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        color: customColors.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 5,
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: PoppinsText(
                        '$_charCount/500 characters',
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        color: customColors.labelColor,
                      ),
                    ),

                    SizedBox(height: 30),
                    PoppinsText(
                      'Optional Attachments',
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(12),
                      height: 55,
                      width: 400,
                      decoration: BoxDecoration(
                        color: customColors.bgcontainerlight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.images.screenshoticon.path,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 8),
                          PoppinsText(
                            'Add Screenshot',
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.textColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    AppButton(
                      onPressed: () {
                        context.goNamed(AppRoutes.home.name);
                      },
                      title: "Submit",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
