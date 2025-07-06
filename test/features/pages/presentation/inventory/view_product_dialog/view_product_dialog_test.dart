import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/inventory_page.dart';
import 'package:tinda_one_app/shared/common/product_card.dart';

import '../../../../../helpers/mock_http.dart';

void main() {
  setUpAll(() {
    return HttpOverrides.global = MockHttpOverrides();
  });

  group('View Product Dialog Widget Tests', () {
    Widget createWidgetUnderTests() {
      return MaterialApp(home: InventoryPage());
    }

    testWidgets('should render all UI components correctly', (tester) async {
      await tester.pumpWidget(createWidgetUnderTests());
      await tester.pumpAndSettle();

      final productCard = find.byType(ProductCard).first;

      await tester.tap(productCard);
      await tester.pumpAndSettle();

      expect(find.byType(ModalBarrier), findsAny);

      expect(find.text('Blouse (Blue)'), findsAny);
      expect(find.text('Total Supply: '), findsOneWidget);
      expect(find.text('100'), findsOneWidget);
      expect(find.text('Price: '), findsOneWidget);
      expect(find.text('Php 100'), findsOneWidget);
      expect(find.text('Available Sizes:'), findsOneWidget);
      expect(
        find.text('Can this product become an inclusion?'),
        findsOneWidget,
      );
      expect(find.text('Yes'), findsOneWidget);
      expect(find.text('No'), findsOneWidget);

      expect(find.byIcon(Icons.sell), findsOneWidget);
      expect(find.byIcon(Icons.edit), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);

      expect(find.byType(Image), findsAny);
      expect(find.byType(GridView), findsAtLeastNWidgets(2));
      expect(find.byType(RadioListTile<bool>), findsAtLeastNWidgets(2));
    });
  });
}
