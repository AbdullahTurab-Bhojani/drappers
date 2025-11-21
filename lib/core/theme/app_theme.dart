import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../drappers.dart';
import '../extensions/theme_extension.dart';
import '../local/providers/shared_pref.dart';
part 'app_theme.freezed.dart';
part 'app_theme.g.dart';

enum AppThemeType { defaultTheme, light, dark }

extension AppThemeTypeExtension on AppThemeType {
  String get name {
    switch (this) {
      case AppThemeType.defaultTheme:
        return 'default';
      case AppThemeType.light:
        return 'light';
      case AppThemeType.dark:
        return 'dark';
    }
  }

  static AppThemeType fromString(String name) {
    switch (name) {
      case 'light':
        return AppThemeType.light;
      case 'dark':
        return AppThemeType.dark;
      case 'default':
      default:
        return AppThemeType.defaultTheme;
    }
  }
}

/// 🔹 Theme Definitions
class AppThemes {
  static final Map<AppThemeType, ThemeData> themes = {
    /// 🟣 Default Theme
    AppThemeType.defaultTheme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.dDark,
      extensions: [
        AppCustomColors(
          darkest: AppColors.dDarkest,
          dark: AppColors.dDark,
          regular: AppColors.dRegular,
          light: AppColors.dLight,
          lightest: AppColors.dLightest,
          textColor: AppColors.dTextColor,
          subtextColor: AppColors.dSubTextColor,
          stockSymbolColor: AppColors.dTextColor,
          labelColor: AppColors.dLabel,
          greyColor: AppColors.dGrey,
          textfieldColor: AppColors.tfield,
          buttonColors: AppColors.buttongradientcolor,
          bgcontainerlight: AppColors.containerlight,
          lightGray: AppColors.graylight,
          boxyellow: AppColors.yellowDark,
          yellowlight: AppColors.yellowlight,
          redbox: AppColors.redbox,
          redlight: AppColors.normalred,
          rednormal: AppColors.lightred,
        ),
      ],
    ),

    AppThemeType.light: ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.wRegular,
      extensions: [
        AppCustomColors(
          darkest: AppColors.wDarkest,
          dark: AppColors.wDark,
          regular: AppColors.wRegular,
          light: AppColors.wLight,
          lightest: AppColors.wLightest,
          textColor: AppColors.wTextColor,
          subtextColor: AppColors.wSubTextColor,
          stockSymbolColor: AppColors.wTextColor,
          labelColor: AppColors.wLabel,
          greyColor: AppColors.wGrey,
          textfieldColor: AppColors.tfield,
          buttonColors: AppColors.buttongradientcolor,
          bgcontainerlight: AppColors.containerlight,
          lightGray: AppColors.graylight,
          boxyellow: AppColors.yellowDark,
          yellowlight: AppColors.yellowlight,
          redbox: AppColors.redbox,
          redlight: AppColors.normalred,
          rednormal: AppColors.lightred,
        ),
      ],
    ),

    /// 🌑 Dark Theme
    AppThemeType.dark: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bDark,
      extensions: [
        AppCustomColors(
          darkest: AppColors.bDarkest,
          dark: AppColors.bDark,
          regular: AppColors.bRegular,
          light: AppColors.bLight,
          lightest: AppColors.bLightest,
          textColor: AppColors.bTextColor,
          subtextColor: AppColors.bSubTextColor,
          stockSymbolColor: AppColors.bTextColor,
          labelColor: AppColors.bLabel,
          greyColor: AppColors.bGrey,
          textfieldColor: AppColors.tfield,
          buttonColors: AppColors.buttongradientcolor,
          bgcontainerlight: AppColors.containerlight,
          lightGray: AppColors.graylight,
          boxyellow: AppColors.yellowDark,
          yellowlight: AppColors.yellowlight,
          redbox: AppColors.redbox,
          redlight: AppColors.normalred,
          rednormal: AppColors.lightred,
        ),
      ],
    ),
  };
}

/// 🔹 Immutable State for Custom Theme
@freezed
abstract class CustomThemeState with _$CustomThemeState {
  const factory CustomThemeState({
    required AppThemeType theme,
    required ThemeData themeData,
    required ThemeMode themeMode,
  }) = _CustomThemeState;
}

@Riverpod(keepAlive: true)
class CustomTheme extends _$CustomTheme {
  @override
  CustomThemeState build() {
    _loadTheme();

    return CustomThemeState(
      theme: AppThemeType.defaultTheme,
      themeData: AppThemes.themes[AppThemeType.defaultTheme]!,
      themeMode: ThemeMode.system,
    );
  }

  /// Load saved theme from local storage
  Future<void> _loadTheme() async {
    try {
      await ref.watch(sharedPreferencesProvider.future);
      final localData = ref.read(localDataProvider);
      final savedTheme = localData.getTheme();

      if (savedTheme.isNotEmpty) {
        final themeType = AppThemeTypeExtension.fromString(savedTheme);
        state = CustomThemeState(
          theme: themeType,
          themeData: AppThemes.themes[themeType]!,
          themeMode: _getThemeMode(themeType),
        );
      }
    } catch (e) {
      state = CustomThemeState(
        theme: AppThemeType.defaultTheme,
        themeData: AppThemes.themes[AppThemeType.defaultTheme]!,
        themeMode: ThemeMode.system,
      );
    }
  }

  /// Save theme locally
  Future<void> _saveTheme(AppThemeType theme) async {
    try {
      final localData = ref.read(localDataProvider);
      await localData.saveTheme(theme.name);
    } catch (e) {
      debugPrint('⚠️ Failed to save theme: $e');
    }
  }

  /// Convert AppThemeType → ThemeMode
  ThemeMode _getThemeMode(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.light:
        return ThemeMode.light;
      case AppThemeType.dark:
        return ThemeMode.dark;
      case AppThemeType.defaultTheme:
        return ThemeMode.system;
    }
  }

  /// Apply selected theme
  Future<void> setTheme(AppThemeType theme) async {
    await _saveTheme(theme);
    state = CustomThemeState(
      theme: theme,
      themeData: AppThemes.themes[theme]!,
      themeMode: _getThemeMode(theme),
    );
  }

  /// Toggle between Default → Dark → Light → Default
  Future<void> toggleTheme() async {
    final newTheme = switch (state.theme) {
      AppThemeType.defaultTheme => AppThemeType.dark,
      AppThemeType.dark => AppThemeType.light,
      AppThemeType.light => AppThemeType.defaultTheme,
    };

    await setTheme(newTheme);
  }
}
