import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Prevent instantiation
  AppTheme._();

  /// Nammude Main Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFFFFFFF), // White theme
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFC13C01), // Primary Color
        brightness: Brightness.light,
      ),
      
      // Ithanu nammude Text Style control center!
      textTheme: TextTheme(
        // Valiya Headings-nu (e.g. Page Titles)
        displayLarge: GoogleFonts.outfit(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        // Medium Headings-nu (e.g. Category Names)
        titleLarge: GoogleFonts.outfit(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
        // Normal text-nu (e.g. Item names, descriptions)
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black87,
        ),
        // Cheriya text-nu (e.g. Price, small labels)
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black54,
        ),

        
      ),
    );
  }
}
