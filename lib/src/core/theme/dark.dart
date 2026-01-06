import 'package:clz/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  highlightColor: AppColor.transparent,
  splashColor: AppColor.transparent,
  primaryColor: DarkColor.primary,
  dividerColor: DarkColor.textSecondary,
  cardColor: DarkColor.card,
  // textTheme: TextTheme(),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: DarkColor.secondary,
    brightness: Brightness.dark,
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: DarkColor.textPrimary),
    surfaceTintColor: AppColor.transparent,
    backgroundColor: DarkColor.background,
    scrolledUnderElevation: 0.0,
    elevation: 0,
  ),
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: DarkColor.background,
  fontFamily: 'UberMove',
  canvasColor: AppColor.transparent,
  textTheme: const TextTheme(
    //
    displayLarge: AppDarkTextStyle.displayLarge,
    displayMedium: AppDarkTextStyle.displayMedium,
    displaySmall: AppDarkTextStyle.displaySmall,
    //
    headlineLarge: AppDarkTextStyle.headlineLarge,
    headlineMedium: AppDarkTextStyle.headlineMedium,
    headlineSmall: AppDarkTextStyle.headlineSmall,
    //
    bodyLarge: AppDarkTextStyle.bodyLarge,
    bodyMedium: AppDarkTextStyle.bodyMedium,
    bodySmall: AppDarkTextStyle.bodySmall,
    //
    titleLarge: AppDarkTextStyle.titleLarge,
    titleMedium: AppDarkTextStyle.titleMedium,
    titleSmall: AppDarkTextStyle.titleSmall,

    //
    labelLarge: AppDarkTextStyle.labelLarge,
    labelMedium: AppDarkTextStyle.labelMedium,
    labelSmall: AppDarkTextStyle.button,
  ),
);
