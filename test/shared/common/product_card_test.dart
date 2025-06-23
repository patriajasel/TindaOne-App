import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tinda_one_app/shared/common/item_card.dart';

void main() {
  group('ProductCard Widget Tests', () {
    const String testProductId = 'test-product-123';
    const String testName = 'Test Product';
    const String testImageUrl = 'https://example.com/test-image.jpg';
    const List<String> testSizes = ['S', 'M', 'L', 'XL'];

    testWidgets('should display product information correctly', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: testProductId,
              name: testName,
              imageUrl: testImageUrl,
              sizes: testSizes,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(testName), findsOneWidget);
      expect(find.text('Sizes Available:'), findsOneWidget);
      expect(find.text('S'), findsOneWidget);
      expect(find.text('M'), findsOneWidget);
      expect(find.text('L'), findsOneWidget);
      expect(find.text('XL'), findsOneWidget);
    });

    testWidgets('should call onPressed when tapped', (
      WidgetTester tester,
    ) async {
      // Arrange
      bool wasPressed = false;
      void onPressed() {
        wasPressed = true;
      }

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: testProductId,
              name: testName,
              imageUrl: testImageUrl,
              sizes: testSizes,
              onPressed: onPressed,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      // Assert
      expect(wasPressed, isTrue);
    });

    testWidgets('should not crash when onPressed is null', (
      WidgetTester tester,
    ) async {
      // Act & Assert - should not throw
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: testProductId,
              name: testName,
              imageUrl: testImageUrl,
              sizes: testSizes,
              onPressed: null,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      // If we reach here, the test passes (no crash occurred)
      expect(find.byType(ProductCard), findsOneWidget);
    });

    testWidgets('should handle single size', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: testProductId,
              name: testName,
              imageUrl: testImageUrl,
              sizes: ['M'],
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('M'), findsOneWidget);
      expect(find.text('S'), findsNothing);
      expect(find.text('L'), findsNothing);
    });

    testWidgets('should handle very long product name', (
      WidgetTester tester,
    ) async {
      // Arrange
      const String longName =
          'This is a very long product name that might overflow the available space';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: testProductId,
              name: longName,
              imageUrl: testImageUrl,
              sizes: testSizes,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(longName), findsOneWidget);
      expect(find.byType(ProductCard), findsOneWidget);
    });

    testWidgets('should handle many sizes with horizontal scroll', (
      WidgetTester tester,
    ) async {
      // Arrange
      const List<String> manySizes = [
        'XS',
        'S',
        'M',
        'L',
        'XL',
        'XXL',
        'XXXL',
        '2XL',
        '3XL',
        '4XL',
      ];

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: testProductId,
              name: testName,
              imageUrl: testImageUrl,
              sizes: manySizes,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.text('XS'), findsOneWidget);
      expect(find.text('4XL'), findsOneWidget);
    });

    testWidgets('should show error icon when image fails to load', (
      WidgetTester tester,
    ) async {
      // This test simulates image loading failure
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: testProductId,
              name: testName,
              imageUrl: 'invalid-url',
              sizes: testSizes,
            ),
          ),
        ),
      );

      // Trigger the error builder by simulating image load failure
      final Image imageWidget = tester.widget(find.byType(Image));
      final errorWidget = imageWidget.errorBuilder!(
        tester.element(find.byType(Image)),
        Exception('Network error'),
        null,
      );

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: errorWidget)));

      // Assert
      expect(find.byIcon(Icons.broken_image), findsOneWidget);
    });
  });
}
