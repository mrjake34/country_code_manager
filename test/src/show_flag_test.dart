import 'package:country_code_manager/src/show_flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ShowFlag Widget Tests', () {
    testWidgets('renders flag with default properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ShowFlag(countryCode: 'US'),
        ),
      );

      final imageFinder = find.byType(Image);
      expect(imageFinder, findsOneWidget);

      final image = tester.widget<Image>(imageFinder);
      expect(image.width, 32);
      expect(image.height, null);
      expect(image.fit, BoxFit.contain);
      expect((image.image as AssetImage).assetName, 'flags/us.png');
      expect((image.image as AssetImage).package, 'country_code_manager');
    });

    testWidgets('renders flag with custom dimensions', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ShowFlag(
            countryCode: 'GB',
            width: 100,
            height: 75,
            fit: BoxFit.cover,
          ),
        ),
      );

      final imageFinder = find.byType(Image);
      final image = tester.widget<Image>(imageFinder);
      expect(image.width, 100);
      expect(image.height, 75);
      expect(image.fit, BoxFit.cover);
      expect((image.image as AssetImage).assetName, 'flags/gb.png');
    });

    testWidgets('handles lowercase country codes', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ShowFlag(countryCode: 'fr'),
        ),
      );

      final imageFinder = find.byType(Image);
      final image = tester.widget<Image>(imageFinder);
      expect((image.image as AssetImage).assetName, 'flags/fr.png');
    });

    testWidgets('handles mixed case country codes', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ShowFlag(countryCode: 'Ca'),
        ),
      );

      final imageFinder = find.byType(Image);
      final image = tester.widget<Image>(imageFinder);
      expect((image.image as AssetImage).assetName, 'flags/ca.png');
    });
  });
}
