import 'package:flutter/material.dart';

import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';

class YesterdaynotificationWidget extends StatefulWidget {
  const YesterdaynotificationWidget({super.key});

  @override
  State<YesterdaynotificationWidget> createState() =>
      _YesterdaynotificationWidgetState();
}

class _YesterdaynotificationWidgetState
    extends State<YesterdaynotificationWidget> {
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
    return Column(
      mainAxisAlignment: .center,
      children: [
        Container(
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
      ],
    );
  }
}
