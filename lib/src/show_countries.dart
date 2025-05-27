import 'package:country_code_manager/country_code_manager.dart';
import 'package:flutter/material.dart';

/// A widget that displays a list of countries with optional flag, name, and dial code
///
/// This widget allows customizable display of country information in a scrollable list,
/// with options to show or hide flags, names, and dial codes. It can be used to create
/// a country selection interface with configurable appearance.
class ShowCountries extends StatelessWidget {
  /// Creates a new instance of [ShowCountries] with optional configuration for displaying country information
  ///
  /// [key] Optional widget key for identifying this widget
  /// [showFlag] Determines whether country flags should be displayed, defaults to true
  /// [showName] Determines whether country names should be displayed, defaults to true
  /// [showDialCode] Determines whether country dial codes should be displayed, defaults to true
  /// [shape] Optional custom shape for the list tiles in the country list
  const ShowCountries({
    super.key,
    this.showFlag = true,
    this.showName = true,
    this.showDialCode = true,
    this.shape,
  });

  /// Determines whether country flags should be displayed, defaults to true
  final bool showFlag;

  /// Determines whether country names should be displayed, defaults to true
  final bool showName;

  /// Determines whether country dial codes should be displayed, defaults to true
  final bool showDialCode;

  /// Optional custom shape for the list tiles in the country list
  ///
  /// Allows customization of the visual appearance of each country list tile
  /// by providing a [ShapeBorder] that defines the tile's border and shape.
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CountryCodeManager.instance.countries.length,
      itemBuilder: (context, index) {
        final country = CountryCodeManager.instance.countries[index];
        return ListTile(
          shape: shape,
          title: showName ? Text(country.name ?? '') : null,
          leading: showDialCode ? Text(country.dialCode ?? '') : null,
          trailing: showFlag ? ShowFlag(countryCode: country.code ?? '') : null,
          onTap: () {
            Navigator.of(context).pop(country);
          },
        );
      },
    );
  }

  /// Displays a modal bottom sheet with a list of countries and allows selecting a country
  ///
  /// [context] The current build context used to show the bottom sheet
  /// [showFlag] Optional override for displaying country flags, defaults to the class's default
  /// [showName] Optional override for displaying country names, defaults to the class's default
  /// [showDialCode] Optional override for displaying country dial codes, defaults to the class's default
  /// [shape] Optional override for the shape of country list tiles, defaults to the class's default
  ///
  /// Returns a [Future] that completes with the selected [Country] or null if no country is selected
  Future<Country?> show(
    BuildContext context, {
    bool? showFlag,
    bool? showName,
    bool? showDialCode,
    ShapeBorder? shape,
  }) async {
    return showModalBottomSheet<Country>(
      context: context,
      showDragHandle: true,
      useRootNavigator: true,
      useSafeArea: true,
      builder: (context) {
        return ShowCountries(
          showFlag: showFlag ?? this.showFlag,
          showName: showName ?? this.showName,
          showDialCode: showDialCode ?? this.showDialCode,
          shape: shape ?? this.shape,
        );
      },
    );
  }
}
