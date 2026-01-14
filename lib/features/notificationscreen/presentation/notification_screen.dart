// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/todaynotification_widget.dart';
import '../../../shared/widgets/wednesdaynotification_widget.dart';
import '../../../shared/widgets/yesterdaynotification_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
            SizedBox(height: AppScaler.scaleHeight(context, 5)),
            TodaynotificationWidget(),
            SizedBox(height: AppScaler.scaleHeight(context, 20)),
            YesterdaynotificationWidget(),
            SizedBox(height: AppScaler.scaleHeight(context, 20)),
            WednesdaynotificationWidget(),
            SizedBox(height: AppScaler.scaleHeight(context, 15)),
          ],
        ),
      ),
    );
  }
}
