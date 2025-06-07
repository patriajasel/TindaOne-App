import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:tinda_one_app/features/auth/presentation/login/login_page.dart';
import 'package:tinda_one_app/features/auth/presentation/onboarding/onboarding_page.dart';
import 'package:tinda_one_app/features/pages/home.dart';

class AppRouter {
  static GoRouter router(bool showOnboarding) {
    return GoRouter(
      initialLocation: showOnboarding ? '/login-page' : '/onboarding-page',
      routes: [
        GoRoute(
          path: '/onboarding-page',
          name: 'Onboarding Page',
          pageBuilder: (context, state) =>
              MaterialPage(child: OnboardingPage()),
        ),
        GoRoute(
          path: '/login-page',
          name: 'Login Page',
          pageBuilder: GoTransitions.zoom.call,
          builder: (context, state) {
            return LoginPage();
          },
        ),
        GoRoute(
          path: '/home-page',
          name: 'Home Page',
          pageBuilder: GoTransitions.zoom.call,
          builder: (context, state) {
            return Home();
          },
        ),
      ],
    );
  }
}
