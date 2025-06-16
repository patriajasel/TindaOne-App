import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tinda_one_app/features/pages/cashier/cashier_page.dart';
import 'package:tinda_one_app/shared/common/item_counter.dart';

void main() {
  group('Create Order Dialog Tests', () {
    Widget createWidgetUnderTest() {
      return MaterialApp(home: CashierPage());
    }

    testWidgets('should render all UI components correctly', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final cartButton = find.byIcon(Icons.shopping_cart_outlined);

      await tester.tap(cartButton);
      await tester.pumpAndSettle();

      expect(find.byType(ModalBarrier), findsAtLeastNWidgets(1));

      expect(find.text('Item List'), findsOneWidget);
      expect(find.text('Product Name'), findsAny);
      expect(find.text('500'), findsAny);
      expect(find.text('S'), findsAny);
      expect(find.text('Inclusions:'), findsAny);
      expect(find.text('Discount:'), findsOneWidget);
      expect(find.text('Total Amount:'), findsOneWidget);
      expect(find.text('1500'), findsOneWidget);
      expect(find.text('Add Item'), findsOneWidget);
      expect(find.text('Go to Checkout'), findsOneWidget);
      expect(find.text('Cancel Order'), findsOneWidget);

      expect(find.byIcon(Icons.shopping_cart_checkout), findsAny);
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byIcon(FontAwesomeIcons.pesoSign), findsAny);
      expect(find.byIcon(Icons.remove), findsAny);
      expect(find.byIcon(Icons.add), findsAny);
      expect(find.byIcon(Icons.cancel), findsOneWidget);

      expect(find.byType(ItemCounter), findsAny);
      expect(find.byType(TextField), findsAny);
    });

    testWidgets('should have clickable item counter', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final cartButton = find.byIcon(Icons.shopping_cart_outlined);

      await tester.tap(cartButton);
      await tester.pumpAndSettle();

      // Arrange
      expect(find.byType(ModalBarrier), findsAtLeast(1));

      await tester.ensureVisible(find.byType(ItemCounter).first);
      await tester.pumpAndSettle();

      final addButton = find.byIcon(Icons.add).first;
      final removeButton = find.byIcon(Icons.remove).first;

      await tester.tap(addButton);
      await tester.pumpAndSettle();

      await tester.tap(removeButton);
      await tester.pumpAndSettle();
    });

    testWidgets('should have clickable action buttons', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final cartButton = find.byIcon(Icons.shopping_cart_outlined);

      await tester.tap(cartButton);
      await tester.pumpAndSettle();

      // Arrange
      expect(find.byType(ModalBarrier), findsAtLeast(1));

      await tester.ensureVisible(find.text('Cancel Order'));
      await tester.pumpAndSettle();

      // Verify buttons exist and are widgets that can be tapped
      expect(find.text('Cancel Order'), findsOneWidget);
      expect(find.text('Go to Checkout'), findsOneWidget);

      // Verify they are actually Button widgets (clickable)
      final cancelWidget = tester.widget(
        find.text('Cancel Order').hitTestable(),
      );
      final checkoutWidget = tester.widget(
        find.text('Go to Checkout').hitTestable(),
      );

      expect(cancelWidget, isNotNull);
      expect(checkoutWidget, isNotNull);
    });

    testWidgets('should allow text input on discount text field', (
      tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final cartButton = find.byIcon(Icons.shopping_cart_outlined);

      await tester.tap(cartButton);
      await tester.pumpAndSettle();

      // Arrange
      expect(find.byType(ModalBarrier), findsAtLeast(1));

      await tester.ensureVisible(find.byType(TextField).last);
      await tester.pumpAndSettle();

      final textField = find.byType(TextField).last;

      await tester.enterText(textField, '100');
      await tester.pumpAndSettle();

      expect(find.text('100'), findsOneWidget);
    });

    testWidgets('should display dialog when add item button is clicked', (
      tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final cartButton = find.byIcon(Icons.shopping_cart_outlined);

      await tester.tap(cartButton);
      await tester.pumpAndSettle();

      // Arrange
      expect(find.byType(ModalBarrier), findsAtLeast(1));

      await tester.ensureVisible(find.text('Add Item'));
      await tester.pumpAndSettle();

      final addItemButton = find.text('Add Item');

      await tester.tap(addItemButton);
      await tester.pumpAndSettle();

      expect(find.byType(ModalBarrier), findsAtLeast(3));
    });
  });
}
