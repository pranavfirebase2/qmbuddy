import 'package:flutter/material.dart';

class AppColors {
  // Prevent instantiation
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFFC13C01); // The requested orange/red
  static const Color surface = Colors.white;      // App background
  static const Color background = Colors.white;

  // Text Colors
  static const Color textPrimary = Colors.black87;
  static const Color textSecondary = Colors.black54;
  static const Color textMuted = Color(0xFF9E9E9E); // grey.shade500
  static const Color textDark = Color(0xFF424242); // grey.shade800

  // Border & Layout
  static const Color borderLight = Color(0xFFEEEEEE); // grey.shade200
  static const Color border = Color(0xFFE0E0E0); // grey.shade300
  
  // Status Colors
  static const Color success = Colors.green;
  static const Color successLight = Color(0xFFE8F5E9); // green.shade50
  static const Color error = Colors.red;
  static const Color errorLight = Color(0xFFEF5350); // red.shade400
  
  // Shadows
  static const Color shadowColor = Colors.black12;
}
