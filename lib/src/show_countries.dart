import 'package:country_code_manager/country_code_manager.dart';
import 'package:flutter/material.dart';

/// Show countries
class ShowCountries {
  const ShowCountries._();

  /// Show countries widget
  /// This widget is used to show the countries in a modal bottom sheet
  /// Example:
  /// ```dart
  /// ShowCountries.show(context);
  /// ```
  /// This will show the countries in a modal bottom sheet
  /// The user can select the country
  /// The selected country will be returned
  /// If the user cancels the modal, it will return null
  static Future<Country?> show(
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
        return _ShowCountries(
          showFlag: showFlag ?? true,
          showName: showName ?? true,
          showDialCode: showDialCode ?? true,
          shape: shape,
        );
      },
    );
  }
}

/// Show countries widget
/// This widget is used to show the countries
/// Example:
/// ```dart
/// ShowCountries();
/// ```
class _ShowCountries extends StatelessWidget {
  /// Show countries constructor
  const _ShowCountries({
    required this.showFlag,
    required this.showName,
    required this.showDialCode,
    Key? key,
    this.shape,
  }) : super(key: key);

  /// Show flag or not
  final bool showFlag;

  /// Show name or not
  final bool showName;

  /// Show dial code or not
  final bool showDialCode;

  /// Shape of the list tile
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
}
