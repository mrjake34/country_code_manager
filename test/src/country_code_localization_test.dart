import 'package:country_code_manager/src/country_code_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CountryCodeLocalization Tests', () {
    late CountryCodeLocalization localization;

    setUp(() {
      localization = CountryCodeLocalization.instance;
    });

    test('instance should be singleton', () {
      final instance1 = CountryCodeLocalization.instance;
      final instance2 = CountryCodeLocalization.instance;
      expect(identical(instance1, instance2), true);
    });

    test('default language should be English', () {
      expect(localization.defaultLanguage.locale.languageCode, 'en');
    });

    test(
      'supported languages should not be empty',
      () {
        expect(localization.supportedLanguages, isNotEmpty);
        expect(localization.supportedLanguages.contains('en'), true);
      },
    );

    test('translate should return null for null input', () {
      expect(localization.translate(null), null);
    });

    test('translate should handle non-existent codes', () {
      expect(localization.translate('nonexistent'), null);
    });

    group('SupportedLanguage Tests', () {
      test('should validate supported languages correctly', () {
        const supportedLang = SupportedLanguage.en;
        expect(supportedLang.isSupported(const Locale('en')), true);
        expect(supportedLang.isSupported(const Locale('xx')), false);
      });

      test('should contain common country codes', () {
        expect(SupportedLanguage.supportedLanguages.contains('us'), true);
        expect(SupportedLanguage.supportedLanguages.contains('gb'), true);
        expect(SupportedLanguage.supportedLanguages.contains('ca'), true);
      });
    });

    group('load() Tests', () {
      test('should handle null locale', () async {
        final result = await localization.load(null);
        expect(result, isNotNull);
      });

      test('should handle unsupported locale', () async {
        final result = await localization.load(const Locale('xx'));
        expect(result, isNotNull);
      });

      test('should load supported locale', () async {
        final result = await localization.load(const Locale('en'));
        expect(result, isNotNull);
      });
    });
  });
}
