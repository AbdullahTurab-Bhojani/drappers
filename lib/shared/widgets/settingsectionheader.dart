import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 15.0),
      child: PoppinsText(
        title,
        fontSize: PoppinsFontSizeVariant.size16,
        fontWeight: PoppinsFontWeightVariant.semiBold,
        color: color,
      ),
    );
  }
}