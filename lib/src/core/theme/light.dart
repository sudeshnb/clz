import 'package:clz/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  highlightColor: AppColor.transparent,
  splashColor: AppColor.transparent,
  primaryColor: LightColor.primary,
  dividerColor: LightColor.textSecondary,
  cardColor: LightColor.card,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: LightColor.secondary,
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: LightColor.textPrimary),
    surfaceTintColor: AppColor.transparent,
    backgroundColor: LightColor.background,
    scrolledUnderElevation: 0.0,
    elevation: 0,
  ),
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: LightColor.background,
  fontFamily: 'UberMove',
  canvasColor: AppColor.transparent,
  textTheme: const TextTheme(
    //
    displayLarge: AppLightTextStyle.displayLarge,
    displayMedium: AppLightTextStyle.displayMedium,
    displaySmall: AppLightTextStyle.displaySmall,
    //
    headlineLarge: AppLightTextStyle.headlineLarge,
    headlineMedium: AppLightTextStyle.headlineMedium,
    headlineSmall: AppLightTextStyle.headlineSmall,
    //
    bodyLarge: AppLightTextStyle.bodyLarge,
    bodyMedium: AppLightTextStyle.bodyMedium,
    bodySmall: AppLightTextStyle.bodySmall,
    //
    titleLarge: AppLightTextStyle.titleLarge,
    titleMedium: AppLightTextStyle.titleMedium,
    titleSmall: AppLightTextStyle.titleSmall,

    //
    labelLarge: AppLightTextStyle.labelLarge,
    labelMedium: AppLightTextStyle.labelMedium,
    //
    labelSmall: AppLightTextStyle.button,
  ),
);
