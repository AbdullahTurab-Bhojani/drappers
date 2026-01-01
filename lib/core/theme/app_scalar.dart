import 'package:flutter/material.dart';

class AppScaler {
  static const double referenceWidth = 440;
  static const double referenceHeight = 956;

  static double scaleSize(BuildContext context, double size) {
    final width = MediaQuery.of(context).size.width;
    return size * (width / referenceWidth);
  }

  static double scaleHeight(BuildContext context, double size) {
    final height = MediaQuery.of(context).size.height;
    return size * (height / referenceHeight);
  }
}
