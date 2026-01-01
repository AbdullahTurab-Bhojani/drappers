import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';

class MoreInfoBottomSheet extends StatelessWidget {
  const MoreInfoBottomSheet({super.key});

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
                SizedBox(width: 24),

                Row(
                  children: [
                    Image.asset(
                      Assets.images.nextmonth.path,
                      width: 12,
                      height: 12,
                    ),
                    SizedBox(width: 10),
                    PoppinsText(
                      context,
                      "4 Nov 2025",
                      color: customColors.textColor,
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.medium,
                    ),
                    SizedBox(width: 10),

                    Image.asset(
                      Assets.images.previousmonth.path,
                      width: 12,
                      height: 12,
                    ),
                  ],
                ),

                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    Assets.images.crossnewicon.path,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),

            SizedBox(height: 18),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff19193E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                textAlign: TextAlign.left,
                style: TextStyle(color: AppColors.white),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  isDense: true,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Image.asset(
                      Assets.images.searchicon.path,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),

            SizedBox(height: 16),
            Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      Assets.images.moreinfocalender.path,
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 12),
                    PoppinsText(
                      context,
                      'Coming up Next',
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.medium,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                PoppinsText(
                  context,
                  '9:00 - 10:00',
                  fontSize: PoppinsFontSizeVariant.size14,
                  fontWeight: PoppinsFontWeightVariant.regular,
                ),
                SizedBox(height: 10),
                PoppinsText(
                  context,
                  'Meet the Drapers S1 E1',
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.medium,
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                PoppinsText(
                  context,
                  '10:00 - 11:00',
                  fontSize: PoppinsFontSizeVariant.size14,
                  fontWeight: PoppinsFontWeightVariant.regular,
                ),
                SizedBox(height: 10),

                PoppinsText(
                  context,
                  'Meet the Drapers S1 E2',
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.medium,
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                PoppinsText(
                  context,
                  '11:00 - 12:00',
                  fontSize: PoppinsFontSizeVariant.size14,
                  fontWeight: PoppinsFontWeightVariant.regular,
                ),
                SizedBox(height: 10),

                PoppinsText(
                  context,
                  'Meet the Drapers S1 E3',
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.medium,
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                PoppinsText(
                  context,
                  '12:00 - 12:30',
                  fontSize: PoppinsFontSizeVariant.size14,
                  fontWeight: PoppinsFontWeightVariant.regular,
                ),
                SizedBox(height: 10),

                PoppinsText(
                  context,
                  'Meet the Drapers S1 E4',
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.medium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
