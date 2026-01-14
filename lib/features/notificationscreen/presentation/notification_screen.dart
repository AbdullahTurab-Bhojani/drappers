// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Semifinals 1 – Meet The Drapers Season 6 (2023)",
      "time": "1m ago",
      "image": Assets.images.trendingimage1.path,
      "showExtra": false,
    },
    {
      "title": "Rio de Janeiro – Meet the Drapers Season 6 (2023)",
      "time": "30m ago",
      "image": Assets.images.trendingimage9.path,
      "showExtra": false,
    },
    {
      "title": "Rio de Janeiro – Meet the Drapers Season 6 (2023)",
      "time": "13h ago",
      "image": Assets.images.trendingimage8.path,
      "showExtra": false,
    },
    {
      "title": "Semifinals 1 – Meet The Drapers Season 6 (2023) ",
      "time": "11h ago",
      "image": Assets.images.trendingimage7.path,
      "showExtra": false,
    },
  ];
  final List<Map<String, dynamic>> wednesday = [
    {
      "title": "Semifinals 1 – Meet The Drapers Season 6 (2023)",
      "time": "13m",
      "image": Assets.images.trendingimage6.path,
      "showExtra": false,
    },
    {
      "title": "Rio de Janeiro – Meet the Drapers Season 6 (2023)",
      "time": "30m",
      "image": Assets.images.trendingimage5.path,
      "showExtra": false,
    },
    {
      "title": "Rio de Janeiro – Meet the Drapers Season 6 (2023)",
      "time": "13h",
      "image": Assets.images.trendingimage4.path,
      "showExtra": false,
    },
    {
      "title": "Semifinals 1 – Meet The Drapers Season 6 (2023) ",
      "time": "11h",
      "image": Assets.images.trendingimage3.path,
      "showExtra": false,
    },
  ];

  final List<Map<String, dynamic>> yesterday = [
    {
      "title": "Semifinals 1 – Meet The Drapers Season 6 (2023)",
      "time": "1m ago",
      "image": Assets.images.trendingimage2.path,
      "showExtra": false,
    },
    {
      "title": "Semifinals 1 – Meet The Drapers Season 6 (2023) ",
      "time": "11h",
      "image": Assets.images.trendingimage1.path,
      "showExtra": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<AppCustomColors>()!;
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

                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppScaler.scaleSize(context, 20),
                    right: AppScaler.scaleSize(context, 5),
                  ),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: AppScaler.scaleSize(context, 20),
                    height: AppScaler.scaleHeight(context, 20),
                  ),
                ),
              ),
              title: "Notifications",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: AppScaler.scaleSize(context, 25),
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,

                    onTap: () {
                      context.pushNamed(AppRoutes.notificationSetting.name);
                    },
                    child: Image.asset(
                      Assets.images.settingicon.path,
                      width: AppScaler.scaleSize(context, 25),
                      height: AppScaler.scaleHeight(context, 25),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: AppScaler.scaleHeight(context, 5)),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: AppScaler.scaleSize(context, 73),
                      height: AppScaler.scaleHeight(context, 30),
                      decoration: BoxDecoration(
                        color: AppColors.color1A1E24,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: PoppinsText(
                          context,
                          'Today',
                          color: customColors.textColor,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 12)),

                  ...notifications.map((item) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          for (var i = 0; i < notifications.length; i++) {
                            notifications[i]['showExtra'] = false;
                          }
                          item['showExtra'] = true;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: item['showExtra']
                              ? AppColors.color202020.withOpacity(0.5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: AppScaler.scaleHeight(context, 20),
                            bottom: AppScaler.scaleHeight(context, 10),
                            left: AppScaler.scaleSize(context, 20),
                            right: AppScaler.scaleSize(context, 20),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(
                                      context,
                                      item['title'],
                                      color: customColors.textColor,
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                    ),
                                    SizedBox(
                                      height: AppScaler.scaleHeight(context, 4),
                                    ),
                                    PoppinsText(
                                      context,
                                      item['time'],
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      color: customColors.textColor,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: AppScaler.scaleSize(context, 12)),
                              Container(
                                margin: EdgeInsets.only(
                                  top: AppScaler.scaleHeight(context, 5),
                                ),
                                width: AppScaler.scaleSize(context, 74),
                                height: AppScaler.scaleHeight(context, 44),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(item['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              if (item['showExtra']) ...[
                                SizedBox(
                                  width: AppScaler.scaleSize(context, 12),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: AppScaler.scaleHeight(context, 15),
                                  ),
                                  child: PoppinsText(
                                    context,
                                    "New!",
                                    fontSize: PoppinsFontSizeVariant.size12,
                                    fontWeight:
                                        PoppinsFontWeightVariant.semiBold,
                                    color: customColors.textColor,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  SizedBox(height: AppScaler.scaleHeight(context, 20)),

                  Center(
                    child: Container(
                      width: AppScaler.scaleSize(context, 102),
                      height: AppScaler.scaleHeight(context, 31),
                      decoration: BoxDecoration(
                        color: AppColors.color1A1E24,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: PoppinsText(
                          context,
                          'Yesterday',
                          color: customColors.textColor,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 20)),

                  ...yesterday.map((item) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: AppScaler.scaleHeight(context, 20),
                            bottom: AppScaler.scaleHeight(context, 10),
                            left: AppScaler.scaleSize(context, 20),
                            right: AppScaler.scaleSize(context, 20),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(
                                      context,
                                      item['title'],
                                      color: customColors.textColor,
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                    ),
                                    SizedBox(
                                      height: AppScaler.scaleHeight(context, 4),
                                    ),
                                    PoppinsText(
                                      context,
                                      item['time'],
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      color: customColors.textColor,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: AppScaler.scaleSize(context, 12)),
                              Container(
                                margin: EdgeInsets.only(
                                  top: AppScaler.scaleHeight(context, 5),
                                ),
                                width: AppScaler.scaleSize(context, 78),
                                height: AppScaler.scaleHeight(context, 44),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(item['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  SizedBox(height: AppScaler.scaleHeight(context, 20)),
                  Center(
                    child: Container(
                      width: AppScaler.scaleSize(context, 117),
                      height: AppScaler.scaleHeight(context, 31),
                      decoration: BoxDecoration(
                        color: AppColors.color1A1E24,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: PoppinsText(
                          context,
                          'Wednesday',
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 20)),

                  ...wednesday.map((item) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: AppScaler.scaleHeight(context, 20),
                            bottom: AppScaler.scaleHeight(context, 10),
                            left: AppScaler.scaleSize(context, 20),
                            right: AppScaler.scaleSize(context, 20),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(
                                      context,
                                      item['title'],
                                      color: customColors.textColor,
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                    ),
                                    SizedBox(
                                      height: AppScaler.scaleHeight(context, 4),
                                    ),
                                    PoppinsText(
                                      context,
                                      item['time'],
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      color: customColors.textColor,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: AppScaler.scaleHeight(context, 12),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: AppScaler.scaleHeight(context, 6),
                                ),
                                width: AppScaler.scaleSize(context, 78),
                                height: AppScaler.scaleHeight(context, 44),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(item['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  SizedBox(height: AppScaler.scaleHeight(context, 15)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
