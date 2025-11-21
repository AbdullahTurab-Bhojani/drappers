import 'package:flutter/material.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';

class PrivacypolicyScreen extends StatefulWidget {
  const PrivacypolicyScreen({super.key});

  @override
  State<PrivacypolicyScreen> createState() => _PrivacypolicyScreenState();
}

class _PrivacypolicyScreenState extends State<PrivacypolicyScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    final Color contentBackgroundColor =
        customColors.regular ?? Color(0xFF2C2F4D);
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
              title: "Privacy Policy",
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
                        "Last updated: 10/30/2023",
                        color: customColors.textColor,
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                      ),

                      SizedBox(height: 16),

                      // --- 1. Information We Collect ---
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: PoppinsText(
                          "1. Information We Collect",
                          color: customColors.textColor,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                      PoppinsText(
                        "We collect email addresses and names from contact forms and newsletter sign-ups.",
                        color: customColors.textColor,
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                      ),

                      // --- 2. Purpose of Collection ---
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
