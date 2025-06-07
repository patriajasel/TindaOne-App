import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';

class AppThemeConfig {
  /// Light Theme Configuration
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,

    // Scaffold default background color for light theme
    scaffoldBackgroundColor: AppColors.lightBackground,

    // Color scheme for light theme
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightPrimary,
      primary: AppColors.appPrimary,
      secondary: AppColors.appSecondary,
      tertiary: AppColors.appTertiary,
      surface: AppColors.lightPrimary,
      error: AppColors.error,
      brightness: Brightness.light,
    ),

    // TextTheme for light theme
    textTheme: GoogleFonts.poppinsTextTheme()
        .copyWith(
          titleLarge: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          displayLarge: GoogleFonts.poppins(fontSize: 28),
          displayMedium: GoogleFonts.poppins(fontSize: 24),
          displaySmall: GoogleFonts.poppins(fontSize: 18),
          bodyLarge: GoogleFonts.poppins(fontSize: 24),
          bodyMedium: GoogleFonts.poppins(fontSize: 18),
          bodySmall: GoogleFonts.poppins(fontSize: 12),
          labelLarge: GoogleFonts.poppins(fontSize: 26),
          labelMedium: GoogleFonts.poppins(fontSize: 20),
          labelSmall: GoogleFonts.poppins(fontSize: 14),
        )
        .apply(
          bodyColor: AppColors.lightPrimary,
          displayColor: AppColors.lightPrimary,
        ),

    // Gradient Theme for light theme
    extensions: [
      GradientTheme(primaryGradient: AppColors.lightPrimaryGradient),
    ],
  );

  /// Dark Theme Configuration
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,

    // Scaffold default background color for dark theme
    scaffoldBackgroundColor: AppColors.darkBackground,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkPrimary,
      primary: AppColors.appPrimary,
      secondary: AppColors.appSecondary,
      tertiary: AppColors.appTertiary,
      surface: AppColors.darkPrimary,
      error: AppColors.error,
      brightness: Brightness.dark,
    ),

    // TextTheme
    textTheme: GoogleFonts.poppinsTextTheme()
        .copyWith(
          titleLarge: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          displayLarge: GoogleFonts.poppins(fontSize: 28),
          displayMedium: GoogleFonts.poppins(fontSize: 24),
          displaySmall: GoogleFonts.poppins(fontSize: 18),
          bodyLarge: GoogleFonts.poppins(fontSize: 24),
          bodyMedium: GoogleFonts.poppins(fontSize: 18),
          bodySmall: GoogleFonts.poppins(fontSize: 12),
          labelLarge: GoogleFonts.poppins(fontSize: 26),
          labelMedium: GoogleFonts.poppins(fontSize: 20),
          labelSmall: GoogleFonts.poppins(fontSize: 14),
        )
        .apply(
          bodyColor: AppColors.darkPrimary,
          displayColor: AppColors.darkPrimary,
        ),

    // Gradient for dark theme
    extensions: [GradientTheme(primaryGradient: AppColors.darkPrimaryGradient)],
  );
}

/// Extension for gradient on theme data
@immutable
class GradientTheme extends ThemeExtension<GradientTheme> {
  final Gradient primaryGradient;

  const GradientTheme({required this.primaryGradient});

  @override
  ThemeExtension<GradientTheme> copyWith({Gradient? primaryGradient}) {
    return GradientTheme(
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }

  @override
  ThemeExtension<GradientTheme> lerp(
    ThemeExtension<GradientTheme>? other,
    double t,
  ) {
    if (other! is GradientTheme) return this;
    final otherGradient = other as GradientTheme;

    return GradientTheme(
      primaryGradient: Gradient.lerp(
        primaryGradient,
        otherGradient.primaryGradient,
        t,
      )!,
    );
  }
}
