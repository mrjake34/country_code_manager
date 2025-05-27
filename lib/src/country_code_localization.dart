import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Manages localization for country codes, providing translation and loading of language-specific resources.
///
/// This singleton class handles loading and translating country code localization files,
/// supporting multiple languages and providing a default language fallback mechanism.
class CountryCodeLocalization {
  CountryCodeLocalization._();

  static final CountryCodeLocalization _instance = CountryCodeLocalization._();

  /// Provides access to the singleton instance of [CountryCodeLocalization].
  ///
  /// This getter returns the single, globally accessible instance of the
  /// [CountryCodeLocalization] class, ensuring consistent localization
  /// management across the application.
  ///
  /// Returns the singleton [CountryCodeLocalization] instance.
  static CountryCodeLocalization get instance => _instance;

  /// A list of all supported languages for localization.
  ///
  /// This property provides access to the predefined set of supported languages
  /// that can be used for country code localization. It allows checking and
  /// selecting from the available language options in the localization system.
  final List<String> supportedLanguages = SupportedLanguage.supportedLanguages;

  /// Defines the default language for localization, set to English.
  ///
  /// This property provides a fallback language when no specific locale is specified
  /// or when the requested locale is not supported by the localization system.
  final SupportedLanguage defaultLanguage = SupportedLanguage.en;

  Map<String, String>? _localizedStrings;

  /// Translates a given localization code to its corresponding localized string.
  ///
  /// Retrieves the localized string for the provided [code] from the [_localizedStrings] map.
  /// If the value is a list, it converts the list to a comma-separated string by removing
  /// square brackets and joining the elements.
  ///
  /// [code] The localization code to translate.
  ///
  /// Returns the translated string, or `null` if no translation is found.
  String? translate(String? code) {
    final value = _localizedStrings?[code];
    if (value is List) {
      return value?.replaceAll(RegExp(r'[[\]]'), '').split(',').join(', ');
    }
    return value;
  }

  /// Loads localization data for a specified locale, falling back to the default language if needed.
  ///
  /// Attempts to load a JSON localization file for the given locale. If the locale is not supported
  /// or is null, it falls back to the default language. Parses the JSON file and populates
  /// [_localizedStrings] with the localization key-value pairs.
  ///
  /// [locale] The locale to load localization data for.
  ///
  /// Returns `true` if the localization file is successfully loaded, `false` otherwise.
  Future<bool> load(Locale? locale) async {
    try {
      var languageCode = locale?.languageCode;
      if (locale == null || !SupportedLanguage(locale).isSupported(locale)) {
        // If the locale is not supported, use the default language
        languageCode = defaultLanguage.locale.languageCode;
      }
      final jsonString = await rootBundle.loadString(
        'packages/country_code_manager/locale/$languageCode.json',
      );
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      _localizedStrings = jsonMap.map((key, value) {
        return MapEntry(key, value.toString());
      });
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}

/// Represents a supported language for localization purposes.
///
/// This class encapsulates a [Locale] and provides methods to check language support,
/// serving as a utility for managing language-specific localization in the application.
class SupportedLanguage {
  /// Constructs a [SupportedLanguage] instance with the specified [locale].
  ///
  /// This constructor initializes a [SupportedLanguage] object with a given [Locale],
  /// representing a specific language for localization purposes.
  ///
  /// [locale] The locale associated with this supported language.
  const SupportedLanguage(this.locale);

  /// Represents the English language locale for localization purposes.
  ///
  /// This static constant provides a pre-configured [SupportedLanguage] instance
  /// for the English language, using the standard 'en' language code.
  static const en = SupportedLanguage(Locale('en'));

  /// The locale associated with this language.
  ///
  /// Represents the specific locale (language and optional country code)
  /// for the supported language instance.
  final Locale locale;

  /// Checks if the given [locale] is supported by verifying its language code is in the list of supported languages.
  ///
  /// Returns `true` if the locale's language code is present in [supportedLanguages], otherwise returns `false`.
  bool isSupported(Locale locale) =>
      supportedLanguages.contains(locale.languageCode);

  /// A list of supported country codes in ISO 3166-1 alpha-2 format.
  ///
  /// This list includes country codes for various countries and territories,
  /// with 'no_country' as a special case for handling scenarios without a specific country.
  ///
  /// The list is used for localization and country-specific operations in the application.
  static const supportedLanguages = [
    'en',
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
