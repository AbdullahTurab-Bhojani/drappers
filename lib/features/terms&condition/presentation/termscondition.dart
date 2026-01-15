import 'package:flutter/material.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/title_subtitle_widget.dart';

class Termscondition extends StatefulWidget {
  const Termscondition({super.key});

  @override
  State<Termscondition> createState() => _TermsconditionState();
}

class _TermsconditionState extends State<Termscondition> {
  final List<Map<String, String>> sections = [
    {
      "title": "1. Acceptance of Terms",
      "subtitle":
          "By accessing or using Draper TV, you acknowledge that you have read, understood, and agree to be bound by these Terms of Use. If you do not agree to these terms, please do not use the website.",
    },
    {
      "title": "2. Registration",
      "subtitle":
          "Accessing certain features on Draper TV may require free registration. You are responsible for providing accurate and updated information. You must be at least 13 years old to register.",
    },
    {
      "title": "3. User Eligibility",
      "subtitle":
          "Draper TV is intended for all ages and users from all demographic backgrounds. By using the website, you affirm that you meet the minimum age requirement.",
    },
    {
      "title": "4. Content and Advertising",
      "subtitle":
          "Draper TV focuses on entrepreneurship and investment content and may contain ads.",
    },
    {
      "title": "5. Intellectual Property",
      "subtitle":
          "All content on Draper TV is the property of Draper Productions or its licensors. You may not copy or distribute any content without permission.",
    },
    {
      "title": "6. Limitation of Liability",
      "subtitle":
          "Draper Productions does not guarantee the accuracy of the information on the site. Use the website at your own risk.",
    },
    {
      "title": "7. Modifications to Terms",
      "subtitle":
          "Draper Productions may modify these terms at any time. Continued use of the website means you accept the new terms.",
    },
    {
      "title": "8. Governing Law",
      "subtitle":
          "These terms are governed by the laws of Draper Productions' jurisdiction.",
    },
    {
      "title": "9. Contact Information",
      "subtitle": "For inquiries, contact us at hello@drapertv.com",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.screensbg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppMainBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: EdgeInsets.only(left: AppScaler.scaleSize(context, 20)),
              child: Image.asset(
                "assets/images/backicon.png",
                width: AppScaler.scaleSize(context, 20),
                height: AppScaler.scaleHeight(context, 20),
              ),
            ),
          ),
          title: "Terms & Conditions",
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppScaler.scaleSize(context, 20),
            vertical: AppScaler.scaleHeight(context, 16),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppScaler.scaleSize(context, 20),
              vertical: AppScaler.scaleHeight(context, 20),
            ),
            decoration: BoxDecoration(
              color: AppColors.submitticket0E0E0E,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText(
                    context,
                    "Welcome to Draper TV, an online platform owned by Draper Productions.",
                    color: customColors.textColor,
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 16)),

                  ...sections.map(
                    (section) => TitleSubtitleWidget(
                      title: section["title"]!,
                      subtitle: section["subtitle"]!,
                      colors: customColors,
                    ),
                  ),

                  SizedBox(height: AppScaler.scaleHeight(context, 20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
