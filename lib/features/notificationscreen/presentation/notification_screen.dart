// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/notification_section_widget.dart'; // <- new combined widget

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, dynamic>> todayNotifications = [
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

  final List<Map<String, dynamic>> yesterdayNotifications = [
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

  final List<Map<String, dynamic>> wednesdayNotifications = [
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

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(right: AppScaler.scaleSize(context, 25)),
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
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: AppScaler.scaleHeight(context, 10)),
            NotificationSectionWidget(
              title: 'Today',
              notifications: todayNotifications,
            ),
            SizedBox(height: AppScaler.scaleHeight(context, 20)),
            NotificationSectionWidget(
              title: 'Yesterday',
              notifications: yesterdayNotifications,
            ),
            SizedBox(height: AppScaler.scaleHeight(context, 20)),
            NotificationSectionWidget(
              title: 'Wednesday',
              notifications: wednesdayNotifications,
            ),
            SizedBox(height: AppScaler.scaleHeight(context, 15)),
          ],
        ),
      ),
    );
  }
}
