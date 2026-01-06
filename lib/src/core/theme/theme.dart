import 'package:clz/src/core/constants/colors.dart';
import 'package:flutter/material.dart';

import 'dark.dart';
import 'light.dart';

class AppTheme {
  static ThemeData light = lightTheme;

  static ThemeData dark = darkTheme;
}

extension ThemeExtras on ThemeData {
  Color get icon =>
      brightness == Brightness.light ? LightColor.icon : DarkColor.icon;

  // Color get scrollDetective =>
  //     brightness == Brightness.light
  //         ? LightColor.scrollDetective
  //         : DarkColor.scrollDetective;

  Color get card =>
      brightness == Brightness.light ? LightColor.background : DarkColor.card;

  Color get text => brightness == Brightness.light
      ? LightColor.textPrimary
      : DarkColor.textPrimary;

  Color get textOpposite => brightness == Brightness.light
      ? DarkColor.textPrimary
      : LightColor.textPrimary;

  Color get button =>
      brightness == Brightness.light ? LightColor.icon : DarkColor.card;

  Color get divider =>
      brightness == Brightness.light ? AppColor.grey : AppColor.grey;

  // !

  Color get categoryBtn => brightness == Brightness.light
      ? LightColor.primary
      : DarkColor.textSecondary;

  Color get contradictionIcon =>
      brightness == Brightness.light ? DarkColor.card : LightColor.card;

  Color get focusedBorder =>
      brightness == Brightness.light ? DarkColor.card : LightColor.card;
}
