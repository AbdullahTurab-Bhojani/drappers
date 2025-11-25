import 'package:flutter/material.dart';

import '../../../../../core/extensions/theme_extension.dart';
import '../../../../../drappers.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/app_bar/main_app_bar.dart';

class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});
}

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  final List<FaqItem> _faqs = [
    FaqItem(
      question: "What is Draper TV?",
      answer:
          "Draper TV is an online platform owned by Draper Productions, providing content focused on entrepreneurship and investment. It includes videos, articles, and other media to help users learn and engage with business and investment topics.",
    ),
    FaqItem(
      question: "Who can use Draper TV?",
      answer:
          "Draper TV is intended for users of all ages, but registration requires you to be at least 13 years old. The platform is open to users from all demographic backgrounds.",
    ),
    FaqItem(
      question: "Do I need to register to use Draper TV?",
      answer:
          "Some features on Draper TV require free registration. During registration, you must provide accurate and updated information.",
    ),
    FaqItem(
      question: "What kind of content is available on Draper TV?",
      answer:
          "The platform offers educational content related to entrepreneurship and investment. You may also encounter advertisements and promotional materials while browsing the site.",
    ),
    FaqItem(
      question: "Can I use Draper TV content for my own purposes?",
      answer:
          "No. All content on Draper TV, including text, images, videos, and trademarks, is the property of Draper Productions or its licensors. You may not use, modify, or distribute any content without prior written permission.",
    ),
    FaqItem(
      question: "Is Draper TV responsible for the accuracy of its content?",
      answer:
          "Draper Productions provides content for educational purposes only. The accuracy, completeness, or usefulness of the content is not guaranteed. Use of the platform is at your own risk, and Draper Productions is not liable for any damages.",
    ),
    FaqItem(
      question: "Can the Terms of Use change?",
      answer:
          "Yes. Draper Productions may update these Terms of Use at any time without prior notice. Continued use of the website after changes means you accept the updated terms.",
    ),
    FaqItem(
      question: "What laws govern the use of Draper TV?",
      answer:
          "These Terms of Use are governed by the laws of the jurisdiction of Draper Productions, without regard to conflicts of law provisions.",
    ),
    FaqItem(
      question: "How can I contact Draper TV?",
      answer:
          "If you have questions or concerns about the platform or the Terms of Use, you can reach us at hello@drapertv.com",
    ),
    FaqItem(
      question: "Is Draper TV free to use?",
      answer:
          "Yes, basic access is free. Some features may require registration, but there are typically fees for using the platform.",
    ),
  ];
  Set<int> expandedIndices = {};

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
              leadingIcon: Icons.arrow_back_ios,
              title: "FAQ's",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  itemCount: _faqs.length,
                  itemBuilder: (context, index) {
                    final item = _faqs[index];
                    final isExpanded = expandedIndices.contains(index);
                    return Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Theme(
                          data: theme.copyWith(
                            dividerColor: Colors.transparent,
                          ),
                          child: ExpansionTile(
                            key: ValueKey(index),
                            initiallyExpanded: isExpanded,
                            backgroundColor: customColors.regular,
                            collapsedBackgroundColor: customColors.regular,

                            title: PoppinsText(
                              item.question,
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.semiBold,
                              color: customColors.textColor,
                            ),

                            trailing: isExpanded
                                ? Icon(Icons.remove, color: Colors.white)
                                : Icon(Icons.add, color: Colors.white),

                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                  bottom: 16.0,
                                  top: 0,
                                ),
                                child: PoppinsText(
                                  item.answer,
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
            ),
         
          ],
        ),
      ),
    );
  }
}
