import 'dart:developer';
import 'dart:async';
import 'package:clz/src/core/config/injection.dart';
import 'package:clz/src/core/localization/localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app.dart';

class AppRun {
  static Future<void> boot(Environment env) async {
    await runZonedGuarded<Future<void>>(() async {
      await AppInjection.init();
      // Wait for the first user event to ensure authentication state is loaded
      runApp(
        EasyLocalization(
          supportedLocales: AppLocalization.supportedLocales,
          path: AppLocalization.path,
          fallbackLocale: AppLocalization.fallbackLocale,
          child: const MainApp(),
        ),
      );
      // configLoading();
    }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
  }
}

enum Environment { dev, prod, test }
