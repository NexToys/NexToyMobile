import 'package:flutter/material.dart';

import '../Navigation/navigation_service.dart';

abstract class BaseViewModel extends ChangeNotifier {
  final navigator = NavigatorService.instance;
  void init();
}
