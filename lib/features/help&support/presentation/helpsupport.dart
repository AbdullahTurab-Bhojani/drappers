import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/helpsupport_submit_widget.dart';

class Helpsupport extends StatefulWidget {
  const Helpsupport({super.key});

  @override
  State<Helpsupport> createState() => _HelpsupportState();
}

class _HelpsupportState extends State<Helpsupport> {
  final List<Map<String, String>> _chatitem = [
    // {
    //   'iconPath': Assets.images.commenticon.path,
    //   'title': "Chat with Us",
    //   'subtitle': "Start a live chat with our support team",
    //   'buttonText': "Start Live Chat",
    // },
    {
      'iconPath': Assets.images.mentionicon.path,
      'title': "Email Support",
      'subtitle': "support@drapertv.com",
      'buttonText': "Send Email",
    },
    {
      'iconPath': Assets.images.phonecallicon.path,
      'title': "Contact Support",
      'subtitle': "+92 xxxxxxxxx09",
      'buttonText': "Call Now",
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
            onTap: () {
              context.pop();
            },
            child: Padding(
              padding: EdgeInsets.only(left: AppScaler.scaleSize(context, 20)),
              child: Image.asset(
                Assets.images.backicon.path,
                width: AppScaler.scaleSize(context, 20),
                height: AppScaler.scaleHeight(context, 20),
              ),
            ),
          ),
          title: "Help & Support",
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(height: AppScaler.scaleHeight(context, 10)),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppScaler.scaleSize(context, 20),
                  ),
                  child: Column(
                    children: [
                      ..._chatitem.map((item) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppScaler.scaleHeight(context, 8),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: AppScaler.scaleHeight(context, 114),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.helpsupport,
                              border: Border.all(
                                color: customColors.blackshade,
                                width: 0.5,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: AppScaler.scaleHeight(context, 7),
                                horizontal: AppScaler.scaleSize(context, 15),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        item['iconPath']!,
                                        height: AppScaler.scaleHeight(
                                          context,
                                          24,
                                        ),
                                        width: AppScaler.scaleSize(context, 24),
                                        color: customColors.textColor,
                                      ),
                                      SizedBox(
                                        width: AppScaler.scaleSize(context, 20),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          PoppinsText(
                                            context,
                                            item['title']!,
                                            color: Theme.of(context)
                                                .extension<AppCustomColors>()!
                                                .textColor,
                                            fontSize:
                                                PoppinsFontSizeVariant.size16,
                                            fontWeight:
                                                PoppinsFontWeightVariant.medium,
                                          ),
                                          PoppinsText(
                                            context,
                                            item['subtitle']!,
                                            color: Theme.of(context)
                                                .extension<AppCustomColors>()!
                                                .textColor,
                                            fontSize:
                                                PoppinsFontSizeVariant.size12,
                                            fontWeight: PoppinsFontWeightVariant
                                                .regular,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppScaler.scaleHeight(context, 13),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: AppScaler.scaleHeight(context, 40),
                                    child: AppButton(
                                      onPressed: () {},
                                      title: item['buttonText']!,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),

                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          vertical: AppScaler.scaleHeight(context, 20),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.submitticket0E0E0E,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: HelpsupportSubmitWidget(),
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 20)),
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
