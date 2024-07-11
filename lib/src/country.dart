import 'package:country_code/src/index.dart';

final class Country {
  final String? name;
  final String? code;
  final String? dialCode;
  final String? flagUri;

  const Country({
    this.name,
    this.code,
    this.dialCode,
    this.flagUri,
  });

  String toCountryStringOnly() {
    return '$name';
  }

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: CountryCodeLocalization.instance.translate(json['code']) ?? json['name'],
      code: json['code'],
      dialCode: json['dial_code'],
      flagUri: 'flags/${json['code'].toLowerCase()}.png',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'dial_code': dialCode,
    };
  }
}
