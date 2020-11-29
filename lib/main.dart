import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Core/Constants/App/app_constanst.dart';
import 'Core/Localization/language_service.dart';
import 'Core/Navigation/navigation_service.dart';
import 'Core/Notifier/app_provider.dart';
import 'Core/Notifier/theme_provider.dart';
import 'Views/Login/login_view.dart';

void main() {
  runApp(
    EasyLocalization(
      path: LanguageService.path,
      supportedLocales: LanguageService().locales,
      saveLocale: true,
      child: MultiProvider(
        providers: AppProvider().providers,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstansts.appName,
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      navigatorKey: NavigatorService().navigatorKey,
      theme: Provider.of<ThemeProvider>(context).getTheme,
      home: Login(),
    );
  }
}
