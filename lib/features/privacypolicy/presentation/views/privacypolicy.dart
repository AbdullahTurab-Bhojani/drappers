import 'package:flutter/material.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/theme/app_scalar.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';

class PrivacypolicyScreen extends StatefulWidget {
  const PrivacypolicyScreen({super.key});

  @override
  State<PrivacypolicyScreen> createState() => _PrivacypolicyScreenState();
}

class _PrivacypolicyScreenState extends State<PrivacypolicyScreen> {
  // Privacy sections structured as a list
  final List<Map<String, String>> _sections = [
    {
      "title": "1. Information We Collect",
      "body":
          "We collect email addresses and names from contact forms and newsletter sign-ups.",
    },
    {
      "title": "2. Purpose of Collection",
      "body":
          "We collect this information for the purpose of sending newsletters to our subscribers.",
    },
    {
      "title": "3. Cookies and Tracking Technologies",
      "body":
          "We use Google Analytics to track website traffic and gather information about how visitors use our site. This information is used for internal purposes only and helps us improve our website.",
    },
    {
      "title": "4. Sharing of Personal Information",
      "body":
          "We do not share the personal information we collect with any third parties.",
    },
    {
      "title": "5. Data Security",
      "body":
          "We take appropriate measures to protect the personal information we collect. This includes using secure servers and encryption methods.",
    },
    {
      "title": "6. Data Retention",
      "body":
          "We retain the personal information you provide for an indefinite period, unless you request its deletion.",
    },
    {
      "title": "7. Opt-Out Option",
      "body":
          "If you no longer wish to receive our newsletters, you can opt-out by following the unsubscribe instructions provided in the email or by contacting us directly.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    final double paddingValue = 20.0;

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
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                "assets/images/backicon.png",
                width: 20,
                height: 20,
              ),
            ),
          ),
          title: "Privacy Policy",
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppScaler.scaleSize(context, 20),
            vertical: AppScaler.scaleHeight(context, 20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.submitticket0E0E0E,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(paddingValue, 20, paddingValue, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText(
                    context,
                    "Last updated: 10/30/2023",
                    color: customColors.textColor,
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 16)),

                  ..._sections.map(
                    (section) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _title(section["title"]!, customColors),
                        _body(section["body"]!, customColors),
                      ],
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

  Widget _title(String text, AppCustomColors colors) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppScaler.scaleHeight(context, 24),
        bottom: AppScaler.scaleHeight(context, 8),
      ),
      child: PoppinsText(
        context,
        text,
        color: colors.textColor,
        fontSize: PoppinsFontSizeVariant.size16,
        fontWeight: PoppinsFontWeightVariant.medium,
      ),
    );
  }

  Widget _body(String text, AppCustomColors colors) {
    return PoppinsText(
      context,
      text,
      color: colors.textColor,
      fontSize: PoppinsFontSizeVariant.size12,
      fontWeight: PoppinsFontWeightVariant.regular,
    );
  }
}
