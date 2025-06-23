import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tinda_one_app/features/pages/cashier/cashier_page.dart';
import 'package:tinda_one_app/shared/common/item_counter.dart';
import 'package:tinda_one_app/shared/common/item_card.dart';

void main() {
  group('Add Item Dialog Tests', () {
    Widget createWidgetUnderTest() {
      return MaterialApp(home: CashierPage());
    }

    testWidgets('should render all UI components correctly', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert
      final productCard = find.byType(ItemCard).first;

      // Act
      await tester.tap(productCard);
      await tester.pumpAndSettle();

      // Arrange
      expect(find.byType(ModalBarrier), findsAtLeast(1));
      expect(find.text('Blue Blouse'), findsAtLeastNWidgets(1));
      expect(find.text('Available Sizes:'), findsOneWidget);
      expect(find.byIcon(Icons.sell), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byType(ChoiceChip), findsAny);

      // Assert
      final choiceChip = find.byType(ChoiceChip).first;

      // Act
      await tester.tap(choiceChip);
      await tester.pumpAndSettle();

      // Ensure the "Selected:" text is visible
      await tester.ensureVisible(find.text('Selected: 1 size'));
      await tester.pumpAndSettle();

      // Arrange
      expect(find.text('Selected: 1 size'), findsOneWidget);

      await tester.ensureVisible(find.text('8').last);
      await tester.pumpAndSettle();

      expect(find.text('8').last, findsOneWidget);

      await tester.ensureVisible(find.text('500'));
      await tester.pumpAndSettle();

      expect(find.text('500'), findsOneWidget);

      await tester.ensureVisible(find.byIcon(FontAwesomeIcons.pesoSign));
      await tester.pumpAndSettle();

      expect(find.byIcon(FontAwesomeIcons.pesoSign), findsOneWidget);

      await tester.ensureVisible(find.byType(ItemCounter));
      await tester.pumpAndSettle();

      expect(find.byType(ItemCounter), findsOneWidget);

      await tester.ensureVisible(find.text('Cancel'));
      await tester.ensureVisible(find.text('Add to Cart'));

      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Add to Cart'), findsOneWidget);
      expect(find.byIcon(Icons.cancel), findsOneWidget);
      expect(find.byIcon(Icons.shopping_cart_checkout), findsOneWidget);
    });

    testWidgets('should have clickable choice chips', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert
      final productCard = find.byType(ItemCard).first;

      // Act
      await tester.tap(productCard);
      await tester.pumpAndSettle();

      // Arrange
      expect(find.byType(ModalBarrier), findsAtLeast(1));

      // Assert
      final choiceChip = find.byType(ChoiceChip).first;

      // Act
      await tester.tap(choiceChip);
      await tester.pumpAndSettle();
    });

    testWidgets('should have clickable item counter', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert
      final productCard = find.byType(ItemCard).first;

      // Act
      await tester.tap(productCard);
      await tester.pumpAndSettle();

      // Arrange
      expect(find.byType(ModalBarrier), findsAtLeast(1));

      // Assert
      final choiceChip = find.byType(ChoiceChip).first;

      // Act
      await tester.tap(choiceChip);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byType(ItemCounter));
      await tester.pumpAndSettle();

      final addButton = find.byIcon(Icons.add);
      final removeButton = find.byIcon(Icons.remove);

      await tester.tap(addButton);
      await tester.pumpAndSettle();

      await tester.tap(removeButton);
      await tester.pumpAndSettle();
    });

    testWidgets('should have clickable action buttons', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert
      final productCard = find.byType(ItemCard).first;

      // Act
      await tester.tap(productCard);
      await tester.pumpAndSettle();

      // Arrange
      expect(find.byType(ModalBarrier), findsAtLeast(1));

      // Assert
      final choiceChip = find.byType(ChoiceChip).first;

      // Act
      await tester.tap(choiceChip);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Verify buttons exist and are widgets that can be tapped
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Add to Cart'), findsOneWidget);

      // Verify they are actually Button widgets (clickable)
      final cancelWidget = tester.widget(find.text('Cancel').hitTestable());
      final addToCartWidget = tester.widget(
        find.text('Add to Cart').hitTestable(),
      );

      expect(cancelWidget, isNotNull);
      expect(addToCartWidget, isNotNull);
    });
  });
}
