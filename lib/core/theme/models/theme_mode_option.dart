import 'package:flutter/material.dart';

class ThemeModeOption {
  final String name;
  final IconData icon;
  final ThemeMode themeMode;

  const ThemeModeOption(
      {required this.name,
      required this.icon,
      required this.themeMode});
}
