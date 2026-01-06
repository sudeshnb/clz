import 'package:clz/src/core/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<String> {
  static final LocaleRepository _repository = LocaleRepository();

  LocaleCubit() : super('us') {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final savedLocale = await _repository.getSavedLocale();
    if (savedLocale != null) {
      emit(savedLocale.languageCode);
    }
  }

  Future<void> changeLocale(Locale newLocale) async {
    try {
      await _repository.saveLocale(newLocale);
      emit(newLocale.languageCode);
    } catch (_) {}
  }
}

// 3. Locale Repository (Persistence Layer)
class LocaleRepository {
  static const _localeKey = 'app_locale';
  final Locale defaultLocale = const Locale('en');

  Future<Locale?> getSavedLocale() async {
    final localeCode = StorageService.getString(_localeKey);
    return localeCode.isNotEmpty ? Locale(localeCode) : null;
  }

  Future<void> saveLocale(Locale locale) async {
    await StorageService.setString(_localeKey, locale.languageCode);
  }
}
