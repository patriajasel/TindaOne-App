import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tinda_one_app/features/pages/inventory/inventory_page.dart';

import '../../../../helpers/mock_http.dart';

void main() {
  setUpAll(() {
    return HttpOverrides.global = MockHttpOverrides();
  });
  group('Add Sizes Dialog Widget Tests', () {
    Widget createWidgetUnderTests() {
      return MaterialApp(home: InventoryPage());
    }

    testWidgets('should render all UI components correctly', (tester) async {
      await tester.pumpWidget(createWidgetUnderTests());

      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pumpAndSettle();

      final priceBySize = find.text('Price by Size');

      await tester.tap(priceBySize);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Add Sizes'));
      await tester.tap(find.text('Add Sizes'));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);

      expect(find.text('Add Size'), findsAtLeastNWidgets(2));
      expect(find.text('Size'), findsOneWidget);
      expect(find.text('Supply'), findsOneWidget);
      expect(find.text('Amount'), findsOneWidget);
      expect(find.text('Cancel'), findsAtLeast(2));

      expect(find.byIcon(Icons.straighten), findsAtLeastNWidgets(2));
      expect(find.byIcon(Icons.close), findsAtLeastNWidgets(2));
      expect(find.byIcon(Icons.inventory), findsOneWidget);
      expect(find.byIcon(FontAwesomeIcons.pesoSign), findsOneWidget);
      expect(find.byIcon(Icons.cancel), findsAtLeastNWidgets(2));

      expect(find.byType(TextFormField), findsAtLeastNWidgets(3));
    });

    testWidgets('should have clickable elevated buttons', (tester) async {
      await tester.pumpWidget(createWidgetUnderTests());

      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pumpAndSettle();

      final priceBySize = find.text('Price by Size');

      await tester.tap(priceBySize);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Add Sizes'));
      await tester.tap(find.text('Add Sizes'));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);

      await tester.ensureVisible(find.text('Cancel').last);
      final cancelButton = tester.widget(
        find.text('Cancel').last.hitTestable(),
      );
      expect(cancelButton, isNotNull);

      await tester.ensureVisible(find.text('Add Size').last);
      final addProductButton = tester.widget(
        find.text('Add Size').last.hitTestable(),
      );
      expect(addProductButton, isNotNull);
    });

    testWidgets('should allow text inputs on text fields', (tester) async {
      await tester.pumpWidget(createWidgetUnderTests());

      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pumpAndSettle();

      final priceBySize = find.text('Price by Size');

      await tester.tap(priceBySize);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Add Sizes'));
      await tester.tap(find.text('Add Sizes'));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'S');
      expect(find.text('S'), findsOneWidget);

      await tester.enterText(find.byType(TextField).at(1), '100');
      expect(find.text('100'), findsOneWidget);

      await tester.enterText(find.byType(TextField).last, '200');
      expect(find.text('200'), findsOneWidget);

      await tester.pumpAndSettle();
    });
  });
}
