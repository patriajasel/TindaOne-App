import 'package:flutter/material.dart';

class AppColors {
  /// Brand Colors

  static const Color appPrimary = Color(0xFF01396c);
  static const Color appSecondary = Color(0xFFff7d00);
  static const Color appTertiary = Color(0xFF00dbfd);

  /// Text Colors

  static const Color lightPrimary = Color(0xFF000000);
  static const Color lightSecondary = Color(0xFF4c4c4c);
  static const Color darkPrimary = Color(0xFFffffff);
  static const Color darkSecondary = Color(0xFFd5d5d5);

  /// Background Colors

  static const Color lightBackground = Color(0xFFf3f6f4);
  static const Color darkBackground = Color(0xFF011f3b);

  /// Utility Colors

  static const Color success = Color(0xFF3fa910);
  static const Color error = Color(0xFFc22b20);
  static const Color warning = Color(0xFFf9cf58);

  /// Complementary Colors

  /// Gradient Colors

  static const Gradient lightPrimaryGradient = LinearGradient(
    colors: [appTertiary, lightBackground],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.5],
  );

  static const Gradient darkPrimaryGradient = LinearGradient(
    colors: [darkBackground, appPrimary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 5],
  );
}
