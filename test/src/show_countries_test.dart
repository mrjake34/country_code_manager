import 'package:country_code_manager/country_code_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ShowCountries Tests', () {
    setUp(() {
      CountryCodeManager.instance.init();
    });

    testWidgets('show() displays modal bottom sheet with countries',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () => const ShowCountries().show(context),
                  child: const Text('Show Countries'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsWidgets);
    });

    testWidgets('show() with custom options displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () => const ShowCountries(
                    showFlag: false,
                    showName: false,
                  ).show(context),
                  child: const Text('Show Countries'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(ShowFlag), findsNothing);
      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('country selection returns correct country',
        (WidgetTester tester) async {
      Country? selectedCountry;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () async {
                    selectedCountry = await const ShowCountries().show(context);
                  },
                  child: const Text('Show Countries'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();

      expect(
        selectedCountry,
        equals(CountryCodeManager.instance.countries.first),
      );
    });

    testWidgets('custom shape is applied to ListTiles',
        (WidgetTester tester) async {
      final customShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () => const ShowCountries().show(
                    context,
                    shape: customShape,
                  ),
                  child: const Text('Show Countries'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      final listTile = tester.widget<ListTile>(find.byType(ListTile).first);
      expect(listTile.shape, equals(customShape));
    });
  });
}
