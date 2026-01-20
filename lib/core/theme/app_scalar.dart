import 'package:flutter/material.dart';

class AppScaler {
  static const double referenceWidth = 440;
  static const double referenceHeight = 956;

  static Size _screen(BuildContext context) => MediaQuery.of(context).size;

  static bool _isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  static double scaleSize(BuildContext context, double size) {
    final screen = _screen(context);

    final baseWidth = _isLandscape(context) ? referenceHeight : referenceWidth;

    final width = _isLandscape(context) ? screen.height : screen.width;

    return size * (width / baseWidth);
  }

  static double scaleHeight(BuildContext context, double size) {
    final screen = _screen(context);

    final baseHeight = _isLandscape(context) ? referenceWidth : referenceHeight;

    final height = _isLandscape(context) ? screen.width : screen.height;

    return size * (height / baseHeight);
  }

  static double scaleFont(BuildContext context, double fontSize) {
    final screen = _screen(context);

    final shortestSide = screen.width < screen.height
        ? screen.width
        : screen.height;

    final baseShortest = referenceWidth < referenceHeight
        ? referenceWidth
        : referenceHeight;

    final scale = (shortestSide / baseShortest).clamp(0.9, 1.15);

    return fontSize * scale;
  }
}
