import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
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
      "image": Assets.images.trendingshowimage1.path,
      "showExtra": false,
    },
    {
      "title": "Rio de Janeiro – Meet the Drapers Season 6 (2023)",
      "time": "30m ago",
      "image": Assets.images.trendingshowimage2.path,
      "showExtra": false,
    },
    {
      "title": "Rio de Janeiro – Meet the Drapers Season 6 (2023)",
      "time": "13h ago",
      "image": Assets.images.trendingshowimage3.path,
      "showExtra": false,
    },
    {
      "title": "Semifinals 1 – Meet The Drapers Season 6 (2023) ",
      "time": "11h ago",
      "image": Assets.images.trendingshowimage4.path,
      "showExtra": false,
    },
  ];
  final List<Map<String, dynamic>> wednesday = [
    {
      "title": "Semifinals 1 – Meet The Drapers Season 6 (2023)",
      "time": "13m",
      "image": Assets.images.trendingshowimage1.path,
      "showExtra": false,
    },
    {
      "title": "Rio de Janeiro – Meet the Drapers Season 6 (2023)",
      "time": "30m",
      "image": Assets.images.trendingshowimage2.path,
      "showExtra": false,
    },
    {
      "title": "Rio de Janeiro – Meet the Drapers Season 6 (2023)",
      "time": "13h",
      "image": Assets.images.trendingshowimage3.path,
      "showExtra": false,
    },
    {
      "title": "Semifinals 1 – Meet The Drapers Season 6 (2023) ",
      "time": "11h",
      "image": Assets.images.trendingshowimage4.path,
      "showExtra": false,
    },
  ];

  final List<Map<String, dynamic>> yesterday = [
    {
      "title": "Semifinals 1 – Meet The Drapers Season 6 (2023)",
      "time": "1m ago",
      "image": Assets.images.trendingshowimage1.path,
      "showExtra": false,
    },
    {
      "title": "Semifinals 1 – Meet The Drapers Season 6 (2023) ",
      "time": "11h",
      "image": Assets.images.trendingshowimage1.path,
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
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: "Notifications",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.notificationSetting.name);
                    },
                    child: Image.asset(
                      Assets.images.settingicon.path,
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 73,
                      height: 31,
                      decoration: BoxDecoration(
                        color: AppColors.color1A1E24,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: PoppinsText(
                          'Today',
                          color: customColors.textColor,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 11),

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
                            top: 20,
                            bottom: 10,
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(
                                      item['title'],
                                      color: customColors.textColor,
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                    ),
                                    SizedBox(height: 4),
                                    PoppinsText(
                                      item['time'],
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      color: customColors.textColor,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12),
                              Container(
                                margin: EdgeInsets.only(top: 6),
                                width: 78,
                                height: 44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(item['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              if (item['showExtra']) ...[
                                SizedBox(width: 12),
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: PoppinsText(
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
                  }).toList(),

                  SizedBox(height: 20),

                  Center(
                    child: Container(
                      width: 102,
                      height: 31,
                      decoration: BoxDecoration(
                        color: AppColors.color1A1E24,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: PoppinsText(
                          'Yesterday',
                          color: customColors.textColor,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  ...yesterday.map((item) {
                    return GestureDetector(
                      onTap: () {
                        // Ab koi showExtra logic need nahi
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: 10,
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(
                                      item['title'],
                                      color: customColors.textColor,
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                    ),
                                    SizedBox(height: 4),
                                    PoppinsText(
                                      item['time'],
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      color: customColors.textColor,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12),
                              Container(
                                margin: EdgeInsets.only(top: 6),
                                width: 78,
                                height: 44,
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
                  }).toList(),

                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 117,
                      height: 31,
                      decoration: BoxDecoration(
                        color: AppColors.color1A1E24,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: PoppinsText(
                          'Wednesday',
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  ...wednesday.map((item) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: 10,
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(
                                      item['title'],
                                      color: customColors.textColor,
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                    ),
                                    SizedBox(height: 4),
                                    PoppinsText(
                                      item['time'],
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      color: customColors.textColor,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12),
                              Container(
                                margin: EdgeInsets.only(top: 6),
                                width: 78,
                                height: 44,
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
                  }).toList(),

                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
