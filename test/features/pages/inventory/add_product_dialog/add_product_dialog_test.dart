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

  group('Add Product Dialog Widget Tests', () {
    Widget createWidgetUnderTests() {
      return MaterialApp(home: InventoryPage());
    }

    testWidgets('should render all UI components correctly', (tester) async {
      await tester.pumpWidget(createWidgetUnderTests());
      await tester.pumpAndSettle();

      final addButton = find.byIcon(Icons.add).first;

      await tester.tap(addButton);
      await tester.pumpAndSettle();

      expect(find.byType(ModalBarrier), findsAny);

      expect(find.text('Add Product'), findsAtLeastNWidgets(2));
      expect(find.text('Upload Photo'), findsOneWidget);
      expect(find.text('Remove Photo'), findsOneWidget);
      expect(find.text('Generate Bar Code'), findsOneWidget);
      expect(find.text('Product Name'), findsAny);
      expect(find.text('Fixed Price'), findsOneWidget);
      expect(find.text('Price by Size'), findsOneWidget);
      expect(find.text('Amount'), findsOneWidget);
      expect(find.text('Supply Amount'), findsOneWidget);
      expect(find.text('Amount'), findsOneWidget);
      expect(
        find.text('Do you want to include this product as an inclusion?'),
        findsOneWidget,
      );
      expect(find.text('Yes'), findsOneWidget);
      expect(find.text('No'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);

      expect(find.byIcon(Icons.add), findsAny);
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byIcon(Icons.cancel), findsOneWidget);
      expect(find.byIcon(Icons.title), findsOneWidget);
      expect(find.byIcon(Icons.inventory), findsOneWidget);
      expect(find.byIcon(FontAwesomeIcons.pesoSign), findsOneWidget);

      expect(find.byType(TextFormField), findsAtLeastNWidgets(3));
      expect(find.byType(RadioListTile<String>), findsAtLeastNWidgets(2));
      expect(find.byType(RadioListTile<bool>), findsAtLeastNWidgets(2));
    });

    testWidgets('should have clickable elevated buttons', (tester) async {
      await tester.pumpWidget(createWidgetUnderTests());
      await tester.pumpAndSettle();

      final addButton = find.byIcon(Icons.add).first;

      await tester.tap(addButton);
      await tester.pumpAndSettle();

      final uploadButton = tester.widget(
        find.text('Upload Photo').hitTestable(),
      );
      expect(uploadButton, isNotNull);

      final removeButton = tester.widget(
        find.text('Remove Photo').hitTestable(),
      );
      expect(removeButton, isNotNull);

      final generateButton = tester.widget(
        find.text('Generate Bar Code').hitTestable(),
      );
      expect(generateButton, isNotNull);

      await tester.ensureVisible(find.text('Cancel'));
      final cancelButton = tester.widget(find.text('Cancel').hitTestable());
      expect(cancelButton, isNotNull);

      await tester.ensureVisible(find.text('Add Product').last);
      final addProductButton = tester.widget(
        find.text('Add Product').last.hitTestable(),
      );
      expect(addProductButton, isNotNull);
    });

    testWidgets('should have clickable radio list tiles', (tester) async {
      await tester.pumpWidget(createWidgetUnderTests());
      await tester.pumpAndSettle();

      final addButton = find.byIcon(Icons.add).first;

      await tester.tap(addButton);
      await tester.pumpAndSettle();

      final fixedPriceRadio = tester.widget(
        find.byType(RadioListTile<String>).first.hitTestable(),
      );
      expect(fixedPriceRadio, isNotNull);

      final bySizeRadio = tester.widget(
        find.byType(RadioListTile<String>).last.hitTestable(),
      );
      expect(bySizeRadio, isNotNull);

      await tester.ensureVisible(find.byType(RadioListTile<bool>).first);
      final yesRadio = tester.widget(
        find.byType(RadioListTile<bool>).first.hitTestable(),
      );
      expect(yesRadio, isNotNull);

      await tester.ensureVisible(find.byType(RadioListTile<bool>).last);
      final noRadio = tester.widget(
        find.byType(RadioListTile<bool>).last.hitTestable(),
      );
      expect(noRadio, isNotNull);
    });

    testWidgets('should allow text input on all text fields', (tester) async {
      await tester.pumpWidget(createWidgetUnderTests());

      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'Test Product Name');
      expect(find.text('Test Product Name'), findsOneWidget);

      await tester.enterText(find.byType(TextField).at(1), '100');
      expect(find.text('100'), findsOneWidget);

      await tester.enterText(find.byType(TextField).last, '200');
      expect(find.text('200'), findsOneWidget);

      await tester.pumpAndSettle();
    });

    testWidgets(
      'should allow show add size button when price by size is selected',
      (tester) async {
        await tester.pumpWidget(createWidgetUnderTests());

        await tester.tap(find.byIcon(Icons.add).first);
        await tester.pumpAndSettle();

        final priceBySize = find.text('Price by Size');

        await tester.tap(priceBySize);
        await tester.pumpAndSettle();

        await tester.ensureVisible(find.text('Add Sizes'));
      },
    );
  });
}
