import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/inventory_page.dart';
import 'package:tinda_one_app/shared/common/product_card.dart';

import '../../../../helpers/mock_http.dart';

void main() {
  setUpAll(() {
    return HttpOverrides.global = MockHttpOverrides();
  });

  group('Inventory Page Widget Tests', () {
    Widget createWidgetUnderTest() {
      return MaterialApp(home: InventoryPage());
    }

    testWidgets('should render all UI components correctly', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Inventory'), findsOneWidget);
      expect(find.text('Product Catalog'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.inventory_2_outlined), findsOneWidget);
      expect(find.byType(SearchField), findsOneWidget);
      expect(find.byType(ProductCard), findsAny);
    });

    testWidgets('should have clickable product card', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final productCard = find.byType(ProductCard).first;

      // Assert
      await tester.tap(productCard);
      await tester.pumpAndSettle();
    });

    testWidgets('should allow text input in searchfield', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final searchField = find.byType(SearchField);

      // Act
      await tester.enterText(searchField, 'Test Product Name');
      await tester.pumpAndSettle();

      expect(find.text('Test Product Name'), findsOneWidget);
    });

    testWidgets('should display dialog when add button is clicked', (
      tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final addButton = find.byIcon(Icons.add);
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      expect(find.byType(ModalBarrier), findsAny);
    });

    testWidgets('should display dialog when product card is clicked', (
      tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final productCard = find.byType(ProductCard).first;
      await tester.tap(productCard);
      await tester.pumpAndSettle();

      expect(find.byType(ModalBarrier), findsAtLeastNWidgets(1));
    });
  });
}
