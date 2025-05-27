import 'package:country_code_manager/country_code_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await CountryCodeManager.instance.init();
  });

  group('ShowDialCode Widget Tests', () {
    testWidgets('renders with initial value', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShowDialCode(
              initialValue: '+1',
            ),
          ),
        ),
      );

      expect(find.text('+1'), findsOneWidget);
    });

    testWidgets('renders empty string when no initial value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShowDialCode(),
          ),
        ),
      );

      expect(find.text(''), findsOneWidget);
    });

    testWidgets('opens popup menu on tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShowDialCode(),
          ),
        ),
      );

      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();

      expect(find.byType(PopupMenuItem<String>), findsWidgets);
    });

    testWidgets('calls onSelected when dial code is chosen',
        (WidgetTester tester) async {
      String? selectedDialCode;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShowDialCode(
              onSelected: (value) {
                selectedDialCode = value;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();

      final firstItem = find.byType(PopupMenuItem<String>).first;
      await tester.tap(firstItem);
      await tester.pumpAndSettle();

      expect(selectedDialCode, isNotNull);
    });

    testWidgets('updates displayed value after selection',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShowDialCode(
              initialValue: '+1',
            ),
          ),
        ),
      );

      expect(find.text('+1'), findsOneWidget);

      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();

      final menuItem = find.byType(PopupMenuItem<String>).first;
      await tester.tap(menuItem);
      await tester.pumpAndSettle();

      expect(find.text('+1'), findsNothing);
    });

    testWidgets('respects height constraint', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(child: ShowDialCode()),
          ),
        ),
      );

      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();

      final box = tester
          .renderObject<RenderBox>(find.byType(PopupMenuItem<String>).first);
      expect(
        box.size.height,
        lessThan(
          MediaQuery.of(tester.element(find.byType(ShowDialCode))).size.height *
              0.5,
        ),
      );
    });
  });
}
