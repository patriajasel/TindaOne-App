import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tinda_one_app/features/pages/inventory/inventory_page.dart';
import 'package:tinda_one_app/shared/common/product_card.dart';

void main() {
  setUpAll(() => HttpOverrides.global = _MockHttpOverrides());
  group('Inventory Page Widget Tests', () {
    Widget createWidgetUnderTest() {
      return MaterialApp(home: InventoryPage());
    }

    testWidgets('should render all UI components correctly', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Inventory'), findsOneWidget);
      expect(find.text('Product Catalog'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.inventory_2_outlined), findsOneWidget);
      expect(find.byType(SearchField), findsOneWidget);
      expect(find.byType(ProductCard), findsAny);
    });

    testWidgets('should have clickable product card', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final productCard = find.byType(ProductCard).first;

      // Assert
      await tester.tap(productCard);
      await tester.pumpAndSettle();
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

    testWidgets('should display dialog when product card is clicked', (
      tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final productCard = find.byType(ProductCard).first;
      await tester.tap(productCard);
      await tester.pumpAndSettle();

      expect(find.byType(ModalBarrier), findsAtLeastNWidgets(1));
    });
  });
}

class _MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return _MockHttpClient();
  }
}

class _MockHttpClient extends Fake implements HttpClient {
  @override
  bool autoUncompress = true;

  @override
  Future<HttpClientRequest> getUrl(Uri url) async {
    return _MockHttpClientRequest();
  }
}

class _MockHttpClientRequest extends Fake implements HttpClientRequest {
  @override
  Future<HttpClientResponse> close() async {
    return _MockHttpClientResponse();
  }
}

class _MockHttpClientResponse extends Fake implements HttpClientResponse {
  final List<int> _fakePngData = <int>[
    0x89, 0x50, 0x4E, 0x47, // PNG signature
    0x0D, 0x0A, 0x1A, 0x0A,
    0x00, 0x00, 0x00, 0x0D,
    0x49, 0x48, 0x44, 0x52,
    0x00, 0x00, 0x00, 0x01, // Width: 1px
    0x00, 0x00, 0x00, 0x01, // Height: 1px
    0x08, 0x06, 0x00, 0x00,
    0x00, 0x1F, 0x15, 0xC4,
    0x89, // CRC dummy
  ];

  @override
  int get statusCode => 200;

  @override
  int get contentLength => _fakePngData.length;

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int>)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    final controller = StreamController<List<int>>();

    // Add data and close immediately (simulate image loading)
    controller.add(_fakePngData);
    controller.close();

    return controller.stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  // Optional: if you encounter more errors
  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  HttpHeaders get headers => _MockHttpHeaders();
}

class _MockHttpHeaders extends Fake implements HttpHeaders {
  @override
  List<String>? operator [](String name) => <String>[];
}
