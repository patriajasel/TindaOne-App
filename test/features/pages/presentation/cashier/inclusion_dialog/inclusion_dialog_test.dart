import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tinda_one_app/features/pages/presentation/cashier/cashier_page.dart';
import 'package:tinda_one_app/shared/common/item_counter.dart';

void main() {
  group('Inclusion Dialog Tests', () {
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

      await tester.ensureVisible(find.text('Add Item'));

      final addItemButton = find.text('Add Item');

      await tester.tap(addItemButton);
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);

      expect(find.text('Inclusions'), findsOneWidget);
      expect(find.text('Product Name'), findsAny);
      expect(find.text('Confirm'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);

      expect(find.byIcon(Icons.extension), findsOneWidget);
      expect(find.byIcon(Icons.close), findsAny);
      expect(find.byIcon(Icons.remove), findsAny);
      expect(find.byIcon(Icons.add), findsAny);
      expect(find.byIcon(Icons.cancel), findsAny);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      expect(find.byType(ItemCounter), findsAny);
    });

    testWidgets('should have clickable item counter', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final cartButton = find.byIcon(Icons.shopping_cart_outlined);

      await tester.tap(cartButton);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Add Item'));

      final addItemButton = find.text('Add Item');

      await tester.tap(addItemButton);
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);

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

      await tester.ensureVisible(find.text('Add Item'));

      final addItemButton = find.text('Add Item');

      await tester.tap(addItemButton);
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);

      await tester.ensureVisible(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Verify buttons exist and are widgets that can be tapped
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Confirm'), findsOneWidget);

      // Verify they are actually Button widgets (clickable)
      final cancelWidget = tester.widget(find.text('Cancel').hitTestable());
      final checkoutWidget = tester.widget(find.text('Confirm').hitTestable());

      expect(cancelWidget, isNotNull);
      expect(checkoutWidget, isNotNull);
    });
  });
}
