import 'package:country_code_manager/src/index.dart';

/// Country code manager
/// This class is used to manage the country code
class CountryCodeManager {
  const CountryCodeManager._();

  static const CountryCodeManager _instance = CountryCodeManager._();

  /// Get the instance of the [CountryCodeManager]
  static CountryCodeManager get instance => _instance;

  /// Initialize the country code manager
  Future<void> init([SupportedLanguage? language]) async {
    await CountryCodeLocalization.instance
        .load(language ?? SupportedLanguage.en);
  }

  /// Get the country by the code
  /// Example:
  /// ```dart
  /// CountryCodeManager.instance.getCountryByCode('US');
  /// ```
  /// This will return the country object
  List<Country> get countries => codes.map((e) => Country.fromJson(e)).toList();
}
