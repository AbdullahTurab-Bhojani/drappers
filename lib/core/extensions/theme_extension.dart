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
    );
  }

  @override
  AppCustomColors lerp(ThemeExtension<AppCustomColors>? other, double t) {
    if (other is! AppCustomColors) return this;
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
    );
  }
}
