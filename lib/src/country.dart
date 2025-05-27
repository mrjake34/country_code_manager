import 'package:country_code_manager/src/country_code_localization.dart';
import 'package:equatable/equatable.dart';

/// Represents a country with its associated metadata
///
/// Contains information such as name, country code, dial code, and flag URI
/// Extends [Equatable] to provide value-based equality comparisons
class Country extends Equatable {
  /// Creates a new [Country] instance with optional parameters
  ///
  /// [name] represents the country's name
  /// [code] represents the country's code
  /// [dialCode] represents the country's international dial code
  /// [flagUri] represents the URI for the country's flag image
  const Country({
    this.name,
    this.code,
    this.dialCode,
    this.flagUri,
  });

  /// Converts a JSON map to a Country object
  ///
  /// Takes a Map<String, dynamic> representing country data
  /// Returns a Country instance created from the JSON data
  ///
  /// Example:
  ///
  /// ```dart
  /// Country country = Country.fromJson({
  ///   "name": "United States",
  ///   "code": "US",
  ///   "dial_code": "+1",
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

  /// Represents the name of the country
  ///
  /// This property stores the localized or original name of the country
  /// Can be null if no name is provided during country initialization
  final String? name;

  /// Represents the country code of the country
  ///
  /// This property stores the unique two-letter or three-letter country code
  /// Can be null if no code is provided during country initialization
  final String? code;

  /// Represents the international dial code of the country
  ///
  /// This property stores the country's telephone country code
  /// Can be null if no dial code is provided during country initialization
  final String? dialCode;

  /// Represents the URI path to the country's flag image
  ///
  /// This property stores the file path or URI for the country's flag image
  /// Can be null if no flag URI is provided during country initialization
  final String? flagUri;

  /// Convert the Country object to a JSON representation
  ///
  /// Returns a Map<String, dynamic> containing the serialized country data
  /// Used for JSON serialization with json_serializable package
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'dial_code': dialCode,
      'flag_uri': flagUri,
    };
  }

  /// Returns a string representation of the Country object
  ///
  /// Provides a human-readable description of the Country instance
  /// containing its name, code, dial code, and flag URI
  ///
  /// Returns a formatted string with the Country's properties
  @override
  String toString() {
    return 'Country(name: $name, code: $code, dialCode: $dialCode, flagUri: $flagUri)';
  }

  /// Returns a list of properties used for equality comparisons
  ///
  /// This getter provides the properties that should be considered when
  /// comparing two Country instances for equality.
  ///
  /// Returns a list containing [name], [code], [dialCode], and [flagUri]
  @override
  List<Object?> get props => [name, code, dialCode, flagUri];
}
