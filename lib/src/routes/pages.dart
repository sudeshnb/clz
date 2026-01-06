import 'package:clz/src/app/initial_screen.dart';
import 'package:clz/src/core/animations/animation.dart';
import 'package:clz/src/core/errors/exception.dart';
import 'package:clz/src/features/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'names.dart';

class AppRoute {
  static const initial = RoutesName.initial;
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.initial:
        return PageFadeTransition(child: InitialScreen()).build;

      case RoutesName.home:
        return PageFadeTransition(child: Dashboard()).build;

      default:
        // If there is no such named route in the switch statement
        throw const RouteException('Route not found!');
    }
  }
}
