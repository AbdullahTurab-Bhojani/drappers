import 'package:flutter/material.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';

class SettingSectionHeader extends StatelessWidget {
  const SettingSectionHeader({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppScaler.scaleSize(context, 20),
        AppScaler.scaleHeight(context, 10),
        AppScaler.scaleSize(context, 10),
        AppScaler.scaleHeight(context, 10),
      ),
      child: PoppinsText(
        context,
        title,
        fontSize: PoppinsFontSizeVariant.size16,
        fontWeight: PoppinsFontWeightVariant.medium,
        color: color,
      ),
    );
  }
}
