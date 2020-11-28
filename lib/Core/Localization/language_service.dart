import 'package:flutter/material.dart';

class LanguageService {
  static const String path = "assets/lang";

  static LanguageService _singleton = LanguageService._internal();

  factory LanguageService() {
    return _singleton;
  }
  LanguageService._internal();

  final enLocale = Locale("en", "US");
  final trLocale = Locale("tr", "TR");

  List<Locale> get locales => [
        enLocale,
        trLocale,
      ];
}
