import 'package:NexToyMobile/Core/Constants/App/app_constanst.dart';
import 'package:NexToyMobile/Core/Localization/language_service.dart';
import 'package:NexToyMobile/Core/Navigation/navigation_service.dart';
import 'package:NexToyMobile/Core/Notifier/app_provider.dart';
import 'package:NexToyMobile/Core/Notifier/theme_provider.dart';
import 'package:NexToyMobile/Views/CustomNavBar/custom_nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(EasyLocalization(
      path: LanguageService.path,
      supportedLocales: LanguageService().locales,
      saveLocale: true,
      child:
          MultiProvider(providers: AppProvider().providers, child: MyApp())));
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
      home: CustomNavBar(),
    );
  }
}
