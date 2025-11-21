import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/textfield_new.dart';

class ChatItem {
  final String iconPath;
  final String title;
  final String subtitle;
  final String buttonText;

  ChatItem({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });
}

class Helpsupport extends StatefulWidget {
  const Helpsupport({super.key});

  @override
  State<Helpsupport> createState() => _HelpsupportState();
}

class _HelpsupportState extends State<Helpsupport> {
  final _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _describeController = TextEditingController();

  final List<ChatItem> chatItems = [
    ChatItem(
      iconPath: Assets.images.commenticon.path,
      title: "Chat with Us",
      subtitle: "Start a live chat with our support team",
      buttonText: "Start Live Chat",
    ),
    ChatItem(
      iconPath: Assets.images.mentionedicon.path,
      title: "Email Support",
      subtitle: "support@drapertv.com",
      buttonText: "Send Email",
    ),
    ChatItem(
      iconPath: Assets.images.callicon.path,
      title: "Contact Support",
      subtitle: "+92 xxxxxxxxx09",
      buttonText: "Call Now",
    ),
  ];

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
          children: [
            AppMainBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: "Help & Support",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Column(
                        children: [
                          ...chatItems.map((item) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                width: double.infinity,
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.color202020,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(item.iconPath),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              PoppinsText(
                                                item.title,
                                                color: Theme.of(context)
                                                    .extension<
                                                      AppCustomColors
                                                    >()!
                                                    .textColor,
                                                fontSize: PoppinsFontSizeVariant
                                                    .size16,
                                                fontWeight:
                                                    PoppinsFontWeightVariant
                                                        .medium,
                                              ),
                                              PoppinsText(
                                                item.subtitle,
                                                color: Theme.of(context)
                                                    .extension<
                                                      AppCustomColors
                                                    >()!
                                                    .textColor,
                                                fontSize: PoppinsFontSizeVariant
                                                    .size12,
                                                fontWeight:
                                                    PoppinsFontWeightVariant
                                                        .regular,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 40,
                                        child: AppButton(
                                          onPressed: () {},
                                          title: item.buttonText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),

                          Container(
                            width: double.infinity,
                            height: 730,
                            margin: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: customColors.regular,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PoppinsText(
                                    "Submit a Ticket",
                                    fontSize: PoppinsFontSizeVariant.size22,
                                    fontWeight: PoppinsFontWeightVariant.medium,
                                    color: customColors.textColor,
                                  ),
                                  SizedBox(height: 20),
                                  NewTextField(
                                    fieldbg: AppColors.newfield,

                                    controller: _fullNameController,
                                    labelText: "Full Name*",
                                    hintText: "Enter your full name",
                                    filledColor: AppColors.newfield,
                                  ),
                                  SizedBox(height: 15),
                                  NewTextField(
                                    fieldbg: AppColors.newfield,

                                    controller: _emailController,
                                    labelText:
                                        "Enter your Email Address or Phone*",
                                    hintText: "Enter your email",
                                    filledColor: AppColors.newfield,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "Email required";
                                      }
                                      if (!value.contains("@"))
                                        return "Enter valid email";
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 15),
                                  NewTextField(
                                    fieldbg: AppColors.newfield,

                                    controller: _subjectController,
                                    labelText: "Subject*",
                                    hintText: "Subject here",
                                    filledColor: AppColors.newfield,
                                  ),
                                  SizedBox(height: 15),
                                  NewTextField(
                                    fieldbg: AppColors.newfield,

                                    maxLines: 6,
                                    controller: _describeController,
                                    labelText: "Describe your issue*",
                                    hintText:
                                        "Describe your issue in detail...",
                                    filledColor: AppColors.newfield,
                                  ),
                                  SizedBox(height: 14),
                                  PoppinsText(
                                    "00/500 Characters",
                                    fontSize: PoppinsFontSizeVariant.size12,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    color: AppColors.dLabel,
                                  ),
                                  SizedBox(height: 14),
                                  PoppinsText(
                                    "Upload Screenshot (Optional)",
                                    fontSize: PoppinsFontSizeVariant.size16,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    color: customColors.textColor,
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    width: double.infinity,
                                    height: 55,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.newfield,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          Assets.images.screenshoticon.path,
                                          height: 24,
                                          width: 24,
                                        ),
                                        SizedBox(width: 14),
                                        PoppinsText(
                                          "Add Screenshot",
                                          fontSize:
                                              PoppinsFontSizeVariant.size16,
                                          fontWeight:
                                              PoppinsFontWeightVariant.regular,
                                          color: customColors.textColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  AppButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    title: "Submit Ticket",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
