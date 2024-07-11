import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This class is used to translate the country code to the language
/// The language file should be in the locale folder
/// The file name should be the language code
class CountryCodeLocalization {
  CountryCodeLocalization._();

  static final CountryCodeLocalization _instance = CountryCodeLocalization._();

  /// Get the instance of the [CountryCodeLocalization]
  static CountryCodeLocalization get instance => _instance;

  Map<String, String>? _localizedStrings;

  /// Translate the code to the language
  /// If the code is not found, it will return the code itself
  /// Example: en -> English
  /// Example: fr -> French
  String? translate(String? code) {
    return _localizedStrings?[code];
  }

  /// Load the language file from the locale folder
  /// The file name should be the language code
  /// Example: en.json, fr.json
  /// The file should be in the locale folder
  Future<void> load(SupportedLanguage language) async {
    final jsonString = await rootBundle.loadString(
      'packages/country_code_manager/locale/${language.locale.languageCode}.json',
    );
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }
}

/// Supported language
/// Example: en, fr
class SupportedLanguage {
  /// [SupportedLanguage] constructor
  /// with the [locale] parameter
  const SupportedLanguage(this.locale);

  /// English language
  static const en = SupportedLanguage(Locale('en'));

  /// [Locale] parameter
  /// for the language
  final Locale locale;
}
