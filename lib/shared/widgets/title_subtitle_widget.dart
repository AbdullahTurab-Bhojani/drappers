import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';
import '../../core/theme/app_scalar.dart';

class TitleSubtitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final AppCustomColors colors;

  const TitleSubtitleWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppScaler.scaleHeight(context, 20),
            bottom: AppScaler.scaleHeight(context, 8),
          ),
          child: PoppinsText(
            context,
            title,
            color: colors.textColor,
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.medium,
          ),
        ),
        PoppinsText(
          context,
          subtitle,
          color: colors.textColor,
          fontSize: PoppinsFontSizeVariant.size12,
          fontWeight: PoppinsFontWeightVariant.regular,
        ),
      ],
    );
  }
}
