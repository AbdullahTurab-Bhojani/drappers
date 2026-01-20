// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';

class CustomVideoCard extends StatelessWidget {
  final Gradient? fillGradient;
  final Color strokeColor;
  final double strokeWidth;
  final String title;
  final String subtitle;
  final String thumbnailPath;
  final String playIconPath;
  final double width;
  final double height;

  const CustomVideoCard({
    super.key,
    this.fillGradient,
    this.strokeColor = Colors.transparent,
    this.strokeWidth = 0,
    required this.title,
    required this.subtitle,
    required this.thumbnailPath,
    required this.playIconPath,
    this.width = double.infinity,
    this.height = 85,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: AppScaler.scaleSize(context, height),
      decoration: BoxDecoration(
        gradient: fillGradient,
        border: Border.all(color: strokeColor, width: strokeWidth),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppScaler.scaleSize(context, 10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: AppScaler.scaleSize(context, 84),
                  height: AppScaler.scaleHeight(context, 60),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(thumbnailPath),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  width: AppScaler.scaleSize(context, 75),
                  height: AppScaler.scaleHeight(context, 55),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Image.asset(
                      playIconPath,
                      width: AppScaler.scaleSize(context, 22),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: AppScaler.scaleSize(context, 15)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PoppinsText(
                    context,
                    title,
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  PoppinsText(
                    context,
                    subtitle,
                    fontSize: PoppinsFontSizeVariant.size12,
                    fontWeight: PoppinsFontWeightVariant.regular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
