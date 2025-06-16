import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tinda_one_app/features/pages/cashier/cashier_page.dart';
import 'package:tinda_one_app/shared/common/product_card.dart';

void main() {
  group('Cashier Page Tests', () {
    Widget createWidgetUnderTest() {
      return MaterialApp(home: CashierPage());
    }

    testWidgets('should render all UI components correctly', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Cashier'), findsOneWidget);
      expect(find.text('Product Catalog'), findsOneWidget);
      expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
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

    testWidgets('should have clickable cart button', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final cartButton = find.byIcon(Icons.inventory_2_outlined);

      // Assert
      await tester.tap(cartButton);
      await tester.pumpAndSettle();
    });

    testWidgets('should allow text input in searchfield', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final searchField = find.byType(SearchField);

      // Act
      await tester.enterText(searchField, 'Product Name');
      await tester.pumpAndSettle();

      expect(find.text('Product Name'), findsOneWidget);
    });
  });
}
