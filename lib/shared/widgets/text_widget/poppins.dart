part of '../../../drappers.dart';

class PoppinsText extends Text {
  PoppinsText(
    super.data, {
    super.key,
    super.textAlign,
    super.maxLines,
    Color? color,
    double? height,
    double? letterSpacing,
    double size = 14,
    FontWeight fontWeight = FontWeight.w400,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    TextOverflow? textOverflow,
  }) : super(
         //  textDirection: TextDirection.ltr,
         style: GoogleFonts.poppins(
           color: color,
           fontSize: size,
           height: height,
           fontStyle: fontStyle,
           fontWeight: fontWeight,
           decoration: decoration,
           decorationColor: color,
           letterSpacing: letterSpacing,
         ),
       );
}
