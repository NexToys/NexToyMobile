import 'package:flutter/material.dart';

class NavigatorService {
  static NavigatorService _instance = NavigatorService._internal();
  static NavigatorService get instance => _instance;
  /*
  static NavigatorService _singleton = NavigatorService._internal();
  factory NavigatorService() {
    return _singleton;
  }*/

  NavigatorService._internal();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<bool> navigateTo(Widget route) {
    return _navigatorKey.currentState
        .push(MaterialPageRoute(builder: (BuildContext context) => route));
  }

  Future<bool> navigateToReplace(Widget route) {
    return _navigatorKey.currentState.pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => route));
  }

  void navigatePop() {
    _navigatorKey.currentState.pop();
  }
}
