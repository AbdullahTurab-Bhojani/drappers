import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
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
    // ChatItem(
    //   iconPath: Assets.images.commenticon.path,
    //   title: "Chat with Us",
    //   subtitle: "Start a live chat with our support team",
    //   buttonText: "Start Live Chat",
    // ),
    ChatItem(
      iconPath: Assets.images.mentionicon.path,
      title: "Email Support",
      subtitle: "support@drapertv.com",
      buttonText: "Send Email",
    ),
    ChatItem(
      iconPath: Assets.images.phonecallicon.path,
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
                behavior: HitTestBehavior.opaque,

                onTap: () {
                  context.pop();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppScaler.scaleSize(context, 20),
                  ),
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
            SizedBox(height: AppScaler.scaleHeight(context, 10)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppScaler.scaleSize(context, 20),
                        vertical: 0,
                      ),
                      child: Column(
                        children: [
                          ...chatItems.map((item) {
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
                                    horizontal: AppScaler.scaleSize(
                                      context,
                                      15,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            item.iconPath,
                                            height: AppScaler.scaleHeight(
                                              context,
                                              24,
                                            ),
                                            width: AppScaler.scaleSize(
                                              context,
                                              24,
                                            ),
                                            color: customColors.textColor,
                                          ),
                                          SizedBox(
                                            width: AppScaler.scaleSize(
                                              context,
                                              20,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              PoppinsText(
                                                context,
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
                                                context,
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
                                      SizedBox(
                                        height: AppScaler.scaleHeight(
                                          context,
                                          13,
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: AppScaler.scaleHeight(
                                          context,
                                          40,
                                        ),
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
                          }),

                          Container(
                            width: double.infinity,
                            height: AppScaler.scaleHeight(context, 630),
                            margin: EdgeInsets.symmetric(
                              vertical: AppScaler.scaleHeight(context, 20),
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.submitticket0E0E0E,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: AppScaler.scaleHeight(context, 20),
                                    left: AppScaler.scaleSize(context, 20),
                                  ),
                                  child: PoppinsText(
                                    context,
                                    "Submit a Ticket",
                                    fontSize: PoppinsFontSizeVariant.size22,
                                    fontWeight: PoppinsFontWeightVariant.medium,
                                    color: customColors.textColor,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: AppScaler.scaleSize(context, 20),
                                    right: AppScaler.scaleSize(context, 20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: AppScaler.scaleHeight(
                                          context,
                                          10,
                                        ),
                                      ),
                                      NewTextField(
                                        fieldbg: AppColors.submitfield181818,
                                        controller: _fullNameController,
                                        labelText: "Full Name*",
                                        hintText: "Enter your full name",
                                        filledColor:
                                            customColors.bgcontainerlight,
                                      ),
                                      SizedBox(
                                        height: AppScaler.scaleHeight(
                                          context,
                                          15,
                                        ),
                                      ),
                                      NewTextField(
                                        fieldbg: AppColors.submitfield181818,
                                        controller: _emailController,
                                        labelText:
                                            "Enter your Email Address or Phone*",
                                        hintText: "Enter your email",
                                        filledColor:
                                            customColors.bgcontainerlight,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return "Email required";
                                          }
                                          if (!value.contains("@")) {
                                            return "Enter valid email";
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: AppScaler.scaleHeight(
                                          context,
                                          15,
                                        ),
                                      ),
                                      NewTextField(
                                        fieldbg: AppColors.submitfield181818,
                                        controller: _subjectController,
                                        labelText: "Subject*",
                                        hintText: "Subject here",
                                        filledColor:
                                            customColors.bgcontainerlight,
                                      ),
                                      SizedBox(
                                        height: AppScaler.scaleHeight(
                                          context,
                                          15,
                                        ),
                                      ),
                                      NewTextField(
                                        fieldbg: AppColors.submitfield181818,
                                        maxLines: 3,
                                        controller: _describeController,
                                        labelText: "Describe your issue*",
                                        hintText:
                                            "Describe your issue in detail...",
                                        filledColor:
                                            customColors.bgcontainerlight,
                                      ),
                                      SizedBox(
                                        height: AppScaler.scaleHeight(
                                          context,
                                          10,
                                        ),
                                      ),
                                      PoppinsText(
                                        context,
                                        "00/500 Characters",
                                        fontSize: PoppinsFontSizeVariant.size12,
                                        fontWeight:
                                            PoppinsFontWeightVariant.regular,
                                        color: customColors.greyColor,
                                      ),
                                      SizedBox(
                                        height: AppScaler.scaleHeight(
                                          context,
                                          10,
                                        ),
                                      ),
                                      PoppinsText(
                                        context,
                                        "Upload Screenshot (Optional)",
                                        fontSize: PoppinsFontSizeVariant.size16,
                                        fontWeight:
                                            PoppinsFontWeightVariant.regular,
                                        color: customColors.textColor,
                                      ),
                                      SizedBox(
                                        height: AppScaler.scaleHeight(
                                          context,
                                          15,
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: AppScaler.scaleHeight(
                                          context,
                                          55,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: AppScaler.scaleSize(
                                            context,
                                            12,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.submitfield181818,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              Assets.images.screenshoticon.path,
                                              height: AppScaler.scaleHeight(
                                                context,
                                                24,
                                              ),
                                              width: AppScaler.scaleSize(
                                                context,
                                                24,
                                              ),
                                            ),
                                            SizedBox(
                                              width: AppScaler.scaleSize(
                                                context,
                                                24,
                                              ),
                                            ),
                                            PoppinsText(
                                              context,
                                              "Add Screenshot",
                                              fontSize:
                                                  PoppinsFontSizeVariant.size16,
                                              fontWeight:
                                                  PoppinsFontWeightVariant
                                                      .regular,
                                              color: customColors.textColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppScaler.scaleHeight(
                                          context,
                                          30,
                                        ),
                                      ),
                                      AppButton(
                                        buttonSize: Size(
                                          double.infinity,
                                          AppScaler.scaleHeight(context, 40),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        title: "Submit Ticket",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
