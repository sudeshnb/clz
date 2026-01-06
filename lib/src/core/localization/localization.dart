import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  static List<Locale> supportedLocales = const [Locale('en'), Locale('si')];
  static String path = 'assets/translations';
  static Locale fallbackLocale = const Locale('en');

  static List<Language> languages = [
    Language(flag: '🇬🇧', name: 'English', locale: const Locale('en')),
    Language(flag: '🇱🇰', name: 'සිංහල', locale: const Locale('si')),
  ];
}

extension LocalizationExtension on String {
  String get t => this.tr();
}

class Language {
  final String flag;
  final String name;
  final Locale locale;

  Language({required this.flag, required this.name, required this.locale});
}
