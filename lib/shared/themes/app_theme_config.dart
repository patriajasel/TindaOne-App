import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';

class AppThemeConfig {
  /// Light Theme Configuration
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,

    // Scaffold default background color for light theme
    scaffoldBackgroundColor: AppColors.lightBackground,

    // Divider Color
    dividerColor: AppColors.lightSecondary,

    // Primary Utility Colors
    primaryColorDark: AppColors.darkPrimary,
    primaryColorLight: AppColors.lightPrimary,

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

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 3,
      scrolledUnderElevation: 3,
      centerTitle: false,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.appPrimary,
      ),
      surfaceTintColor: Colors.transparent,
      shadowColor: AppColors.darkBackground,
      iconTheme: IconThemeData(color: AppColors.appSecondary, size: 24),
      actionsIconTheme: IconThemeData(color: AppColors.appSecondary, size: 24),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 12),
      toolbarHeight: 70,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
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
            fontSize: 22,
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

    // TextField/TextFormField theme
    inputDecorationTheme: InputDecorationTheme(
      // Border styles
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        borderSide: BorderSide(color: AppColors.appPrimary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        borderSide: BorderSide(color: AppColors.appPrimary, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        borderSide: BorderSide(color: AppColors.appPrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),

      errorStyle: GoogleFonts.poppins(color: AppColors.error, fontSize: 10),

      // Text styles
      labelStyle: GoogleFonts.poppins(
        color: AppColors.lightPrimary,
        fontSize: 12,
      ),

      hintStyle: GoogleFonts.poppins(
        color: AppColors.lightPrimary.withValues(alpha: 0.6),
        fontSize: 12,
      ),

      // Content padding
      contentPadding: EdgeInsets.symmetric(horizontal: 20),

      // Icon themes
      prefixIconColor: AppColors.appSecondary,
      suffixIconColor: AppColors.appSecondary,
    ),

    // Card Themes
    cardTheme: CardThemeData(
      color: AppColors.appTertiary.withValues(alpha: 0.1),
      shadowColor: AppColors.lightPrimary.withValues(alpha: 0.2),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.lightPrimary.withValues(alpha: 0.1)),
      ),
      surfaceTintColor: AppColors.appTertiary.withValues(alpha: 0.3),
    ),

    // Elevated Button Themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.appPrimary),
        foregroundColor: WidgetStatePropertyAll(AppColors.darkPrimary),
        iconColor: WidgetStatePropertyAll(AppColors.appSecondary),
        textStyle: WidgetStatePropertyAll(GoogleFonts.poppins(fontSize: 12)),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 40)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),

    //Modal Bottom Sheet Theme
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.lightBackground,
      elevation: 10,
      modalElevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),

    // Dialog Theme
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.lightBackground,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lightBackground,
      selectedColor: AppColors.appTertiary,
      showCheckmark: false,
      elevation: 2,
      pressElevation: 4,
      shadowColor: AppColors.darkBackground.withValues(alpha: 0.3),
      labelStyle: GoogleFonts.poppins(
        fontSize: 12,
        color: AppColors.lightPrimary,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),

    radioTheme: RadioThemeData(
      fillColor: WidgetStatePropertyAll(AppColors.appSecondary),
      
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

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;
  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;
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
