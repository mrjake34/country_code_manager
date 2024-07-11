import 'package:country_code_manager/src/country_code_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {
    final countryCodeManager = CountryCodeManager.instance;
    expect(countryCodeManager.countries, isNotEmpty);
  });

  testWidgets('CountryCodeManager', (tester) async {
    final button = ElevatedButton(
      onPressed: () {},
      child: Image.asset(
        CountryCodeManager.instance.countries.first.flagUri ?? '',
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: button,
        ),
      ),
    );
    expect(
      find.image(
        AssetImage(
          CountryCodeManager.instance.countries.first.flagUri ?? '',
        ),
      ),
      findsOneWidget,
    );
  });
}
