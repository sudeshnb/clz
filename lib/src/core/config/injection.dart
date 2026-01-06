import 'dart:developer';
import 'package:clz/src/core/constants/colors.dart';
import 'package:clz/src/core/services/storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'get_it.dart';

class AppInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // await PushNotification.initNotifacion();
    // await NotificationService.initialize();
    // Initialize dependencies using get_it or similar.
    await configureDependencies();

    // Bloc.observer = AppBlocObserver();

    await EasyLocalization.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    flutterLogError();

    await StorageService().init();
  }

  static void flutterLogError() {
    EasyLocalization.logger.enableBuildModes = [];
    FlutterError.onError = (details) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor: AppColor.danger),
          body: Center(child: Text(details.toString())),
        ),
      );
    };
    Logger.root.level = Level.INFO;
    Logger.root.onRecord.listen((record) {});
  }
}
