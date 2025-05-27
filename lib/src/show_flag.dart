import 'package:flutter/material.dart';

/// A widget that displays a country flag based on a given country code.
///
/// This widget loads a flag image from the 'country_code_manager' package
/// using the provided country code. The flag can be customized with optional
/// width, height, and fit properties.
///
/// Example:
///
/// ShowFlag(
///   countryCode: 'US',
///   width: 50,
///   fit: BoxFit.cover,
/// )
///
class ShowFlag extends StatelessWidget {
  /// Creates a [ShowFlag] widget to display a country flag.
  ///
  /// [countryCode] is the two-letter country code for the flag to display.
  /// [width] sets the width of the flag image (defaults to 32).
  /// [height] optionally sets the height of the flag image.
  /// [fit] determines how the flag image should be fitted (defaults to [BoxFit.contain]).
  const ShowFlag({
    required this.countryCode,
    super.key,
    this.width = 32,
    this.height,
    this.fit = BoxFit.contain,
  });

  /// The two-letter country code representing the flag to be displayed.
  ///
  /// This code is used to determine which flag image to load from the 'country_code_manager' package.
  /// Must be a valid two-letter ISO country code (e.g., 'US', 'GB', 'FR').
  final String countryCode;

  /// The width of the flag image (defaults to 32).
  ///
  /// If not specified, the flag will use the default width of 32 pixels.
  /// Can be set to customize the display size of the flag.
  final double? width;

  /// The height of the flag image (optional).
  ///
  /// If not specified, the flag will use its default or intrinsic height.
  /// Can be set to customize the display height of the flag.
  final double? height;

  /// Determines how the flag image should be fitted (defaults to [BoxFit.contain]).
  ///
  /// Controls the scaling and positioning of the flag image within its allocated space.
  /// If not specified, the flag will use [BoxFit.contain] to ensure the entire flag is visible.
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
