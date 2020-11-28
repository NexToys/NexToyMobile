import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'theme_provider.dart';

class AppProvider {
  static AppProvider _singleton = AppProvider._internal();

  factory AppProvider() {
    return _singleton;
  }

  AppProvider._internal();

  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
  ];
}
