import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinda_one_app/shared/router/app_router.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(TindaOneApp(showOnboarding: seenOnboarding));
}

class TindaOneApp extends StatelessWidget {
  final bool showOnboarding;
  const TindaOneApp({super.key, required this.showOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemeConfig.lightTheme,
      routerConfig: AppRouter.router(showOnboarding),
    );
  }
}
