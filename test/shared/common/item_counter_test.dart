import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tinda_one_app/shared/common/item_counter.dart';

void main() {
  group('ItemCounter Widget Tests', () {
    late ValueNotifier<int> countNotifier;

    setUp(() {
      countNotifier = ValueNotifier<int>(0);
    });

    tearDown(() {
      countNotifier.dispose();
    });

    testWidgets('should display initial count value', (
      WidgetTester tester,
    ) async {
      // Arrange
      countNotifier.value = 5;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ItemCounter(count: countNotifier)),
        ),
      );

      // Assert
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('should display zero as initial count', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ItemCounter(count: countNotifier)),
        ),
      );

      // Assert
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('should increment count when add button is pressed', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ItemCounter(count: countNotifier)),
        ),
      );

      expect(find.text('0'), findsOneWidget);

      // Find and tap the add button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Assert

      expect(countNotifier.value, equals(1));
    });

    testWidgets('should decrement count when remove button is pressed', (
      WidgetTester tester,
    ) async {
      // Arrange
      countNotifier.value = 3;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ItemCounter(count: countNotifier)),
        ),
      );

      expect(find.text('3'), findsOneWidget);

      // Find and tap the remove button
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      // Assert

      expect(countNotifier.value, equals(2));
    });

    testWidgets('should not decrement count below zero', (
      WidgetTester tester,
    ) async {
      // Arrange - count is already 0 from setUp

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ItemCounter(count: countNotifier)),
        ),
      );

      // Find and tap the remove button
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      // Assert
      expect(find.text('0'), findsOneWidget);
      expect(countNotifier.value, equals(0));
    });

    testWidgets('should have correct widget structure', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ItemCounter(count: countNotifier)),
        ),
      );

      // Assert
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(IconButton), findsNWidgets(2));
      expect(find.byType(Container), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('should handle multiple increments correctly', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ItemCounter(count: countNotifier)),
        ),
      );

      expect(find.text('0'), findsOneWidget);

      // Tap add button multiple times
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Assert

      expect(countNotifier.value, equals(3));
    });

    testWidgets('should handle increment and decrement combination', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ItemCounter(count: countNotifier)),
        ),
      );

      expect(find.text('0'), findsOneWidget);

      // Increment twice
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Decrement once
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      // Assert

      expect(countNotifier.value, equals(1));
    });
  });
}
