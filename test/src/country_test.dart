import 'package:country_code_manager/src/country.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Country Tests', () {
    test('should create country with all properties', () {
      const country = Country(
        name: 'United States',
        code: 'US',
        dialCode: '+1',
        flagUri: 'flags/us.png',
      );

      expect(country.name, equals('United States'));
      expect(country.code, equals('US'));
      expect(country.dialCode, equals('+1'));
      expect(country.flagUri, equals('flags/us.png'));
    });

    test('should create country with null properties', () {
      const country = Country();

      expect(country.name, isNull);
      expect(country.code, isNull);
      expect(country.dialCode, isNull);
      expect(country.flagUri, isNull);
    });

    test('should create country from valid JSON', () {
      final json = {
        'name': 'France',
        'code': 'FR',
        'dial_code': '+33',
        'flag_uri': null, // flag_uri can be null
      };

      final country = Country.fromJson(json);

      expect(country.code, equals('FR'));
      expect(country.dialCode, equals('+33'));
      expect(country.flagUri, equals('flags/fr.png'));
    });

    test('should handle JSON with missing properties', () {
      final json = {'code': 'DE'};

      final country = Country.fromJson(json);

      expect(country.code, equals('DE'));
      expect(country.name, isNull);
      expect(country.dialCode, isNull);
      expect(country.flagUri, equals('flags/de.png'));
    });

    test('should convert country to JSON', () {
      const country = Country(
        name: 'Canada',
        code: 'CA',
        dialCode: '+1',
      );

      final json = country.toJson();

      expect(json, {
        'name': 'Canada',
        'code': 'CA',
        'dial_code': '+1',
        'flag_uri': null, // flag_uri is generated, not stored
      });
    });

    test('should generate correct toString representation', () {
      const country = Country(
        name: 'United Kingdom',
        code: 'GB',
        dialCode: '+44',
        flagUri: 'flags/gb.png',
      );

      expect(
        country.toString(),
        'Country(name: United Kingdom, code: GB, dialCode: +44, flagUri: flags/gb.png)',
      );
    });

    test('should handle empty code in flagUri generation', () {
      final json = {
        'name': 'Test Country',
        'code': null,
        'dial_code': '+0',
      };

      final country = Country.fromJson(json);

      expect(country.flagUri, equals('flags/.png'));
    });
  });
}
