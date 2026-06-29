import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = SlateTheme.light;

class SlateTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      scaffoldBackgroundColor: Color.alphaBlend(
        const Color.fromARGB(59, 0, 101, 156).withOpacity(0.2),
        const Color.fromARGB(255, 255, 255, 255),
      ),

      // Typography
      textTheme: _textTheme,

      // Component Themes
      cardTheme: _cardTheme,
      checkboxTheme: _checkboxTheme,
      elevatedButtonTheme: _buttonTheme,
      inputDecorationTheme: _inputTheme,
      dividerTheme: const DividerThemeData(
        thickness: 4,
        color: Color(0xFF191B21),
        space: 40,
      ),
    );
  }

  static const ColorScheme _colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF212531), // Deep Charcoal
    onPrimary: Colors.white,
    primaryContainer: Color(0xFF373B47),
    onPrimaryContainer: Color(0xFFA2A5B4),
    secondary: Color(0xFF006D36), // Vibrant Green
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFF6DFE9C),
    onSecondaryContainer: Color(0xFF007439),
    surface: Color.fromARGB(255, 241, 235, 255), // Muted Blue-Grey
    onSurface: Color(0xFF191B21),
    surfaceVariant: Color(0xFFE2E2EA),
    onSurfaceVariant: Color(0xFF46464C),
    outline: Color(0xFF76777C),
    error: Color(0xFFBA1A1A),
    onError: Colors.white,
  );

  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.itim(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      height: 1.2,
      letterSpacing: -0.72, // -0.02em
      color: const Color(0xFF191B21),
    ),
    displayMedium: GoogleFonts.itim(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: const Color(0xFF191B21),
    ),
    bodyLarge: GoogleFonts.itim(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.5,
      letterSpacing: 0.18,
      color: const Color(0xFF191B21),
    ),
    bodyMedium: GoogleFonts.itim(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: const Color(0xFF46464C),
    ),
    labelLarge: GoogleFonts.itim(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.2,
      color: Colors.white,
    ),
  );

  static final CardThemeData _cardTheme = CardThemeData(
    color: Color.alphaBlend(
      Color(0x00023B).withOpacity(0.2),
      Color.alphaBlend(
        Color(0x000000).withOpacity(0.6),
        Color(0x787878).withOpacity(0.2),
      ),
    ),
    elevation: 4,
    shadowColor: Colors.black.withOpacity(0.15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: const EdgeInsets.symmetric(vertical: 8),
  );

  static final CheckboxThemeData _checkboxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return const Color(0xFF006D36);
      return Colors.transparent;
    }),
    side: const BorderSide(color: Color(0xFFC6C6CC), width: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.all(const Color(0xFF212531)),
  );

  static final ElevatedButtonThemeData _buttonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF212531),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.white,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      textStyle: _textTheme.labelLarge?.copyWith(fontSize: 14),
      elevation: 6,
    ),
  );

  static final InputDecorationTheme _inputTheme = InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF212531),
    contentPadding: const EdgeInsets.all(20),
    border: UnderlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFFC6C6CC), width: 1),
      borderRadius: BorderRadius.circular(16),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFFC6C6CC), width: 1),
      borderRadius: BorderRadius.circular(16),
    ),
  );
}
