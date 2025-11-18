part of '../../../drappers.dart';

class PlusJakartaText extends Text {
  PlusJakartaText(
    super.data, {
    super.key,
    super.textAlign,
    super.maxLines,
    Color color = Colors.black,
    double? height,
    double? letterSpacing,
    double size = 14,
    // double weight = 400,
    FontWeight fontWeight = FontWeight.w400,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    TextOverflow? textOverflow,
  }) : super(
         textDirection: TextDirection.ltr,
         style: GoogleFonts.plusJakartaSans(
           // fontFamily: 'Montserrat',
           color: color,
           fontSize: size,
           height: height,
           fontStyle: fontStyle,
           fontWeight: fontWeight,
           // overflow: textOverflow,
           decoration: decoration,
           decorationColor: color,
           letterSpacing: letterSpacing,
           // fontVariations: [FontVariation.weight(weight)],
         ),
       );
}
