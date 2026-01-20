// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';

class TodaynotificationWidget extends StatefulWidget {
  const TodaynotificationWidget({super.key});

  @override
  State<TodaynotificationWidget> createState() =>
      _TodaynotificationWidgetState();
}

class _TodaynotificationWidgetState extends State<TodaynotificationWidget> {
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
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<AppCustomColors>()!;
    return Column(
      children: [
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
                            fontWeight: PoppinsFontWeightVariant.regular,
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 4)),
                          PoppinsText(
                            context,
                            item['time'],
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
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
                      SizedBox(width: AppScaler.scaleSize(context, 12)),
                      Container(
                        margin: EdgeInsets.only(
                          top: AppScaler.scaleHeight(context, 15),
                        ),
                        child: PoppinsText(
                          context,
                          "New!",
                          fontSize: PoppinsFontSizeVariant.size12,
                          fontWeight: PoppinsFontWeightVariant.semiBold,
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
      ],
    );
  }
}
