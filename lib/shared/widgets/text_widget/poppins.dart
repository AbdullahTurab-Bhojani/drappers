part of '../../../drappers.dart';

enum PoppinsFontSizeVariant {
  size6,
  size7,
  size8,
  size9,
  size10,
  size11,
  size12,
  size13,
  size14,
  size15,
  size16,
  size17,
  size18,
  size19,
  size20,
  size21,
  size22,
  size23,
  size24,
  size25,
  size26,
  size32,
}

/// 🔹 Font Weights
enum PoppinsFontWeightVariant {
  thin,
  extraLight,
  light,
  regular,
  medium,
  semiBold,
  bold,
  extraBold,
  black,
}

class PoppinsText extends Text {
  PoppinsText(
    super.data, {
    super.key,
    super.textAlign,
    super.maxLines,
    Color? color,
    double? height,
    double? letterSpacing,
    PoppinsFontSizeVariant fontSize = PoppinsFontSizeVariant.size14,
    PoppinsFontWeightVariant fontWeight = PoppinsFontWeightVariant.regular,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    TextOverflow? textOverflow,
  }) : super(
         style: GoogleFonts.poppins(
           color: color,
           fontSize: _mapFontSize(fontSize),
           fontWeight: _mapFontWeight(fontWeight),
           height: height,
           fontStyle: fontStyle,
           decoration: decoration,
           decorationColor: color,
           letterSpacing: letterSpacing,
         ),
         overflow: textOverflow,
       );

  /// 🔹 Map Size Enum → Double
  static double _mapFontSize(PoppinsFontSizeVariant size) {
    switch (size) {
      case PoppinsFontSizeVariant.size6:
        return 6;
      case PoppinsFontSizeVariant.size7:
        return 7;
      case PoppinsFontSizeVariant.size8:
        return 8;
      case PoppinsFontSizeVariant.size9:
        return 9;
      case PoppinsFontSizeVariant.size10:
        return 10;
      case PoppinsFontSizeVariant.size11:
        return 11;
      case PoppinsFontSizeVariant.size12:
        return 12;
      case PoppinsFontSizeVariant.size13:
        return 13;
      case PoppinsFontSizeVariant.size14:
        return 14;
      case PoppinsFontSizeVariant.size15:
        return 15;
      case PoppinsFontSizeVariant.size16:
        return 16;
      case PoppinsFontSizeVariant.size17:
        return 17;
      case PoppinsFontSizeVariant.size18:
        return 18;
      case PoppinsFontSizeVariant.size19:
        return 19;
      case PoppinsFontSizeVariant.size20:
        return 20;
      case PoppinsFontSizeVariant.size21:
        return 21;
      case PoppinsFontSizeVariant.size22:
        return 22;
      case PoppinsFontSizeVariant.size23:
        return 23;
      case PoppinsFontSizeVariant.size24:
        return 24;
      case PoppinsFontSizeVariant.size25:
        return 25;
      case PoppinsFontSizeVariant.size26:
        return 26;
      case PoppinsFontSizeVariant.size32:
        return 32;
    }
  }

  static FontWeight _mapFontWeight(PoppinsFontWeightVariant weight) {
    switch (weight) {
      case PoppinsFontWeightVariant.thin:
        return FontWeight.w100;
      case PoppinsFontWeightVariant.extraLight:
        return FontWeight.w200;
      case PoppinsFontWeightVariant.light:
        return FontWeight.w300;
      case PoppinsFontWeightVariant.regular:
        return FontWeight.w400;
      case PoppinsFontWeightVariant.medium:
        return FontWeight.w500;
      case PoppinsFontWeightVariant.semiBold:
        return FontWeight.w600;
      case PoppinsFontWeightVariant.bold:
        return FontWeight.w700;
      case PoppinsFontWeightVariant.extraBold:
        return FontWeight.w800;
      case PoppinsFontWeightVariant.black:
        return FontWeight.w900;
    }
  }
}
