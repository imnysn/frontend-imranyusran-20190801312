import 'package:flutter/material.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static Future to(
    Widget route,
  ) {
    return navigator.push(MaterialPageRoute(builder: (context) => route));
  }

  static Future clearTopTo(
    Widget route,
  ) {
    return navigator
        .pushReplacement(MaterialPageRoute(builder: (context) => route));
  }

  static Future clearAll(
    Widget route,
  ) {
    return navigator.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => route), (route) => false);
  }

  static void back<T extends Object?>([
    T? result,
  ]) {
    return navigator.pop(result);
  }
}
