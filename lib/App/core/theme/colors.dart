import 'package:flutter/material.dart';

/// TODO : JANGAN LUPA DI IMPLEMENTASI SAAT ADA FINAL DESIGN
class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color Black20 = Color(0x33000000); // 20% opacity
  static const Color gray = Color(0xFF808080);
  static const Color lightGray = Color(0xFFD9D9D9);
  static const Color shadowGrey = Color(0xFFF1F1F1);

  // Green App Colors
  static const Color primary = Color(0xFF3EA35D);
  static const Color primary20 = Color(0x333EA35D); // 20% opacity
  static const Color secondary = Color(0xFFE8FCCF);

  // Gradient Colors
  static const Color gradientStart = Color(0xFF225C34);
  static const Color gradientEnd = Color(0xFF153B21);

  // Transparent
  static const Color transparent = Colors.transparent;
}


class AppGradients {
  static const LinearGradient onboarding = LinearGradient(
    begin: Alignment(0.50, -0.00),
    end: Alignment(0.50, 1.00),
    colors: [
      AppColors.gradientStart,
      Color.fromRGBO(21, 59, 33, 1),
    ],
  );
}
