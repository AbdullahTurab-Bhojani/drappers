import 'package:flutter/material.dart';

import '../../../../../core/extensions/theme_extension.dart';
import '../../../../../core/theme/app_scalar.dart';
import '../../../../../drappers.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/app_bar/main_app_bar.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  final List<Map<String, String>> _faqs = [
    {
      'question': "What is Draper TV?",
      'answer':
          "Draper TV is an online platform owned by Draper Productions, providing content focused on entrepreneurship and investment. It includes videos, articles, and other media to help users learn and engage with business and investment topics.",
    },
    {
      'question': "Who can use Draper TV?",
      'answer':
          "Draper TV is intended for users of all ages, but registration requires you to be at least 13 years old. The platform is open to users from all demographic backgrounds.",
    },
    {
      'question': "Do I need to register to use Draper TV?",
      'answer':
          "Some features on Draper TV require free registration. During registration, you must provide accurate and updated information.",
    },
    {
      'question': "What kind of content is available on Draper TV?",
      'answer':
          "The platform offers educational content related to entrepreneurship and investment. You may also encounter advertisements and promotional materials while browsing the site.",
    },
    {
      'question': "Can I use Draper TV content for my own purposes?",
      'answer':
          "No. All content on Draper TV, including text, images, videos, and trademarks, is the property of Draper Productions or its licensors. You may not use, modify, or distribute any content without prior written permission.",
    },
    {
      'question': "Is Draper TV responsible for the accuracy of its content?",
      'answer':
          "Draper Productions provides content for educational purposes only. The accuracy, completeness, or usefulness of the content is not guaranteed. Use of the platform is at your own risk, and Draper Productions is not liable for any damages.",
    },
    {
      'question': "Can the Terms of Use change?",
      'answer':
          "Yes. Draper Productions may update these Terms of Use at any time without prior notice. Continued use of the website after changes means you accept the updated terms.",
    },
    {
      'question': "What laws govern the use of Draper TV?",
      'answer':
          "These Terms of Use are governed by the laws of the jurisdiction of Draper Productions, without regard to conflicts of law provisions.",
    },
    {
      'question': "How can I contact Draper TV?",
      'answer':
          "If you have questions or concerns about the platform or the Terms of Use, you can reach us at hello@drapertv.com",
    },
    {
      'question': "Is Draper TV free to use?",
      'answer':
          "Yes, basic access is free. Some features may require registration, but there are typically fees for using the platform.",
    },
  ];
  Set<int> expandedIndices = {};

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppMainBar(
              leading: GestureDetector(
                behavior: HitTestBehavior.opaque,

                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppScaler.scaleSize(context, 20),
                  ),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: AppScaler.scaleSize(context, 20),
                    height: AppScaler.scaleHeight(context, 20),
                  ),
                ),
              ),
              title: "FAQ's",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                  top: AppScaler.scaleHeight(context, 10),
                ),
                itemCount: _faqs.length,
                itemBuilder: (context, index) {
                  final faq = _faqs[index];
                  final isExpanded = expandedIndices.contains(index);
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppScaler.scaleSize(context, 20),
                      0,
                      AppScaler.scaleSize(context, 20),
                      AppScaler.scaleHeight(context, 24),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Theme(
                        data: theme.copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          key: ValueKey(index),
                          initiallyExpanded: isExpanded,
                          backgroundColor: AppColors.submitticket0E0E0E,
                          collapsedBackgroundColor:
                              AppColors.submitticket0E0E0E,
                          title: PoppinsText(
                            context,
                            faq["question"]!,
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.semiBold,
                            color: customColors.textColor,
                          ),

                          trailing: isExpanded
                              ? Icon(Icons.remove, color: AppColors.white)
                              : Icon(Icons.add, color: AppColors.white),

                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left: AppScaler.scaleSize(context, 20),
                                right: AppScaler.scaleSize(context, 20),
                                bottom: AppScaler.scaleHeight(context, 16),
                              ),
                              child: PoppinsText(
                                context,
                                faq["answer"]!,
                                fontSize: PoppinsFontSizeVariant.size12,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                color: customColors.textColor,
                              ),
                            ),
                          ],

                          onExpansionChanged: (expanded) {
                            setState(() {
                              if (expanded) {
                                expandedIndices.add(index);
                              } else {
                                expandedIndices.remove(index);
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
