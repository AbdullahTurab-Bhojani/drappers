import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';

class MoreInfoBottomSheet extends StatelessWidget {
  const MoreInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Container(
      padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.dDark,
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

              PoppinsText(
                "4 Nov 2025",
                color: customColors.textColor,
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
              ),

              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  color: customColors.textColor,
                  size: 20,
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Container(
            decoration: BoxDecoration(
              color: Color(0xff19193E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Image.asset(Assets.images.searchicon.path),
                ),
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),

          SizedBox(height: 16),
          Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                children: [
                  Image.asset(Assets.images.commenticon.path),
                  SizedBox(width: 12),
                  PoppinsText(
                    'Coming up Next',
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                  ),
                ],
              ),
              SizedBox(height: 24,),
              PoppinsText(
                '9:00 - 10:00',
                fontSize: PoppinsFontSizeVariant.size14,
                fontWeight: PoppinsFontWeightVariant.regular,
              ),
               SizedBox(height: 8,),
              PoppinsText(
                'Meet the Drapers S1 E1',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
              ),
               SizedBox(height: 20,),
               Divider(),
               SizedBox(height: 20,),
                 PoppinsText(
                '10:00 - 11:00',
                fontSize: PoppinsFontSizeVariant.size14,
                fontWeight: PoppinsFontWeightVariant.regular,
              ),
               SizedBox(height: 8,),
              PoppinsText(
                'Meet the Drapers S1 E2',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
              ),
               SizedBox(height: 20,),
               Divider(),
               SizedBox(height: 20,),
                 PoppinsText(
                '11:00 - 12:00',
                fontSize: PoppinsFontSizeVariant.size14,
                fontWeight: PoppinsFontWeightVariant.regular,
              ),
               SizedBox(height: 8,),
              PoppinsText(
                'Meet the Drapers S1 E3',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
              ),
               SizedBox(height: 20,),
               Divider(),
               SizedBox(height: 20,),
                 PoppinsText(
                '12:00 - 12:30',
                fontSize: PoppinsFontSizeVariant.size14,
                fontWeight: PoppinsFontWeightVariant.regular,
              ),
               SizedBox(height: 8,),
              PoppinsText(
                'Meet the Drapers S1 E4',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
              ),
               SizedBox(height: 20,),
               Divider()

            ],
          ),

          // SizedBox(height: 10),
        ],
      ),
    );
  }
}
