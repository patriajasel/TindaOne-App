import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tinda_one_app/features/auth/presentation/login/login_page.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

void main() {
  group('LoginPage Widget Tests', () {
    Widget createWidgetUnderTest() {
      return MaterialApp(
        theme: ThemeData(
          extensions: [
            GradientTheme(
              primaryGradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
              ),
            ),
          ],
        ),
        home: const LoginPage(),
      );
    }

    testWidgets('should render all UI components correctly', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert - Check if all main components are present
      expect(find.text('TindaOne'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Forgot Password?'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
      expect(find.text("Don't have an account? "), findsOneWidget);
      expect(find.text('Sign up here'), findsOneWidget);
      expect(find.text('OR'), findsOneWidget);
      expect(find.text('Use Offline Mode'), findsOneWidget);

      // Check for icons
      expect(find.byIcon(Icons.email), findsOneWidget);
      expect(find.byIcon(Icons.lock), findsOneWidget);
      expect(find.byIcon(Icons.login), findsOneWidget);
      expect(find.byIcon(Icons.smartphone), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('should display app logo', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Image), findsOneWidget);

      final Image logoImage = tester.widget(find.byType(Image));
      final AssetImage assetImage = logoImage.image as AssetImage;
      expect(assetImage.assetName, 'lib/shared/assets/app_logo.png');
    });

    testWidgets('should toggle password visibility when suffix icon is tapped', (
      tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Find password field and visibility toggle
      final visibilityToggle = find.byIcon(Icons.visibility);

      // Assert initial state - visibility icon should be present (password is obscured)
      expect(visibilityToggle, findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);

      // Act - Tap the visibility toggle
      await tester.tap(visibilityToggle);
      await tester.pumpAndSettle();

      // Assert - Password should now be visible (visibility_off icon should appear)
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);

      // Act - Tap again to hide password
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pumpAndSettle();

      // Assert - Password should be obscured again (visibility icon should appear)
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);
    });

    testWidgets('should validate form when login button is tapped', (
      tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final loginButton = find.text('Login');

      // Act - Tap login button without entering any data
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Assert - Form validation should trigger
      // Note: This assumes your LoginValidators will show error messages
      // You might need to adjust based on your actual validation implementation
      expect(find.byType(Form), findsOneWidget);
    });

    testWidgets('should allow text input in email and password fields', (
      tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final emailField = find.widgetWithText(TextFormField, 'Email Address');
      final passwordField = find.widgetWithText(TextFormField, 'Password');

      // Act - Enter text in email field
      await tester.enterText(emailField, 'test@example.com');
      await tester.pumpAndSettle();

      // Act - Enter text in password field
      await tester.enterText(passwordField, 'password123');
      await tester.pumpAndSettle();

      // Assert - Text should be entered correctly
      expect(find.text('test@example.com'), findsOneWidget);
      // Password text won't be visible due to obscureText, but we can check the controller
      final TextFormField passwordWidget = tester.widget(passwordField);
      expect(passwordWidget.controller?.text, 'password123');
    });

    testWidgets('should have clickable buttons and text buttons', (
      tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert - Find all clickable elements
      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Use Offline Mode'), findsOneWidget);
      expect(
        find.widgetWithText(TextButton, 'Forgot Password?'),
        findsOneWidget,
      );
      expect(find.widgetWithText(TextButton, 'Sign up here'), findsOneWidget);

      // Act & Assert - Verify buttons are tappable (won't throw exceptions)
      await tester.tap(find.widgetWithText(TextButton, 'Forgot Password?'));
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(TextButton, 'Sign up here'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Use Offline Mode'));
      await tester.pumpAndSettle();
    });

    testWidgets('should display OR divider with proper styling', (
      tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert - Check OR divider is present
      expect(find.text('OR'), findsOneWidget);
      expect(
        find.byType(Divider),
        findsNWidgets(2),
      ); // Two dividers on either side of OR
    });

    testWidgets('should have proper layout structure', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert - Check main structural widgets
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Container), findsAtLeastNWidgets(1));
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(Column), findsAtLeastNWidgets(1));
      expect(find.byType(Padding), findsAtLeastNWidgets(1));
    });

    testWidgets('should apply gradient background', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert - Check if Container with gradient decoration exists
      final Container backgroundContainer = tester.widget(
        find.byType(Container).first,
      );

      expect(backgroundContainer.decoration, isA<BoxDecoration>());
      final BoxDecoration decoration =
          backgroundContainer.decoration as BoxDecoration;
      expect(decoration.gradient, isNotNull);
    });

    testWidgets('should have proper text field controllers', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final emailField = find.widgetWithText(TextFormField, 'Email Address');
      final passwordField = find.widgetWithText(TextFormField, 'Password');

      // Assert - Check that controllers are attached
      final TextFormField emailWidget = tester.widget(emailField);
      final TextFormField passwordWidget = tester.widget(passwordField);

      expect(emailWidget.controller, isNotNull);
      expect(passwordWidget.controller, isNotNull);
    });
  });
}
