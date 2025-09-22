import 'package:flutter/material.dart';

class AppColors {
  // Basic Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black20 = Color.fromRGBO(0, 0, 0, 0.2); // 20% opacity
  static const Color gray = Color(0xFF808080);
  static const Color lightGray = Color(0xFFD9D9D9);
  static const Color shadowGrey = Color(0xFFF1F1F1); // very light gray
  static const Color darkGray = Color(0xFF434343); // Dark
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
      AppColors.gradientEnd, // konsisten pake AppColors
    ],
  );

  static const LinearGradient offerBox = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.primary, // atas
      Color(0xFF447553), // bawah (#447553)
    ],
  );

  static const LinearGradient checkOut = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      AppColors.primary, // kiri
      Color(0xFF184025), // kanan
    ],
  );
}
