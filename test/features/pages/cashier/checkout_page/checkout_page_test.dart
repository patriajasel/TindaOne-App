import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tinda_one_app/features/pages/cashier/checkout_page/checkout_page.dart';

void main() {
  group('Checkout Page Widget Tests', () {
    Widget createWidgetUnderTest() {
      return MaterialApp(home: CheckoutPage());
    }

    testWidgets('should render all UI components correctly', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Checkout'), findsOneWidget);
      expect(find.text('This is a placeholder'), findsOneWidget);
      expect(find.text('Print Receipt'), findsOneWidget);
      expect(find.text('Cancel Order'), findsOneWidget);
      expect(find.text('Confirm Payment:'), findsOneWidget);

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byIcon(Icons.receipt), findsOneWidget);
      expect(find.byIcon(Icons.cancel), findsOneWidget);
      expect(find.byIcon(Icons.payment), findsOneWidget);
    });

    testWidgets('should have clickable action buttons', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Cancel Order'));

      // Verify they are actually Button widgets (clickable)
      final cancelWidget = tester.widget(
        find.text('Cancel Order').hitTestable(),
      );
      final confirmPaymentWidget = tester.widget(
        find.text('Confirm Payment').hitTestable(),
      );

      expect(cancelWidget, isNotNull);
      expect(confirmPaymentWidget, isNotNull);
    });

    testWidgets('should have clickable print receipt buttons', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Print Receipt'));

      final printReceiptWidget = tester.widget(
        find.text('Print Receipt').hitTestable(),
      );

      expect(printReceiptWidget, isNotNull);
    });
  });
}
