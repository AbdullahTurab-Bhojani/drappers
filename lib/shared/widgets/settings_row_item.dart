import 'package:flutter/material.dart';
import '../../drappers.dart';
import '../../core/theme/app_scalar.dart';

class SettingsRowItem extends StatelessWidget {
  final String text;
  final String iconPath;
  final Color? iconColor;
  final VoidCallback onTap;

  const SettingsRowItem({
    super.key,
    required this.text,
    required this.iconPath,
    this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                iconPath,
                height: AppScaler.scaleHeight(context, 26),
                width: AppScaler.scaleSize(context, 26),
                color: iconColor,
              ),
              SizedBox(width: AppScaler.scaleSize(context, 15)),
              PoppinsText(
                context,
                text,
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
                color:
                    iconColor ?? Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).textTheme.bodyMedium?.color,
            size: 18,
          ),
        ],
      ),
    );
  }
}
