import 'package:flutter/material.dart';

/// Show the flag of the country
class ShowFlag extends StatelessWidget {
  /// Show the flag of the country
  const ShowFlag({
    required this.countryCode,
    Key? key,
    this.width = 32,
    this.height,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  /// The country code
  /// Example: US, FR
  final String countryCode;

  /// The width of the flag
  final double? width;

  /// The height of the flag
  final double? height;

  /// The fit of the flag
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'flags/${countryCode.toLowerCase()}.png',
      package: 'country_code_manager',
      width: width,
      height: height,
      fit: fit,
    );
  }
}
