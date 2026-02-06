import 'package:flutter/material.dart';

import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';

class TileWidget extends StatelessWidget {
  final String title;
  final String iconImage;
  final Color textColor;
  final VoidCallback? onTap; // callback function

  const TileWidget({
    super.key,
    required this.title,
    required this.iconImage,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // InkWell better than GestureDetector for taps
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(
          vertical: AppScaler.scaleHeight(context, 12),
          horizontal: AppScaler.scaleSize(context, 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  iconImage,
                  width: AppScaler.scaleSize(context, 24),
                  height: AppScaler.scaleHeight(context, 24),
                ),
                SizedBox(width: AppScaler.scaleSize(context, 20)),
                PoppinsText(
                  context,
                  title,
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.medium,
                  color: textColor,
                ),
              ],
            ),
            onTap != null
                ? Icon(Icons.arrow_forward_ios, size: 16)
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
