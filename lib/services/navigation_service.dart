import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static naviateTo(String routeName) {
    navigatorKey.currentState!.pushNamed(routeName);
  }

  static replaceTo(String routeName) {
    navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
