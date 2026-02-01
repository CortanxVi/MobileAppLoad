import 'package:flutter/material.dart';

// สี (เหมือน CSS Variables)
class PunkColors {
  static const Color primary = Color(0xFFFF0000); // แดง
  static const Color background = Color(0xFF000000); // ดำ
  static const Color surface = Color(0xFF1a0000); // ดำแดง
  static const Color onPrimary = Color(0xFF000000); // ข้อความบนปุ่มแดง
  static const Color onBackground = Color(0xFFFFFFFF); // ข้อความบนพื้นดำ
  static const Color border = Color(0xFFFF0000); // ขอบแดง
  static const Color borderWhite = Color(0xFFFFFFFF); // ขอบขาว
}

// Typography (เหมือน CSS Font Styles)
class PunkTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w900,
    color: PunkColors.onBackground,
    letterSpacing: 3,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: PunkColors.onBackground,
    letterSpacing: 2,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: PunkColors.onBackground,
    letterSpacing: 1,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: PunkColors.primary,
    letterSpacing: 2,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    letterSpacing: 3,
  );
}

// Spacing (เหมือน CSS Spacing Variables)
class PunkSpacing {
  static const double xs = 8.0;
  static const double sm = 16.0;
  static const double md = 24.0;
  static const double lg = 32.0;
  static const double xl = 40.0;
}

// Border Radius (เหมือน CSS Border Radius)
class PunkBorders {
  static const double none = 0.0;
  static const double sm = 4.0;
  static const double md = 8.0;

  static BoxDecoration primaryBorder = BoxDecoration(
    border: Border.all(color: PunkColors.border, width: 2),
    boxShadow: [
      BoxShadow(
        color: PunkColors.primary.withOpacity(0.3),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static BoxDecoration glowBorder = BoxDecoration(
    border: Border.all(color: PunkColors.border, width: 3),
    boxShadow: [
      BoxShadow(
        color: PunkColors.primary.withOpacity(0.5),
        blurRadius: 20,
        spreadRadius: 2,
      ),
    ],
  );
}

// Shadows (เหมือน CSS Box Shadow)
class PunkShadows {
  static List<BoxShadow> glow = [
    BoxShadow(
      color: PunkColors.primary.withOpacity(0.5),
      blurRadius: 20,
      spreadRadius: 5,
    ),
  ];

  static List<Shadow> textGlow = [
    const Shadow(
      color: PunkColors.primary,
      offset: Offset(3, 3),
      blurRadius: 10,
    ),
  ];
}

// Input Decoration Theme (เหมือน CSS Input Styles)
class PunkInputDecorations {
  static InputDecoration textField({
    required String labelText,
    required IconData prefixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: PunkTextStyles.label.copyWith(
        color: PunkColors.primary.withOpacity(0.8),
      ),
      filled: true,
      fillColor: PunkColors.background,
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      prefixIcon: Icon(prefixIcon, color: PunkColors.primary, size: 24),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: PunkColors.primary, width: 2),
      ),
    );
  }
}

// Button Styles (เหมือน CSS Button Classes)
class PunkButtonStyles {
  static ButtonStyle primary = ElevatedButton.styleFrom(
    backgroundColor: PunkColors.primary,
    foregroundColor: PunkColors.onPrimary,
    minimumSize: const Size(double.infinity, 60),
    padding: EdgeInsets.zero,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    elevation: 0,
  );

  static ButtonStyle secondary = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: PunkColors.onBackground,
    minimumSize: const Size(double.infinity, 60),
    padding: EdgeInsets.zero,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    elevation: 0,
    side: const BorderSide(color: PunkColors.borderWhite, width: 3),
  );
}

// Theme Data (Main Theme Configuration)
class PunkTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: PunkColors.primary,
      scaffoldBackgroundColor: PunkColors.background,

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: PunkColors.primary,
        background: PunkColors.background,
        surface: PunkColors.surface,
        onPrimary: PunkColors.onPrimary,
        onBackground: PunkColors.onBackground,
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: PunkTextStyles.headline1,
        displayMedium: PunkTextStyles.headline2,
        bodyLarge: PunkTextStyles.bodyText,
        labelLarge: PunkTextStyles.label,
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: PunkColors.background,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PunkColors.primary, width: 2),
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: PunkButtonStyles.primary,
      ),
    );
  }
}
