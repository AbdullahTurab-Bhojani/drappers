import 'package:flutter/material.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';

class Termscondition extends StatefulWidget {
  const Termscondition({super.key});

  @override
  State<Termscondition> createState() => _TermsconditionState();
}

class _TermsconditionState extends State<Termscondition> {
  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    final double paddingValue = 20.0;
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
              leadingIcon: Icons.arrow_back_ios,
              title: "Terms & Conditions",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: customColors.regular,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    paddingValue,
                    24,
                    paddingValue,
                    24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinsText(
                        "Welcome to Draper TV, an online platform owned by Draper Productions.",
                        color: customColors.textColor,
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                      ),

                      SizedBox(height: 16),

                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: PoppinsText(
                          "1. Acceptance of Terms",
                          color: customColors.textColor,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                      PoppinsText(
                        "By accessing or using Draper TV, you acknowledge that you \nhave read, understood, and agree to be bound by these Terms \nof Use. If you do not agree to these terms, please do not use the \nwebsite.",
                        color: customColors.textColor,
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                        child: PoppinsText(
                          "2. Purpose of Collection",
                          color: customColors.textColor,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                      PoppinsText(
                        "We collect this information for the purpose of sending newsletters to our subscribers.",
                        color: customColors.textColor,
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                      ),

                      // --- 3. Cookies and Tracking Technologies ---
                      Padding(
                        padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                        child: PoppinsText(
                          "3. Cookies and Tracking Technologies",
                          color: customColors.textColor,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                      PoppinsText(
                        "We use Google Analytics to track website traffic and gather information about how visitors use our site. This information is used for internal purposes only and helps us improve our website.",
                        color: customColors.textColor,
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                      ),

                      // --- 4. Sharing of Personal Information ---
                      Padding(
                        padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                        child: PoppinsText(
                          "4. Sharing of Personal Information",
                          color: customColors.textColor,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                      PoppinsText(
                        "We do not share the personal information we collect with any third parties.",
                        color: customColors.textColor,
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                      ),

                      // --- 5. Data Security ---
                      Padding(
                        padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                        child: PoppinsText(
                          "5. Data Security",
                          color: customColors.textColor,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                      PoppinsText(
                        "We take appropriate measures to protect the personal information we collect. This includes using secure servers and encryption methods.",
                        color: customColors.textColor,
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                      ),

                      // --- 6. Data Retention ---
                      Padding(
                        padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                        child: PoppinsText(
                          "6. Data Retention",
                          color: customColors.textColor,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                      PoppinsText(
                        "We retain the personal information you provide for an indefinite period, unless you request its deletion.",
                        color: customColors.textColor,
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                      ),

                      // --- 7. Opt-Out Option ---
                      Padding(
                        padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                        child: PoppinsText(
                          "7. Opt-Out Option",
                          color: customColors.textColor,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                      PoppinsText(
                        "If you no longer wish to receive our newsletters, you can opt-out by following the unsubscribe instructions provided in the email or by contacting us directly.",
                        color: customColors.textColor,
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                      ),

                      SizedBox(height: 50.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
 
 
 
  }
}