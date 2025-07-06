import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/features/pages/presentation/home_page.dart';

class TestNavigationShell extends StatefulWidget
    implements StatefulNavigationShell {
  final int _currentIndex;
  final Function(int, {bool initialLocation})? _onBranchTap;

  const TestNavigationShell({
    super.key,
    required int currentIndex,
    Function(int, {bool initialLocation})? onBranchTap,
  }) : _currentIndex = currentIndex,
       _onBranchTap = onBranchTap;

  @override
  int get currentIndex => _currentIndex;

  @override
  void goBranch(int index, {bool initialLocation = false}) {
    _onBranchTap?.call(index, initialLocation: initialLocation);
  }

  @override
  State<TestNavigationShell> createState() => _TestNavigationShellState();

  @override
  ShellNavigationContainerBuilder get containerBuilder =>
      throw UnimplementedError();

  @override
  List<StatefulShellBranch> get debugLoadedBranches =>
      throw UnimplementedError();

  @override
  StatefulShellRoute get route => throw UnimplementedError();

  @override
  ShellRouteContext get shellRouteContext => throw UnimplementedError();
}

class _TestNavigationShellState extends State<TestNavigationShell> {
  @override
  Widget build(BuildContext context) {
    return Text('Test Navigation Shell - Index: ${widget.currentIndex}');
  }
}

void main() {
  group('HomePage Widget Tests', () {
    late TestNavigationShell testNavigationShell;
    late List<int> capturedBranchCalls;
    late List<bool> capturedInitialLocationCalls;

    setUp(() {
      capturedBranchCalls = [];
      capturedInitialLocationCalls = [];

      testNavigationShell = TestNavigationShell(
        currentIndex: 0,
        onBranchTap: (index, {bool initialLocation = false}) {
          capturedBranchCalls.add(index);
          capturedInitialLocationCalls.add(initialLocation);
        },
      );
    });

    testWidgets('should render HomePage with CurvedNavigationBar', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: HomePage(navigationShell: testNavigationShell)),
      );

      // Verify that the HomePage renders
      expect(find.byType(HomePage), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(CurvedNavigationBar), findsOneWidget);
      expect(find.text('Test Navigation Shell - Index: 0'), findsOneWidget);
    });

    testWidgets('should display all navigation icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: HomePage(navigationShell: testNavigationShell)),
      );

      // Verify all 5 navigation icons are present
      expect(find.byIcon(Icons.point_of_sale), findsAtLeast(2));
      expect(find.byIcon(Icons.inventory_2), findsOneWidget);
      expect(find.byIcon(Icons.qr_code_2), findsOneWidget);
      expect(find.byIcon(Icons.receipt_long), findsOneWidget);
      expect(find.byIcon(Icons.analytics), findsOneWidget);
    });

    testWidgets('should have correct initial navigation index', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: HomePage(navigationShell: testNavigationShell)),
      );

      final curvedNavBar = tester.widget<CurvedNavigationBar>(
        find.byType(CurvedNavigationBar),
      );

      expect(curvedNavBar.index, equals(0));
    });

    testWidgets('should call goBranch when navigation item is tapped', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: HomePage(navigationShell: testNavigationShell)),
      );

      // Clear any previous calls
      capturedBranchCalls.clear();
      capturedInitialLocationCalls.clear();

      // Tap on the second navigation item (inventory icon)
      await tester.tap(find.byIcon(Icons.inventory_2));
      await tester.pump();

      // Verify goBranch was called with correct index
      expect(capturedBranchCalls, contains(1));
      expect(capturedInitialLocationCalls.last, isFalse);
    });
  });
}
