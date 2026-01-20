// ignore_for_file: unnecessary_underscores

import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';

class MoreInfoBottomSheet extends StatelessWidget {
  const MoreInfoBottomSheet({super.key});

  static final List<Map<String, String>> moreInfoList = [
    {"time": "9:00 - 10:00", "title": "Meet the Drapers S1 E1"},
    {"time": "10:00 - 11:00", "title": "Meet the Drapers S1 E2"},
    {"time": "11:00 - 12:00", "title": "Meet the Drapers S1 E3"},
    {"time": "12:00 - 12:30", "title": "Meet the Drapers S1 E4"},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppScaler.scaleSize(context, 20),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: AppScaler.scaleHeight(context, 16),
          left: AppScaler.scaleSize(context, 20),
          right: AppScaler.scaleSize(context, 20),
          bottom: AppScaler.scaleHeight(context, 10),
        ),
        decoration: BoxDecoration(
          color: AppColors.dRegular,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: AppScaler.scaleSize(context, 24)),

                Row(
                  children: [
                    Image.asset(
                      Assets.images.nextmonth.path,
                      width: AppScaler.scaleSize(context, 12),
                      height: AppScaler.scaleHeight(context, 12),
                    ),
                    SizedBox(width: 10),
                    PoppinsText(
                      context,
                      "4 Nov 2025",
                      color: customColors.textColor,
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.medium,
                    ),
                    SizedBox(width: AppScaler.scaleSize(context, 10)),
                    Image.asset(
                      Assets.images.previousmonth.path,
                      width: AppScaler.scaleSize(context, 12),
                      height: AppScaler.scaleHeight(context, 12),
                    ),
                  ],
                ),

                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    Assets.images.crossnewicon.path,
                    width: AppScaler.scaleSize(context, 20),
                    height: AppScaler.scaleHeight(context, 20),
                  ),
                ),
              ],
            ),

            SizedBox(height: AppScaler.scaleHeight(context, 18)),

            Container(
              height: AppScaler.scaleHeight(context, 40),
              decoration: BoxDecoration(
                color: Color(0xff19193E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                style: TextStyle(color: AppColors.white),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                      right: AppScaler.scaleSize(context, 12),
                    ),
                    child: Image.asset(
                      Assets.images.searchicon.path,
                      height: AppScaler.scaleHeight(context, 20),
                      width: AppScaler.scaleSize(context, 20),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: AppScaler.scaleHeight(context, 16)),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      Assets.images.moreinfocalender.path,
                      width: AppScaler.scaleSize(context, 20),
                      height: AppScaler.scaleHeight(context, 20),
                    ),
                    SizedBox(width: AppScaler.scaleSize(context, 12)),
                    PoppinsText(
                      context,
                      'Coming up Next',
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.medium,
                    ),
                  ],
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 16)),

                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: moreInfoList.length,
                  separatorBuilder: (_, __) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppScaler.scaleHeight(context, 12),
                    ),
                    child: Divider(),
                  ),
                  itemBuilder: (context, index) {
                    final item = moreInfoList[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PoppinsText(
                          context,
                          item['time']!,
                          fontSize: PoppinsFontSizeVariant.size14,
                          fontWeight: PoppinsFontWeightVariant.regular,
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 10)),
                        PoppinsText(
                          context,
                          item['title']!,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
