import 'package:country_code_manager/src/index.dart';
import 'package:flutter/material.dart';

export 'src/country.dart' show Country;
export 'src/show_countries.dart' show ShowCountries;
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
    await CountryCodeLocalization.instance.load(locale);
    _isLoaded = true;
  }

  /// Get the country by the code
  /// Example:
  /// ```dart
  /// CountryCodeManager.instance.getCountryByCode('US');
  /// ```
  /// This will return the country object
  List<Country> get countries {
    assert(_isLoaded, 'Country code manager is not initialized');
    return codes.map((e) => Country.fromJson(e)).toList();
  }
}
