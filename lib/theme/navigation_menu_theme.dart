import 'package:flutter/material.dart';

// ============================================================
// วางไว้ที่ lib/theme/navigation_menu_theme.dart
// ============================================================

class NavigationMenuTheme {
  // --- สีหลัก ---
  static const Color primaryColor = Color(0xFF6C5CE7);
  static const Color secondaryColor = Color(0xFFA29BFE);
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color surfaceColor = Colors.white;
  static const Color textPrimary = Color(0xFF2D3436);
  static const Color textSecondary = Color(0xFF636E72);
  static const Color iconColor = Color(0xFF636E72);
  static const Color selectedIconColor = Color(0xFF6C5CE7);

  // --- NavigationBar ThemeData ---
  static NavigationBarThemeData navigationBarThemeData() {
    return NavigationBarThemeData(
      height: 80,
      backgroundColor: surfaceColor,
      // surfaceTint: Colors.transparent,
      indicatorColor: secondaryColor.withValues(alpha: 0.2),
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((
        Set<MaterialState> states,
      ) {
        if (states.contains(MaterialState.selected)) {
          return const TextStyle(
            color: selectedIconColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          );
        }
        return const TextStyle(
          color: textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        );
      }),
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((
        Set<MaterialState> states,
      ) {
        if (states.contains(MaterialState.selected)) {
          return const IconThemeData(color: selectedIconColor, size: 24);
        }
        return const IconThemeData(color: iconColor, size: 24);
      }),
    );
  }

  // --- Card Style ---
  static const double cardBorderRadius = 16.0;
  static const double cardPadding = 16.0;
  static const double cardIconContainerSize = 48.0;
  static const double cardIconContainerRadius = 12.0;
  static const double cardIconSize = 28.0;

  static BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: surfaceColor,
      borderRadius: BorderRadius.circular(cardBorderRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  // --- Text Styles ---
  static const TextStyle titleStyle = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    color: textSecondary,
  );

  static const TextStyle cardNameStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static const TextStyle cardValueStyle = TextStyle(
    fontSize: 14,
    color: textSecondary,
  );

  // --- Detail Page Styles ---
  static const double detailIconContainerSize = 120.0;
  static const double detailIconSize = 64.0;

  static const TextStyle detailTitleStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle detailSectionTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static BoxDecoration detailCardDecoration() {
    return BoxDecoration(
      color: surfaceColor,
      borderRadius: BorderRadius.circular(cardBorderRadius),
    );
  }

  // --- Status Dot ---
  static const double statusDotSize = 8.0;

  // --- Search TextField ---
  static InputDecoration searchInputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: 'Search for devices...',
      hintStyle: const TextStyle(color: textSecondary),
      prefixIcon: const Icon(Icons.search, color: textSecondary),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: surfaceColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  // --- Loading Widget ---
  static Widget loadingIndicator() {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
              strokeWidth: 3,
            ),
            const SizedBox(height: 16),
            const Text(
              'กำลังโล่ด...',
              style: TextStyle(
                color: textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
