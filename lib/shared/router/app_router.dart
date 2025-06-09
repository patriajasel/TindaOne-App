import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:tinda_one_app/features/auth/presentation/login/login_page.dart';
import 'package:tinda_one_app/features/auth/presentation/onboarding/onboarding_page.dart';
import 'package:tinda_one_app/features/pages/analytics/analytics_page.dart';
import 'package:tinda_one_app/features/pages/cashier/cashier_page.dart';
import 'package:tinda_one_app/features/pages/home_page.dart';
import 'package:tinda_one_app/features/pages/inventory/inventory_page.dart';
import 'package:tinda_one_app/features/pages/scanner/scanner_page.dart';
import 'package:tinda_one_app/features/pages/transactions/transaction_page.dart';

class AppRouter {
  static GoRouter router(bool showOnboarding) {
    return GoRouter(
      initialLocation: showOnboarding ? '/login-page' : '/onboarding-page',
      routes: [
        // Router for Onboarding Page
        GoRoute(
          path: '/onboarding-page',
          name: 'Onboarding Page',
          pageBuilder: GoTransitions.zoom.call,
          builder: (context, state) {
            return OnboardingPage();
          },
        ),

        // Router for Login Page
        GoRoute(
          path: '/login-page',
          name: 'Login Page',
          pageBuilder: GoTransitions.zoom.call,
          builder: (context, state) {
            return LoginPage();
          },
        ),

        // Home Navigation StatefulShellRoute Indexed Stack
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return HomePage(navigationShell: navigationShell);
          },
          branches: [
            // Branch for Cashier Page
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/cashier-page',
                  name: 'Cashier Page',
                  pageBuilder: GoTransitions.zoom.call,
                  builder: (context, state) {
                    return CashierPage();
                  },
                ),
              ],
            ),

            // Branch for Inventory Page
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/inventory-page',
                  name: 'Inventory Page',
                  pageBuilder: GoTransitions.zoom.call,
                  builder: (context, state) {
                    return InventoryPage();
                  },
                ),
              ],
            ),

            // Branch for Scanner Page
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/scanner-page',
                  name: 'Scanner Page',
                  pageBuilder: GoTransitions.zoom.call,
                  builder: (context, state) {
                    return ScannerPage();
                  },
                ),
              ],
            ),

            // Branch for Transaction Page
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/transaction-page',
                  name: 'Transaction Page',
                  pageBuilder: GoTransitions.zoom.call,
                  builder: (context, state) {
                    return TransactionPage();
                  },
                ),
              ],
            ),

            // Branch for Analytics Page
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/analytics-page',
                  name: 'Analytics Page',
                  pageBuilder: GoTransitions.zoom.call,
                  builder: (context, state) {
                    return AnalyticsPage();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
