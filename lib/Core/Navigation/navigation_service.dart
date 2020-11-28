import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static NavigationService _singleton = NavigationService._internal();

  factory NavigationService() {
    return _singleton;
  }
  NavigationService._internal();

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  Future<bool> navigateTo(Widget route) {
    return _navigatorKey.currentState.push(MaterialPageRoute(
      builder: (BuildContext context) => route,
    ));
  }

  Future<bool> navigateToReplace(Widget route) {
    return _navigatorKey.currentState.pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => route));
  }

  void navigatePop() {
    _navigatorKey.currentState.pop();
  }
}
