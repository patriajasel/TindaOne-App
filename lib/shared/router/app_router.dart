
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:tinda_one_app/features/auth/onboarding/onboarding_page.dart';
import 'package:tinda_one_app/features/pages/home.dart';

class AppRouter {
  static GoRouter router(bool showOnboarding) {
    return GoRouter(
      initialLocation: showOnboarding ? '/home' : '/onboarding',
      routes: [
        GoRoute(
          path: '/onboarding',
          name: 'onboarding',
          pageBuilder: (context, state) => MaterialPage(
            child: OnboardingPage(),
          ),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: GoTransitions.zoom.call,
          builder: (context, state) {
            return Home();
          },
        ),
      ],
    );
  }
}