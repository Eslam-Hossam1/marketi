import 'package:flutter/material.dart';
import 'package:marketi/core/theme/models/theme_mode_option.dart';

abstract class AppThemeOptions {
  static final ThemeModeOption light = ThemeModeOption(
    name: 'Light',
    icon: Icons.light_mode,
    themeMode: ThemeMode.light,
  );

  static final ThemeModeOption dark = ThemeModeOption(
    name: 'Dark',
    icon: Icons.dark_mode,
    themeMode: ThemeMode.dark,
  );

  static final ThemeModeOption system = ThemeModeOption(
    name: 'System',
    icon: Icons.settings_suggest,
    themeMode: ThemeMode.system,
  );

  static final List<ThemeModeOption> supportedThemes = [light, dark, system];

  static ThemeModeOption getThemeModeOptionFromThemeMode(ThemeMode themeMode) {
    return supportedThemes.firstWhere(
      (option) => option.themeMode == themeMode,
      orElse: () => system, // Default to system if not found
    );
  }
}
