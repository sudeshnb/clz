import 'package:flutter/material.dart';

class NavigatorService {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static Future<dynamic> push(String routeName, {dynamic arguments}) async {
    return key.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static void goBack({dynamic value}) {
    return key.currentState?.pop(value);
  }

  static Future<dynamic> pushAndRemove(
    String routeName, {
    bool routePredicate = false,
    dynamic arguments,
  }) async {
    return key.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => routePredicate,
      arguments: arguments,
    );
  }

  static Future<dynamic> popAndPush(
    String routeName, {
    dynamic arguments,
  }) async {
    return key.currentState?.popAndPushNamed(routeName, arguments: arguments);
  }
}
