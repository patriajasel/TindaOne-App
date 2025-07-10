import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tinda_one_app/features/pages/application/product_providers.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/inventory_page.dart';
import 'package:tinda_one_app/shared/common/product_card.dart';

import '../../../../helpers/mock_http.dart';

void main() {
  setUpAll(() {
    return HttpOverrides.global = MockHttpOverrides();
  });

  group('Inventory Page Widget Tests', () {
    final mockProducts = [
      ProductModel(
        productId: '1',
        name: 'Product 1',
        image: 'test_image_1.jpg',
        supply: 10,
        productSizes: [
          ProductSizes(size: 'S', supply: 5, price: 100),
          ProductSizes(size: 'M', supply: 5, price: 100),
        ],
        isInclusion: true,
        priceType: 'Fixed Price',
      ),
      ProductModel(
        productId: '2',
        name: 'Product 2',
        image: 'test_image_2.jpg',
        supply: 15,
        productSizes: [ProductSizes(size: 'L', supply: 15, price: 200)],
        isInclusion: true,
        priceType: 'Fixed Price',
      ),
    ];

    Widget createWidgetUnderTest({List<ProductModel>? products}) {
      return ProviderScope(
        overrides: [
          // Override the provider with mock data
          fetchAllProductsProvider.overrideWith((ref) async {
            return products ?? mockProducts;
          }),
        ],
        child: MaterialApp(home: InventoryPage()),
      );
    }

    testWidgets('should render all UI components correctly', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Inventory'), findsOneWidget);
      expect(find.text('Product Catalog'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.inventory_2_outlined), findsOneWidget);
      expect(find.byType(SearchField), findsOneWidget);

      expect(find.byType(ProductCard), findsNWidgets(2));
      expect(find.text('Product 1'), findsOneWidget);
      expect(find.text('Product 2'), findsOneWidget);
    });

    testWidgets('should register tap on product card', (tester) async {
      bool wasTapped = false;

      Widget createWidgetWithCallback() {
        return MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: '1',
              name: 'Test Product 1',
              photo: 'test_image_1.jpg',
              supply: 10,
              onTap: () {
                wasTapped = true;
              },
            ),
          ),
        );
      }

      await tester.pumpWidget(createWidgetWithCallback());
      await tester.pumpAndSettle();

      final productCard = find.byType(ProductCard);
      await tester.tap(productCard);
      await tester.pump();

      expect(wasTapped, isTrue);
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

    testWidgets(
      'should display dialog when product card is clicked - ignore overflow',
      (tester) async {
        // Temporarily disable overflow errors
        final originalOnError = FlutterError.onError;
        FlutterError.onError = (FlutterErrorDetails details) {
          if (details.exception.toString().contains('RenderFlex overflowed')) {
            // Ignore overflow errors
            return;
          }
          originalOnError?.call(details);
        };

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        final productCard = find.byType(ProductCard).first;
        await tester.tap(productCard);
        await tester.pumpAndSettle();

        expect(find.byType(ModalBarrier), findsAtLeastNWidgets(1));

        // Restore original error handler
        FlutterError.onError = originalOnError;
      },
    );
  });
}
