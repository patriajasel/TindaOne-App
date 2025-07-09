import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tinda_one_app/shared/common/product_card.dart';

void main() {
  group('Product Card Widget Tests', () {
    const String testProductId = 'test-product-123';
    const String testName = 'Test Product';
    const String testImageUrl = 'https://example.com/test-image.jpg';

    Widget createWidgetUnderTest({required int testSupply}) {
      return MaterialApp(
        home: Scaffold(
          body: ProductCard(
            productId: testProductId,
            name: testName,
            photo: testImageUrl,
            supply: testSupply,
          ),
        ),
      );
    }

    testWidgets('should display product information correctly', (tester) async {
      const int testSupply = 20;
      await tester.pumpWidget(createWidgetUnderTest(testSupply: testSupply));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.text(testName), findsOneWidget);
      expect(find.text('In Stock ($testSupply available)'), findsOneWidget);
    });

    testWidgets('should display "In Stock" when supply is greater than 10', (
      tester,
    ) async {
      const int testSupply = 20;
      await tester.pumpWidget(createWidgetUnderTest(testSupply: testSupply));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.text(testName), findsOneWidget);
      expect(find.text('In Stock ($testSupply available)'), findsOneWidget);
    });

    testWidgets('should display "Low Stock" when supply is less than 10', (
      tester,
    ) async {
      const int testSupply = 9;
      await tester.pumpWidget(createWidgetUnderTest(testSupply: testSupply));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.text(testName), findsOneWidget);
      expect(find.text('Low Stock ($testSupply left)'), findsOneWidget);
    });

    testWidgets('should display "Out of Stock" when supply is less than 0', (
      tester,
    ) async {
      const int testSupply = 0;
      await tester.pumpWidget(createWidgetUnderTest(testSupply: testSupply));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.text(testName), findsOneWidget);
      expect(find.text('Out of Stock'), findsOneWidget);
    });
  });
}
