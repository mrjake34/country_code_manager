import 'package:country_code_manager/src/index.dart';

/// Country class
/// This class is used to store the country information
/// Example:
/// ```dart
/// Country(
///  name: 'United States',
/// code: 'US',
/// dialCode: '+1',
/// flagUri: 'flags/us.png',
/// );
/// ```
class Country {
  /// Country constructor
  const Country({
    this.name,
    this.code,
    this.dialCode,
    this.flagUri,
  });

  /// Create a country object from a json object
  /// Example:
  /// ```json
  /// {
  ///  "name": "United States",
  /// "code": "US",
  /// "dial_code": "+1"
  /// }
  /// ```
  /// The code will be translated to the language
  /// Example:
  /// ```dart
  /// Country.fromJson({
  /// "name": "United States",
  /// "code": "US",
  /// "dial_code": "+1"
  /// });
  /// ```
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name:
          CountryCodeLocalization.instance.translate(json['code'] as String?) ??
              json['name'] as String?,
      code: json['code'] as String?,
      dialCode: json['dial_code'] as String?,
      flagUri: 'flags/${(json['code'] as String? ?? '').toLowerCase()}.png',
    );
  }

  /// Country name
  /// Example: United States, France
  final String? name;

  /// Country code
  /// Example: US, FR
  final String? code;

  /// Country dial code
  /// Example: +1, +33
  final String? dialCode;

  /// Country flag uri
  /// Example: flags/us.png, flags/fr.png
  final String? flagUri;

  /// Convert the country to a json object
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'dial_code': dialCode,
    };
  }

  /// Convert the country to a string
  /// Example:
  /// ```dart
  /// Country(name: United States, code: US, dialCode: +1, flagUri: flags/us.png)
  /// ```
  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'Country(name: $name, code: $code, dialCode: $dialCode, flagUri: $flagUri)';
  }
}
