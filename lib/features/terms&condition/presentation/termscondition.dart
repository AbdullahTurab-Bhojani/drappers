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
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding:  EdgeInsets.only(left: 20),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: "Terms & Conditions",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColors.submitticket0E0E0E,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: SingleChildScrollView(
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

                        _title("1. Acceptance of Terms", customColors),
                        _body(
                          "By accessing or using Draper TV, you acknowledge that you have read, "
                          "understood, and agree to be bound by these Terms of Use. If you do not "
                          "agree to these terms, please do not use the website.",
                          customColors,
                        ),

                        _title("2. Registration", customColors),
                        _body(
                          "Accessing certain features on Draper TV may require free registration. "
                          "You are responsible for providing accurate and updated information. "
                          "You must be at least 13 years old to register.",
                          customColors,
                        ),

                        _title("3. User Eligibility", customColors),
                        _body(
                          "Draper TV is intended for all ages and users from all demographic backgrounds. "
                          "By using the website, you affirm that you meet the minimum age requirement.",
                          customColors,
                        ),

                        _title("4. Content and Advertising", customColors),
                        _body(
                          "Draper TV focuses on entrepreneurship and investment content and may contain ads.",
                          customColors,
                        ),

                        _title("5. Intellectual Property", customColors),
                        _body(
                          "All content on Draper TV is the property of Draper Productions or its licensors. "
                          "You may not copy or distribute any content without permission.",
                          customColors,
                        ),

                        _title("6. Limitation of Liability", customColors),
                        _body(
                          "Draper Productions does not guarantee the accuracy of the information on the site. "
                          "Use the website at your own risk.",
                          customColors,
                        ),

                        _title("7. Modifications to Terms", customColors),
                        _body(
                          "Draper Productions may modify these terms at any time. Continued use of the "
                          "website means you accept the new terms.",
                          customColors,
                        ),

                        _title("8. Governing Law", customColors),
                        _body(
                          "These terms are governed by the laws of Draper Productions' jurisdiction.",
                          customColors,
                        ),

                        _title("9. Contact Information", customColors),
                        _body(
                          "For inquiries, contact us at hello@drapertv.com",
                          customColors,
                        ),

                        SizedBox(height: 20),
                      ],
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

  Widget _title(String text, AppCustomColors colors) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: PoppinsText(
        text,
        color: colors.textColor,
        fontSize: PoppinsFontSizeVariant.size16,
        fontWeight: PoppinsFontWeightVariant.medium,
      ),
    );
  }

  Widget _body(String text, AppCustomColors colors) {
    return PoppinsText(
      text,
      color: colors.textColor,
      fontSize: PoppinsFontSizeVariant.size12,
      fontWeight: PoppinsFontWeightVariant.regular,
    );
  }
}
