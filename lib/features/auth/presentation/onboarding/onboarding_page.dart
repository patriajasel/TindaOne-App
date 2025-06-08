import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        gradient: Theme.of(context).extension<GradientTheme>()!.primaryGradient,
      ),
      child: IntroductionScreen(
        globalBackgroundColor: Colors.transparent,
        pages: [
          _buildPageViewModel(
            textTheme,
            title: 'TindaOne',
            body: 'The most trusted mobile POS system for everyone.',
            imageUrl: 'lib/shared/assets/app_logo.png',
          ),
          _buildPageViewModel(
            textTheme,
            title: 'Sales Control',
            body:
                'Easily monitor, record, and manage all your sales activities.',
            imageUrl: 'lib/shared/assets/sales_display.png',
          ),
          _buildPageViewModel(
            textTheme,
            title: 'Inventory Tracking',
            body: 'Keep track of your stock in real time with ease.',
            imageUrl: 'lib/shared/assets/inventory_display.png',
          ),
          _buildPageViewModel(
            textTheme,
            title: 'AI Insights',
            body: 'Unlock growth with smart, data-driven analysis.',
            imageUrl: 'lib/shared/assets/ai_insights_display.png',
          ),
        ],
        onDone: () async {
          final prefs = await SharedPreferences.getInstance();

          prefs.setBool('seenOnboarding', true);
          if (context.mounted) {
            context.go('/login-page');
          }
        },
        showSkipButton: true,
        skip: Text("Skip", style: textTheme.bodySmall),
        next: Icon(
          Icons.arrow_forward,
          color: Theme.of(context).colorScheme.surface,
        ),
        done: Text("Done", style: textTheme.bodySmall),
        dotsDecorator: DotsDecorator(
          color: AppColors.appPrimary,
          activeColor: AppColors.appSecondary,
        ),
      ),
    );
  }

  /// Build a PageViewModel Widget
  PageViewModel _buildPageViewModel(
    TextTheme textTheme, {
    required String title,
    required String body,
    String? imageUrl,
    IconData? icon,
  }) {
    return PageViewModel(
      decoration: PageDecoration(imagePadding: EdgeInsets.only(bottom: 0)),
      titleWidget: Text(
        title,
        style: textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      bodyWidget: Text(
        body,
        style: textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
      image: Center(
        child: imageUrl != null && icon == null
            ? Image.asset(imageUrl, scale: 2.5, fit: BoxFit.contain)
            : Center(child: Icon(icon, size: 100)),
      ),
    );
  }
}
