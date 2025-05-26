import 'package:country_code_manager/country_code_manager.dart';
import 'package:country_code_manager/src/country_code_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () async {
    final countryCodeManager = CountryCodeManager.instance;
    await countryCodeManager.init();
    expect(countryCodeManager.countries, isNotEmpty);
  });

  testWidgets('CountryCodeManager', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final countryCodeManager = CountryCodeManager.instance;
    await countryCodeManager.init();

    final button = ElevatedButton(
      onPressed: () {},
      child: Image.asset(
        countryCodeManager.countries.first.flagUri ?? '',
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
          countryCodeManager.countries.first.flagUri ?? '',
        ),
      ),
      findsOneWidget,
    );
  });

  test('CountryCodeLocalization', () async {
    final countryCodeManager = CountryCodeManager.instance;
    await countryCodeManager.init();

    final countryCodeLocalization = CountryCodeLocalization.instance;
    await countryCodeLocalization.load(const Locale('tr'));
    expect(
      countryCodeLocalization.supportedLanguages,
      SupportedLanguage.supportedLanguages,
    );
  });

  test('Init test', () async {
    final countryCodeManager = CountryCodeManager.instance;
    await countryCodeManager.init(const Locale('tr'));
    expect(
      countryCodeManager.countries.first.name,
      'Afghanistan',
    );
  });
}
