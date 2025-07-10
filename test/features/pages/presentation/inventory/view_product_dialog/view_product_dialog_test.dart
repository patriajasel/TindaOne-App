import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/view_product_dialog/view_product_dialog.dart';
import 'package:tinda_one_app/features/pages/application/product_providers.dart';

import '../../../../../helpers/mock_http.dart';

void main() {
  setUpAll(() {
    return HttpOverrides.global = MockHttpOverrides();
  });

  group('View Product Dialog Widget Tests', () {
    // Create a mock product for testing
    final mockProduct = ProductModel(
      productId: '1',
      name: 'Blouse (Blue)',
      price: 100,
      supply: 100,
      image: null,
      isInclusion: true,
      productSizes: [
        ProductSizes(size: 'Small', price: 80, supply: 30),
        ProductSizes(size: 'Medium', price: 100, supply: 40),
        ProductSizes(size: 'Large', price: 120, supply: 30),
      ],
      priceType: 'Fixed Price',
    );

    Widget createWidgetUnderTests() {
      return ProviderScope(
        overrides: [
          // Mock the delete product provider to prevent actual deletion
          deleteProductProvider(
            productId: '1',
          ).overrideWith((ref) => Future.value()),
        ],
        child: MaterialApp(
          home: Scaffold(body: ViewProductDialog(product: mockProduct)),
        ),
      );
    }

    testWidgets('should render all UI components correctly', (tester) async {
      await tester.pumpWidget(createWidgetUnderTests());
      await tester.pumpAndSettle();

      // Check if the product name is displayed
      expect(find.text('Blouse (Blue)'), findsOneWidget);

      // Check if total supply is displayed
      expect(find.text('Total Supply: '), findsOneWidget);
      expect(find.text('100'), findsOneWidget);

      // Check if price is displayed
      expect(find.text('Price: '), findsOneWidget);
      expect(find.text('100.00'), findsAny);

      // Check if inclusion question is displayed
      expect(
        find.text('Can this product become an inclusion?'),
        findsOneWidget,
      );
      expect(find.text('Yes'), findsOneWidget);
      expect(find.text('No'), findsOneWidget);

      // Check if icons are present
      expect(find.byIcon(Icons.sell), findsOneWidget);
      expect(find.byIcon(Icons.edit), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);

      // Check if image is displayed (should be the default asset image)
      expect(find.byType(Image), findsOneWidget);

      // Check if radio buttons are present
      expect(find.byType(RadioListTile<bool>), findsNWidgets(2));

      // Check if product sizes are displayed
      expect(find.text('Size'), findsOneWidget);
      expect(find.text('Price'), findsOneWidget);
      expect(find.text('Supply'), findsOneWidget);

      // Check if individual sizes are displayed
      expect(find.text('Small'), findsOneWidget);
      expect(find.text('Medium'), findsOneWidget);
      expect(find.text('Large'), findsOneWidget);

      // Check if size prices are displayed
      expect(find.text('80.00'), findsOneWidget);
      expect(
        find.text('100.00'),
        findsAtLeastNWidgets(2),
      ); // Main price and medium size price
      expect(find.text('120.00'), findsOneWidget);

      // Check if size supplies are displayed
      expect(find.text('30'), findsNWidgets(2)); // Small and Large sizes
      expect(find.text('40'), findsOneWidget); // Medium size
    });

    testWidgets('should handle edit button tap', (tester) async {
      await tester.pumpWidget(createWidgetUnderTests());
      await tester.pumpAndSettle();

      // Find and tap the edit button
      final editButton = find.byIcon(Icons.edit);
      expect(editButton, findsOneWidget);

      await tester.tap(editButton);
      await tester.pumpAndSettle();

      // Verify that the edit dialog is shown (you might need to adjust this based on your EditProductDialog implementation)
      expect(find.byType(ModalBarrier), findsWidgets);
    });

    testWidgets('should handle delete button tap', (tester) async {
      await tester.pumpWidget(createWidgetUnderTests());
      await tester.pumpAndSettle();

      // Find and tap the delete button
      final deleteButton = find.byIcon(Icons.delete);
      expect(deleteButton, findsOneWidget);

      await tester.tap(deleteButton);
      await tester.pumpAndSettle();

      // Verify that the success snackbar is shown
      expect(find.text('Product was deleted successfully'), findsOneWidget);
    });

    testWidgets('should display default image when product image is null', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTests());
      await tester.pumpAndSettle();

      // Find the image widget
      final imageWidget = tester.widget<Image>(find.byType(Image));

      // Verify it's using the default asset image
      expect(imageWidget.image, isA<AssetImage>());
      final assetImage = imageWidget.image as AssetImage;
      expect(assetImage.assetName, 'lib/shared/assets/sales_display.png');
    });

    testWidgets('should display correct radio button selection', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTests());
      await tester.pumpAndSettle();

      // Find radio buttons
      final radioButtons = find.byType(RadioListTile<bool>);
      expect(radioButtons, findsNWidgets(2));

      // Check if the correct radio button is selected (Yes should be selected since isInclusion is true)
      final yesRadio = tester.widget<RadioListTile<bool>>(radioButtons.first);
      final noRadio = tester.widget<RadioListTile<bool>>(radioButtons.last);

      expect(yesRadio.value, true);
      expect(yesRadio.groupValue, true);
      expect(noRadio.value, false);
      expect(noRadio.groupValue, true);
    });
  });
}
