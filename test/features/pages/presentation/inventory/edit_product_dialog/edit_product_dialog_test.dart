import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/edit_product_dialog/edit_product_dialog.dart';

import '../../../../../helpers/mock_http.dart';

void main() {
  setUpAll(() {
    return HttpOverrides.global = MockHttpOverrides();
  });

  group('Edit Product Dialog Widget Tests', () {
    late ProductModel mockProduct;

    setUp(() {
      mockProduct = ProductModel(
        productId: '1',
        name: 'Test Product',
        price: 100,
        supply: 50,
        isInclusion: false,
        priceType: 'Fixed Price',
        image: null,
        productSizes: null,
      );
    });

    Widget createWidgetUnderTest({ProductModel? product}) {
      return ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: EditProductDialog(product: product ?? mockProduct),
          ),
        ),
      );
    }

    testWidgets('should render all UI components correctly', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Header elements
      expect(find.text('Edit Product'), findsOneWidget);
      expect(find.byIcon(Icons.edit), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);

      // Image upload section
      expect(find.text('Upload Photo'), findsOneWidget);
      expect(find.text('Generate Bar Code'), findsOneWidget);
      expect(find.text('No Image has been uploaded yet'), findsOneWidget);

      // Form fields
      expect(find.text('Product Name'), findsOneWidget);
      expect(find.byIcon(Icons.title), findsOneWidget);

      // Price options
      expect(find.text('Fixed Price'), findsOneWidget);
      expect(find.text('Price by Size'), findsOneWidget);

      // Amount and supply fields (visible for Fixed Price)
      expect(find.text('Amount'), findsOneWidget);
      expect(find.text('Supply Amount'), findsOneWidget);
      expect(find.byIcon(FontAwesomeIcons.pesoSign), findsOneWidget);
      expect(find.byIcon(Icons.inventory), findsOneWidget);

      // Inclusion option
      expect(
        find.text('Do you want to include this product as an inclusion?'),
        findsOneWidget,
      );
      expect(find.text('Yes'), findsOneWidget);
      expect(find.text('No'), findsOneWidget);

      // Action buttons
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Save'), findsOneWidget);
      expect(find.byIcon(Icons.cancel), findsOneWidget);
      expect(find.byIcon(Icons.save), findsOneWidget);

      // Form elements
      expect(
        find.byType(TextFormField),
        findsNWidgets(3),
      ); // Name, Amount, Supply
      expect(
        find.byType(RadioListTile<String>),
        findsNWidgets(2),
      ); // Price options
      expect(
        find.byType(RadioListTile<bool>),
        findsNWidgets(2),
      ); // Inclusion options
    });

    testWidgets('should show remove photo button when image is present', (
      tester,
    ) async {
      final productWithImage = mockProduct.copyWith(
        image: '/path/to/image.jpg',
      );

      await tester.pumpWidget(createWidgetUnderTest(product: productWithImage));
      await tester.pumpAndSettle();

      expect(find.text('Remove Photo'), findsOneWidget);
    });

    testWidgets('should have clickable elevated buttons', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Test Upload Photo button
      final uploadButton = find.text('Upload Photo');
      expect(uploadButton, findsOneWidget);
      await tester.tap(uploadButton);
      await tester.pumpAndSettle();

      // Test Generate Bar Code button
      final generateButton = find.text('Generate Bar Code');
      expect(generateButton, findsOneWidget);
      await tester.tap(generateButton);
      await tester.pumpAndSettle();

      // Test Cancel button
      final cancelButton = find.text('Cancel');
      expect(cancelButton, findsOneWidget);
      await tester.tap(cancelButton);
      await tester.pumpAndSettle();

      // Test Save button
      final saveButton = find.text('Save');
      expect(saveButton, findsOneWidget);
      await tester.tap(saveButton);
      await tester.pumpAndSettle();
    });

    testWidgets('should have clickable radio list tiles', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Test price option radio tiles
      final fixedPriceRadio = find.byType(RadioListTile<String>).first;
      expect(fixedPriceRadio, findsOneWidget);
      await tester.tap(fixedPriceRadio);
      await tester.pumpAndSettle();

      final bySizeRadio = find.byType(RadioListTile<String>).last;
      expect(bySizeRadio, findsOneWidget);
      await tester.tap(bySizeRadio);
      await tester.pumpAndSettle();

      // Test inclusion option radio tiles
      final yesRadio = find.byType(RadioListTile<bool>).first;
      expect(yesRadio, findsOneWidget);
      await tester.tap(yesRadio);
      await tester.pumpAndSettle();

      final noRadio = find.byType(RadioListTile<bool>).last;
      expect(noRadio, findsOneWidget);
      await tester.tap(noRadio);
      await tester.pumpAndSettle();
    });

    testWidgets('should allow text input on all text fields', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Test product name field
      final productNameField = find.byType(TextFormField).first;
      await tester.enterText(productNameField, 'Updated Product Name');
      expect(find.text('Updated Product Name'), findsOneWidget);

      // Test amount field
      final amountField = find.byType(TextFormField).at(1);
      await tester.enterText(amountField, '300');
      expect(find.text('300'), findsOneWidget);

      // Test supply field
      final supplyField = find.byType(TextFormField).last;
      await tester.enterText(supplyField, '200');
      expect(find.text('200'), findsOneWidget);

      await tester.pumpAndSettle();
    });

    testWidgets('should show add sizes button when price by size is selected', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Tap on "Price by Size" radio button
      final priceBySize = find.text('Price by Size');
      await tester.tap(priceBySize);
      await tester.pumpAndSettle();

      // Verify "Add Sizes" button appears
      expect(find.text('Add Sizes'), findsOneWidget);
      expect(find.text('No sizes have been added yet.'), findsOneWidget);

      // Verify amount and supply fields are hidden
      expect(find.text('Amount'), findsNothing);
      expect(find.text('Supply Amount'), findsNothing);
    });

    testWidgets('should show dialog when add sizes button is clicked', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Switch to "Price by Size"
      final priceBySize = find.text('Price by Size');
      await tester.tap(priceBySize);
      await tester.pumpAndSettle();

      // Tap "Add Sizes" button
      final addSizesButton = find.text('Add Sizes');
      await tester.ensureVisible(addSizesButton);
      await tester.tap(addSizesButton);
      await tester.pumpAndSettle();

      // Verify dialog appears
      expect(find.byType(Dialog), findsOneWidget);
    });

    testWidgets('should display existing product data correctly', (
      tester,
    ) async {
      final productWithData = ProductModel(
        productId: '1',
        name: 'Existing Product',
        price: 250,
        supply: 75,
        isInclusion: true,
        priceType: 'Fixed Price',
        image: null,
        productSizes: null,
      );

      await tester.pumpWidget(createWidgetUnderTest(product: productWithData));
      await tester.pumpAndSettle();

      // Verify existing data is displayed
      expect(find.text('Existing Product'), findsOneWidget);
      expect(find.text('250'), findsOneWidget);
      expect(find.text('75'), findsOneWidget);

      // Verify "Yes" is selected for inclusion
      final yesRadio = find.byType(RadioListTile<bool>).first;
      final yesRadioWidget = tester.widget<RadioListTile<bool>>(yesRadio);
      expect(yesRadioWidget.groupValue, true);
    });

    /* testWidgets('should handle product with sizes correctly', (tester) async {
      // Set a larger screen size for this test
      await tester.binding.setSurfaceSize(const Size(800, 600));

      final productWithSizes = ProductModel(
        productId: '1',
        name: 'Sized Product',
        price: null,
        supply: null,
        isInclusion: false,
        priceType: 'Price by Size',
        image: null,
        productSizes: [
          ProductSizes(size: 'Small', price: 100, supply: 10),
          ProductSizes(size: 'Medium', price: 150, supply: 15),
          ProductSizes(size: 'Large', price: 200, supply: 20),
        ],
      );

      await tester.pumpWidget(createWidgetUnderTest(product: productWithSizes));
      await tester.pumpAndSettle();

      // Verify sizes are displayed
      expect(find.text('Small'), findsOneWidget);
      expect(find.text('Medium'), findsOneWidget);
      expect(find.text('Large'), findsOneWidget);
      expect(find.text('100.00'), findsOneWidget);
      expect(find.text('150.00'), findsOneWidget);
      expect(find.text('200.00'), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
      expect(find.text('15'), findsOneWidget);
      expect(find.text('20'), findsOneWidget);

      // Verify headers are shown
      expect(find.text('Size'), findsOneWidget);
      expect(find.text('Price'), findsOneWidget);
      expect(find.text('Supply'), findsOneWidget);

      // Reset surface size after test
      addTearDown(() => tester.binding.setSurfaceSize(null));
    }); */
  });
}
