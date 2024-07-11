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

  /// Supported languages
  final supportedLanguages = SupportedLanguage.supportedLanguages;

  /// Default language
  final defaultLanguage = SupportedLanguage.en;

  Map<String, String>? _localizedStrings;

  /// Translate the code to the language
  /// If the code is not found, it will return the code itself
  /// Example: en -> English
  /// Example: fr -> French
  String? translate(String? code) {
    final value = _localizedStrings?[code];
    if (value is List) {
      return value?.replaceAll(RegExp(r'[[\]]'), '').split(',').join(', ');
    }
    return value;
  }

  /// Load the language file from the locale folder
  /// The file name should be the language code
  /// Example: en.json, fr.json
  /// The file should be in the locale folder
  Future<void> load(Locale? locale) async {
    var languageCode = locale?.languageCode;
    if (locale == null || !SupportedLanguage(locale).isSupported(locale)) {
      /// If the locale is not supported, use the default language
      languageCode = defaultLanguage.locale.languageCode;
    }
    final jsonString = await rootBundle.loadString(
      'packages/country_code_manager/locale/$languageCode.json',
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

  /// English language for the default language
  static const en = SupportedLanguage(Locale('en'));

  /// [Locale] parameter
  /// for the language
  final Locale locale;

  /// Check if the locale is supported
  bool isSupported(Locale locale) =>
      supportedLanguages.contains(locale.languageCode);

  /// This is the list of supported languages
  static const supportedLanguages = [
    'af',
    'al',
    'dz',
    'as',
    'ad',
    'ao',
    'ai',
    'aq',
    'ag',
    'ar',
    'am',
    'aw',
    'au',
    'at',
    'az',
    'bs',
    'bh',
    'bd',
    'bb',
    'by',
    'be',
    'bz',
    'bj',
    'bm',
    'bt',
    'bo',
    'ba',
    'bw',
    'bv',
    'br',
    'io',
    'bn',
    'bg',
    'bf',
    'bi',
    'kh',
    'cm',
    'ca',
    'cv',
    'ky',
    'cf',
    'td',
    'cl',
    'cn',
    'cx',
    'cc',
    'co',
    'km',
    'cg',
    'cd',
    'ck',
    'cr',
    'ci',
    'hr',
    'cu',
    'cy',
    'cz',
    'dk',
    'dj',
    'dm',
    'do',
    'ec',
    'eg',
    'sv',
    'gq',
    'er',
    'ee',
    'et',
    'fk',
    'fo',
    'fj',
    'fi',
    'fr',
    'gf',
    'pf',
    'tf',
    'ga',
    'gm',
    'ge',
    'de',
    'gh',
    'gi',
    'gr',
    'gl',
    'gd',
    'gp',
    'gu',
    'gt',
    'gn',
    'gw',
    'gy',
    'ht',
    'hm',
    'va',
    'hn',
    'hk',
    'hu',
    'is',
    'in',
    'id',
    'ir',
    'iq',
    'ie',
    'il',
    'it',
    'jm',
    'jp',
    'jo',
    'kz',
    'ke',
    'ki',
    'kp',
    'kr',
    'kw',
    'kg',
    'la',
    'lv',
    'lb',
    'ls',
    'lr',
    'ly',
    'li',
    'lt',
    'lu',
    'mo',
    'mg',
    'mw',
    'my',
    'mv',
    'ml',
    'mt',
    'mh',
    'mq',
    'mr',
    'mu',
    'yt',
    'mx',
    'fm',
    'md',
    'mc',
    'mn',
    'ms',
    'ma',
    'mz',
    'mm',
    'na',
    'nr',
    'np',
    'nl',
    'nc',
    'nz',
    'ni',
    'ne',
    'ng',
    'nu',
    'nf',
    'mk',
    'mp',
    'no',
    'om',
    'pk',
    'pw',
    'ps',
    'pa',
    'pg',
    'py',
    'pe',
    'ph',
    'pn',
    'pl',
    'pt',
    'pr',
    'qa',
    're',
    'ro',
    'ru',
    'rw',
    'sh',
    'kn',
    'lc',
    'pm',
    'vc',
    'ws',
    'sm',
    'st',
    'sa',
    'sn',
    'sc',
    'sl',
    'sg',
    'sk',
    'si',
    'sb',
    'so',
    'za',
    'gs',
    'es',
    'lk',
    'sd',
    'sr',
    'sj',
    'sz',
    'se',
    'ch',
    'sy',
    'tw',
    'tj',
    'tz',
    'th',
    'tl',
    'tg',
    'tk',
    'to',
    'tt',
    'tn',
    'tr',
    'tm',
    'tc',
    'tv',
    'ug',
    'ua',
    'ae',
    'gb',
    'us',
    'um',
    'uy',
    'uz',
    'vu',
    've',
    'vn',
    'vg',
    'vi',
    'wf',
    'eh',
    'ye',
    'zm',
    'zw',
    'ax',
    'bq',
    'cw',
    'gg',
    'im',
    'je',
    'me',
    'bl',
    'mf',
    'rs',
    'sx',
    'ss',
    'xk',
    'no_country',
  ];
}
