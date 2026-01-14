// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/togglesetting_tile.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool _autoplayNextEpisode = false;
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<AppCustomColors>()!;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(Assets.images.screensbg.path)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppMainBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: EdgeInsets.only(left: AppScaler.scaleSize(context, 20)),
              child: Image.asset(
                "assets/images/backicon.png",
                width: AppScaler.scaleSize(context, 20),
                height: AppScaler.scaleHeight(context, 20),
              ),
            ),
          ),
          title: "Notifications Settings",
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: AppScaler.scaleHeight(context, 30)),
            ToggleSettingTile(
              image: AssetImage(Assets.images.notificationsfillicon.path),
              titleText: "Push Notifications",
              subtitleText: "Receive notifications on your device",
              initialValue: _autoplayNextEpisode,
              onChanged: (value) {
                setState(() {
                  _autoplayNextEpisode = value;
                });
              },
            ),
            SizedBox(height: AppScaler.scaleHeight(context, 10)),
            ToggleSettingTile(
              image: AssetImage(Assets.images.envelopeicon.path),
              titleText: "Email Notifications",
              subtitleText: "Get updates via email",
              initialValue: _autoplayNextEpisode,
              onChanged: (value) {
                setState(() {
                  _autoplayNextEpisode = value;
                });
              },
            ),
            SizedBox(height: AppScaler.scaleHeight(context, 26)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppScaler.scaleSize(context, 20),
              ),
              child: PoppinsText(
                context,
                'Content Notifications',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: customColors.textColor,
              ),
            ),
            SizedBox(height: AppScaler.scaleHeight(context, 20)),
            ToggleSettingTile(
              image: AssetImage(Assets.images.playnewicon.path),
              titleText: "New Episode",
              subtitleText: "When new episodes are available",
              initialValue: _autoplayNextEpisode,
              onChanged: (value) {
                setState(() {
                  _autoplayNextEpisode = value;
                });
              },
            ),
            SizedBox(height: AppScaler.scaleHeight(context, 10)),
            ToggleSettingTile(
              image: AssetImage(Assets.images.bellringicon.path),
              titleText: "Watch Reminders",
              subtitleText: "Reminders for saved content",
              initialValue: _autoplayNextEpisode,
              onChanged: (value) {
                setState(() {
                  _autoplayNextEpisode = value;
                });
              },
            ),
            SizedBox(height: AppScaler.scaleHeight(context, 26)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppScaler.scaleSize(context, 20),
              ),
              child: PoppinsText(
                context,
                'Marketing',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: customColors.textColor,
              ),
            ),
            SizedBox(height: AppScaler.scaleHeight(context, 20)),
            ToggleSettingTile(
              image: AssetImage(Assets.images.gifticon.path),
              titleText: "Promotions & Offers",
              subtitleText: "Special deals and discounts",
              initialValue: _autoplayNextEpisode,
              onChanged: (value) {
                setState(() {
                  _autoplayNextEpisode = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
