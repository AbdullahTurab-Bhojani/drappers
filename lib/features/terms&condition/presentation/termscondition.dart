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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: customColors.regular,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10,),
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
                            "By accessing or using Draper TV, you acknowledge that you have read, understood, and agree to be bound by these Terms of Use. If you do not agree to these terms, please do not use the website.",
                            color: customColors.textColor,
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                            child: PoppinsText(
                              "2. Registration",
                              color: customColors.textColor,
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                            ),
                          ),
                          PoppinsText(
                            "Accessing certain features on Draper TV may require free registration. You are responsible for providing accurate and updated information during the registration process. You must be at least 13 years of age or older to register.",
                            color: customColors.textColor,
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                            child: PoppinsText(
                              "3. User Eligibility",
                              color: customColors.textColor,
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                            ),
                          ),
                          PoppinsText(
                            "Draper TV is intended for all ages and is open to users from all demographic backgrounds. By using the website, you affirm that you meet the minimum age requirement and are eligible to use the platform.",
                            color: customColors.textColor,
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                            child: PoppinsText(
                              "4. Content and Advertising",
                              color: customColors.textColor,
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                            ),
                          ),
                          PoppinsText(
                            "Draper TV provides content focused on entrepreneurship and investment. The website may contain advertising and promotional content. By using the website, you acknowledge that you may encounter advertising materials.",
                            color: customColors.textColor,
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                            child: PoppinsText(
                              "5. Intellectual Property",
                              color: customColors.textColor,
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                            ),
                          ),
                          PoppinsText(
                            "All content and materials on Draper TV, including but not limited to text, images, videos, and trademarks, are the property of Draper Productions or its licensors. Users may not use, modify, or distribute any of the content without prior written consent.",
                            color: customColors.textColor,
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                            child: PoppinsText(
                              "6. Limitation of Liability",
                              color: customColors.textColor,
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                            ),
                          ),
                          PoppinsText(
                            "Draper Productions does not assume any responsibility for the accuracy, completeness, or usefulness of the information provided on Draper TV. The use of the website is at your own risk, and Draper Productions will not be liable for any damages incurred.",
                            color: customColors.textColor,
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                            child: PoppinsText(
                              "7. Modifications to Terms",
                              color: customColors.textColor,
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                            ),
                          ),
                          PoppinsText(
                            "Draper Productions reserves the right to modify or update these Terms of Use at any time without prior notice. Continued use of the website following any changes constitutes acceptance of the modified terms.",
                            color: customColors.textColor,
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                            child: PoppinsText(
                              "8. Governing Law",
                              color: customColors.textColor,
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                            ),
                          ),
                          PoppinsText(
                            "These Terms of Use are governed by and construed in accordance with the laws of the jurisdiction of Draper Productions without regard to its conflict of law provisions.",
                            color: customColors.textColor,
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                            child: PoppinsText(
                              "9. Contact Information",
                              color: customColors.textColor,
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                            ),
                          ),
                          PoppinsText(
                            "For any inquiries or concerns regarding these Terms of Use, please contact us at hello@drapertv.com",
                            color: customColors.textColor,
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                          ),

                          SizedBox(height: 30.0),
                        ],
                      ),
                    ),
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
