import 'package:clz/src/core/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  static const String _themePrefKey = 'theme_preference';

  ThemeCubit() : super(_lightTheme) {
    _loadTheme();
  }

  // Define light and dark themes
  static final ThemeData _lightTheme = AppTheme.light;

  static final ThemeData _darkTheme = AppTheme.dark;

  // Load the theme from shared preferences
  void _loadTheme() async {
    final isDarkMode = StorageService.getBool(_themePrefKey);
    emit(isDarkMode ? _darkTheme : _lightTheme);
  }

  // Toggle theme and save preference
  void toggleTheme() async {
    final isDarkMode = state.brightness == Brightness.dark;
    emit(isDarkMode ? _lightTheme : _darkTheme);

    await StorageService.setBool(_themePrefKey, !isDarkMode);
  }
}

extension ThemeDataX on ThemeData {
  bool get isDark => brightness == Brightness.dark;
}
