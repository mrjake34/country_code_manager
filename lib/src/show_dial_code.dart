import 'package:country_code_manager/country_code_manager.dart';
import 'package:flutter/material.dart';

/// A stateful widget for selecting and displaying a dial code.
///
/// This widget allows users to choose a dial code with optional initial value
/// and a callback for when a selection is made.
///
/// See [_ShowDialCodeState] for the implementation details.
class ShowDialCode extends StatefulWidget {
  /// Creates a [ShowDialCode] widget for selecting a dial code.
  ///
  /// The [onSelected] parameter allows setting a callback function that is triggered
  /// when a dial code is selected. The [initialValue] parameter sets the initial
  /// dial code to display.
  ///
  /// Example:
  ///
  ///
  /// ShowDialCode(
  ///   onSelected: (dialCode) {
  ///     print('Selected dial code: $dialCode');
  ///   },
  ///   initialValue: '+1',
  /// )
  ///
  const ShowDialCode({super.key, this.onSelected, this.initialValue});

  /// A callback function that is triggered when a dial code is selected.
  ///
  /// The [onSelected] function receives the selected dial code as a parameter.
  /// This allows the parent widget to respond to the user's dial code selection.
  ///
  /// Example:
  ///
  /// ShowDialCode(
  ///   onSelected: (dialCode) {
  ///     print('Selected dial code: $dialCode');
  ///   },
  /// )
  ///
  final ValueChanged<String>? onSelected;

  /// The initial dial code value to display when the widget is first created.
  ///
  /// If not provided, the widget will show an empty string initially.
  /// This value can be overridden when a new dial code is selected.
  final String? initialValue;

  @override
  State<ShowDialCode> createState() => _ShowDialCodeState();
}

class _ShowDialCodeState extends State<ShowDialCode> {
  final _country = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _country,
      builder: (context, String? value, Widget? child) {
        return PopupMenuButton<String>(
          popUpAnimationStyle: const AnimationStyle(curve: Curves.easeInQuint),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          itemBuilder: (BuildContext context) {
            return CountryCodeManager.instance.dialCode
                .map(
                  (e) => PopupMenuItem<String>(
                    value: e,
                    child: Text(e ?? ''),
                  ),
                )
                .toList();
          },
          onSelected: (String value) {
            widget.onSelected?.call(value);
            _country.value = value;
          },
          child: Text(value ?? widget.initialValue ?? ''),
        );
      },
    );
  }
}
