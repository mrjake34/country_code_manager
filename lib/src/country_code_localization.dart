import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class CountryCodeLocalization {
  CountryCodeLocalization._();

  static final CountryCodeLocalization _instance = CountryCodeLocalization._();
  static CountryCodeLocalization get instance => _instance;

  Map<String, String>? _localizedStrings;

  String? translate(String? code) {
    return _localizedStrings?[code];
  }

  Future<void> load(SupportedLanguage language) async {
    final jsonString = await rootBundle
        .loadString('packages/country_code/locale/${language.locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }
}

enum SupportedLanguage {
  en(Locale('en')),
  ;

  final Locale locale;

  const SupportedLanguage(this.locale);
}
