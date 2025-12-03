import 'package:flutter/material.dart';

@immutable
class AppCustomColors extends ThemeExtension<AppCustomColors> {
  final Color darkest;
  final Color dark;
  final Color regular;
  final Color light;
  final Color lightest;
  final Color textColor;
  final Color subtextColor;
  final Color stockSymbolColor;
  final Color labelColor;
  final Color greyColor;
  final Color textfieldColor;
  final Color bgcontainerlight;
  final Color lightGray;
  final Color boxyellow;
  final Color yellowlight;
  final Color redbox;
  final Color redlight;
  final Color rednormal;
  final Color blackshade;
  final Color redshade;


  final Color popupdelete;
  final Color mahroon;

  final List<Color> buttonColors;

  const AppCustomColors({
    required this.darkest,
    required this.dark,
    required this.regular,
    required this.light,
    required this.lightest,
    required this.textColor,
    required this.subtextColor,
    required this.stockSymbolColor,
    required this.labelColor,
    required this.greyColor,
    required this.textfieldColor,
    required this.buttonColors,
    required this.bgcontainerlight,
    required this.lightGray,
    required this.boxyellow,
    required this.yellowlight,
    required this.redbox,
    required this.redlight,
    required this.rednormal,
    required this.blackshade,
    required this.popupdelete,
    required this.mahroon,
    required this.redshade,
  });

  @override
  AppCustomColors copyWith({
    Color? darkest,
    Color? dark,
    Color? regular,
    Color? light,
    Color? lightest,
    Color? textColor,
    Color? subtextColor,
    Color? stockSymbolColor,
    Color? labelColor,
    Color? greyColor,
    Color? textfieldColor,
    Color? bgcontainerlight,
    Color? lightGray,
    Color? boxyellow,
    Color? yellowlight,
    Color? redbox,
    Color? redlight,
    Color? rednormal,
    Color? blackshade,
    Color? redshade,

    Color? mahroon,

    LinearGradient? buttongradient,
  }) {
    return AppCustomColors(
      darkest: darkest ?? this.darkest,
      dark: dark ?? this.dark,
      regular: regular ?? this.regular,
      light: light ?? this.light,
      lightest: lightest ?? this.lightest,
      textColor: textColor ?? this.textColor,
      subtextColor: subtextColor ?? this.subtextColor,
      stockSymbolColor: stockSymbolColor ?? this.stockSymbolColor,
      labelColor: labelColor ?? this.labelColor,
      greyColor: greyColor ?? this.greyColor,
      textfieldColor: textfieldColor ?? this.textfieldColor,
      bgcontainerlight: bgcontainerlight ?? this.bgcontainerlight,
      lightGray: bgcontainerlight ?? this.bgcontainerlight,
      boxyellow: boxyellow ?? this.boxyellow,
      yellowlight: yellowlight ?? this.yellowlight,
      redbox: redbox ?? this.redbox,
      redlight: redlight ?? this.redlight,
      rednormal: rednormal ?? this.rednormal,
      blackshade: blackshade ?? this.blackshade,

      popupdelete: popupdelete,
      mahroon: mahroon ?? this.mahroon,
      redshade: redshade ?? this.redshade,
      buttonColors: buttonColors,
    );
  }

  @override
  AppCustomColors lerp(ThemeExtension<AppCustomColors>? other, double t) {
    if (other is! AppCustomColors) return this;

    List<Color> lerpColorList(List<Color> a, List<Color> b, double t) {
      final length = a.length < b.length ? a.length : b.length;
      return List.generate(length, (i) => Color.lerp(a[i], b[i], t)!);
    }

    return AppCustomColors(
      darkest: Color.lerp(darkest, other.darkest, t)!,
      dark: Color.lerp(dark, other.dark, t)!,
      regular: Color.lerp(regular, other.regular, t)!,
      light: Color.lerp(light, other.light, t)!,
      lightest: Color.lerp(lightest, other.lightest, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      subtextColor: Color.lerp(subtextColor, other.subtextColor, t)!,
      stockSymbolColor: Color.lerp(
        stockSymbolColor,
        other.stockSymbolColor,
        t,
      )!,
      labelColor: Color.lerp(labelColor, other.labelColor, t)!,
      greyColor: Color.lerp(greyColor, other.greyColor, t)!,
      textfieldColor: Color.lerp(textfieldColor, other.textfieldColor, t)!,
      bgcontainerlight: Color.lerp(textfieldColor, other.textfieldColor, t)!,
      lightGray: Color.lerp(lightGray, other.lightGray, t)!,
      boxyellow: Color.lerp(boxyellow, other.boxyellow, t)!,
      yellowlight: Color.lerp(yellowlight, other.yellowlight, t)!,
      redbox: Color.lerp(redbox, other.redbox, t)!,
      redlight: Color.lerp(redlight, other.redlight, t)!,
      rednormal: Color.lerp(rednormal, other.rednormal, t)!,
      blackshade: Color.lerp(blackshade, other.blackshade, t)!,

      buttonColors: lerpColorList(buttonColors, other.buttonColors, t),
      popupdelete: Color.lerp(popupdelete, other.popupdelete, t)!,
      mahroon: Color.lerp(mahroon, other.mahroon, t)!,
      redshade: Color.lerp(redshade, other.redshade, t)!,
    );
  }
}
