import 'package:country_code_manager/country_code_manager.dart';
import 'package:flutter/material.dart';

/// Show dial code
/// This widget is used to show the dial code
class ShowDialCode extends StatefulWidget {
  /// Show dial code constructor
  const ShowDialCode({super.key, this.onSelected, this.initialValue});

  /// On selected callback
  /// This callback is called when the user selects a dial code
  final void Function(String)? onSelected;

  /// Initial value
  /// This is the initial value of the dial code
  /// Example: +1
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
      builder: (context, String? value, _) {
        return PopupMenuButton<String>(
          popUpAnimationStyle: const AnimationStyle(curve: Curves.easeInQuint),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          itemBuilder: (context) {
            return CountryCodeManager.instance.dialCode
                .map(
                  (e) => PopupMenuItem<String>(
                    value: e,
                    child: Text(e ?? ''),
                  ),
                )
                .toList();
          },
          onSelected: (value) {
            widget.onSelected?.call(value);
            _country.value = value;
          },
          child: Text(value ?? widget.initialValue ?? ''),
        );
      },
    );
  }
}
