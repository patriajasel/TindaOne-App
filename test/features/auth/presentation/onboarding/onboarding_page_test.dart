import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinda_one_app/features/auth/presentation/onboarding/onboarding_page.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

void main() {
  group('OnboardingPage Widget Tests', () {
    late GoRouter router;

    setUp(() {
      // Mock SharedPreferences
      SharedPreferences.setMockInitialValues({});

      // Create a mock router
      router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const OnboardingPage(),
          ),
          GoRoute(
            path: '/login-page',
            builder: (context, state) =>
                const Scaffold(body: Text('Login Page')),
          ),
        ],
      );
    });

    Widget createTestWidget() {
      return MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          extensions: [
            GradientTheme(
              primaryGradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
              ),
            ),
          ],
          textTheme: const TextTheme(
            titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            bodySmall: TextStyle(fontSize: 14),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
      );
    }

    testWidgets('should display first page content correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check first page content
      expect(find.text('TindaOne'), findsOneWidget);
      expect(
        find.text('The most trusted mobile POS system for everyone.'),
        findsOneWidget,
      );

      // Check if image is displayed (though actual image loading may not work in tests)
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should display navigation controls', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check for Skip button
      expect(find.text('Skip'), findsOneWidget);

      // Check for Next arrow
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('should navigate through all pages when clicking next button', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Start with first page
      expect(find.text('TindaOne'), findsOneWidget);

      // Swipe to next page (Sales Control)
      await tester.tap(find.byIcon(Icons.arrow_forward));
      await tester.pumpAndSettle();
      expect(find.text('Sales Control'), findsOneWidget);
      expect(
        find.text(
          'Easily monitor, record, and manage all your sales activities.',
        ),
        findsOneWidget,
      );

      // Swipe to next page (Inventory Tracking)
      await tester.tap(find.byIcon(Icons.arrow_forward));
      await tester.pumpAndSettle();
      expect(find.text('Inventory Tracking'), findsOneWidget);
      expect(
        find.text('Keep track of your stock in real time with ease.'),
        findsOneWidget,
      );

      // Swipe to last page (AI Insights)
      await tester.tap(find.byIcon(Icons.arrow_forward));
      await tester.pumpAndSettle();
      expect(find.text('AI Insights'), findsOneWidget);
      expect(
        find.text('Unlock growth with smart, data-driven analysis.'),
        findsOneWidget,
      );
    });

    testWidgets('should show Done button on last page', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Navigate to last page
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.arrow_forward));
        await tester.pumpAndSettle();
      }

      // Verify Done button appears on last page
      expect(find.text('Done'), findsOneWidget);
    });

    testWidgets('should handle Skip button tap', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Tap Skip button
      await tester.tap(find.text('Skip'));
      await tester.pumpAndSettle();
    });

    testWidgets('should handle Done button tap on last page', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Navigate to last page
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.arrow_forward));
        await tester.pumpAndSettle();
      }

      // Tap Done button
      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();
    });

    testWidgets('should have correct number of pages', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // The IntroductionScreen should have 4 pages based on the implementation
      final introScreen = tester.widget<IntroductionScreen>(
        find.byType(IntroductionScreen),
      );
      expect(introScreen.pages?.length, 4);
    });
  });
}
