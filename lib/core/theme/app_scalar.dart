import 'package:flutter/material.dart';

class AppScaler {
  static const double referenceWidth = 440;
  static const double referenceHeight = 956;

  static bool _isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static double scaleSize(BuildContext context, double size) {
    final media = MediaQuery.of(context).size;

    final screenWidth = _isLandscape(context) ? media.height : media.width;

    final baseWidth = _isLandscape(context) ? referenceHeight : referenceWidth;

    return size * (screenWidth / baseWidth);
  }

  static double scaleHeight(BuildContext context, double size) {
    final media = MediaQuery.of(context).size;

    final screenHeight = _isLandscape(context) ? media.width : media.height;

    final baseHeight = _isLandscape(context) ? referenceWidth : referenceHeight;

    return size * (screenHeight / baseHeight);
  }
}
