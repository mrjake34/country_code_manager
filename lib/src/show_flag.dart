import 'package:flutter/material.dart';

class ShowFlag extends StatelessWidget {
  const ShowFlag({
    super.key,
    required this.countryCode,
    this.width = 32,
    this.height,
    this.fit = BoxFit.contain,
  });
  final String countryCode;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'flags/${countryCode.toLowerCase()}.png',
      package: 'country_code',
      width: width,
      height: height,
      fit: fit,
    );
  }
}
