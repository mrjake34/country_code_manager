import 'package:country_code_manager/src/index.dart';
import 'package:flutter/material.dart';

export 'src/country.dart' show Country;
export 'src/show_countries.dart' show ShowCountries;
export 'src/show_dial_code.dart' show ShowDialCode;
export 'src/show_flag.dart' show ShowFlag;

/// Country code manager
/// This class is used to manage the country code
class CountryCodeManager {
  const CountryCodeManager._();

  static const CountryCodeManager _instance = CountryCodeManager._();

  /// Check if the country code manager is loaded
  static bool _isLoaded = false;

  /// Get the instance of the [CountryCodeManager]
  /// if the instance is not loaded, it will throw an exception
  static CountryCodeManager get instance => _instance;

  /// Initialize the country code manager
  Future<void> init([Locale? locale]) async {
    final result = await CountryCodeLocalization.instance.load(locale);
    _isLoaded = result;
  }

  /// Get the country by the code
  /// Example:
  /// ```dart
  /// CountryCodeManager.instance.getCountryByCode('US');
  /// ```
  Country? getCountryByCode(String code) {
    return countries.firstWhere(
      (element) => element.code == code,
    );
  }

  /// This will return the country object
  /// Example:
  /// ```dart
  /// Country(name: 'United States', code: 'US', dialCode: '+1')
  /// ```
  List<Country> get countries {
    assert(_isLoaded, 'Country code manager is not initialized');
    return codes.map(Country.fromJson).toList();
  }

  /// Get the dial code of the country
  /// Example:
  /// ```dart
  /// CountryCodeManager.instance.dialCode;
  /// ```
  /// This will return the dial code of the country
  /// Example:
  /// ```dart
  /// ['+1', '+44', '+62', '+91']
  /// ```
  List<String?> get dialCode {
    assert(_isLoaded, 'Country code manager is not initialized');
    final intList = codes
        .map(
          (e) => int.tryParse(
            Country.fromJson(e).dialCode?.replaceAll('+', '') ?? '',
          ),
        )
        .toList();
    final sortedList = intList..sort();
    return sortedList.map((e) => '+$e').toList();
  }
}
