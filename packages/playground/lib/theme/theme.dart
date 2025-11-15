import 'package:flutter/material.dart';

import 'colors.dart';

/// Main theme class - Consolidates all theme values (colors, spacing, radius)
///
/// Uses a relative system where spacing and radius values are multipliers
/// of base units, similar to shadcn's rem-based system.
///
/// **Usage:**
/// ```dart
/// // Access spacing
/// AppTheme.spacing.xs  // 0.25 * baseSpacing
/// context.spacing.xs   // via extension
///
/// // Access radius
/// AppTheme.radius.md   // 2 * baseRadius
/// context.radius.md     // via extension
///
/// // Access colors
/// context.primary       // via extension
/// ```
class AppTheme {
  AppTheme._(); // Private constructor

  // ============================================================================
  // BASE UNITS - Change these to scale the entire design system
  // ============================================================================

  /// All spacing values are multipliers of this base unit
  static const double baseSpacing = 12.0;

  /// Base radius unit
  /// All radius values are multipliers of this base unit
  static const double baseRadius = 2.0;

  // ============================================================================
  // SPACING MULTIPLIERS - Relative to baseSpacing
  // ============================================================================

  /// Spacing values as multipliers of baseSpacing
  /// Similar to shadcn's rem-based spacing system
  static const Spacing spacing = Spacing();

  // ============================================================================
  // RADIUS MULTIPLIERS - Relative to baseRadius
  // ============================================================================

  /// Radius values as multipliers of baseRadius
  static const ThemeRadius radius = ThemeRadius();

  // ============================================================================
  // THEME DATA
  // ============================================================================

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            brightness: Brightness.light,
          ).copyWith(
            primary: AppColors.primary,
            secondary: AppColors.secondary,
            surface: AppColors.background,
            onSurface: AppColors.foreground,
          ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.foreground,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.primaryForeground,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.lg),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: AppColors.primaryDark,
            brightness: Brightness.dark,
          ).copyWith(
            primary: AppColors.primaryDark,
            secondary: AppColors.secondaryDark,
            surface: AppColors.backgroundDark,
            onSurface: AppColors.foregroundDark,
          ),
      scaffoldBackgroundColor: AppColors.backgroundDark,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.foregroundDark,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}

/// Spacing values - All values are multipliers of AppTheme.baseSpacing
///
/// Example: If baseSpacing = 4px, then xs = 0.25 * 4 = 1px
/// To scale spacing globally, just change baseSpacing!
class Spacing {
  const Spacing();

  /// Extra small spacing (0.25x base) - 1px with default base
  double get xs => 0.25 * AppTheme.baseSpacing;

  /// Small spacing (0.5x base) - 2px with default base
  double get sm => 0.5 * AppTheme.baseSpacing;

  /// Medium spacing (1x base) - 4px with default base
  double get md => 1.0 * AppTheme.baseSpacing;

  /// Large spacing (1.5x base) - 6px with default base
  double get lg => 1.5 * AppTheme.baseSpacing;

  /// Extra large spacing (2x base) - 8px with default base
  double get xl => 2.0 * AppTheme.baseSpacing;

  /// 2X large spacing (3x base) - 12px with default base
  double get xxl => 3.0 * AppTheme.baseSpacing;

  /// 3X large spacing (4x base) - 16px with default base
  double get xxxl => 4.0 * AppTheme.baseSpacing;

  /// 4X large spacing (6x base) - 24px with default base
  double get xxxxl => 6.0 * AppTheme.baseSpacing;

  /// 5X large spacing (8x base) - 32px with default base
  double get xxxxxl => 8.0 * AppTheme.baseSpacing;

  /// 6X large spacing (12x base) - 48px with default base
  double get xxxxxxl => 12.0 * AppTheme.baseSpacing;

  /// 7X large spacing (16x base) - 64px with default base
  double get xxxxxxxl => 16.0 * AppTheme.baseSpacing;
}

/// Radius values - All values are multipliers of AppTheme.baseRadius
///
/// Example: If baseRadius = 2px, then md = 2 * 2 = 4px
/// To scale radius globally, just change baseRadius!
class ThemeRadius {
  const ThemeRadius();

  /// No radius (0x base) - 0px
  double get none => 0.0;

  /// Small radius (1x base) - 2px with default base
  double get sm => 1.0 * AppTheme.baseRadius;

  /// Medium radius (2x base) - 4px with default base
  double get md => 2.0 * AppTheme.baseRadius;

  /// Large radius (3x base) - 6px with default base
  double get lg => 3.0 * AppTheme.baseRadius;

  /// Extra large radius (4x base) - 8px with default base (commonly used for cards)
  double get xl => 4.0 * AppTheme.baseRadius;

  /// 2X large radius (6x base) - 12px with default base
  double get xxl => 6.0 * AppTheme.baseRadius;

  /// Full radius - creates a circle/fully rounded shape
  double get full => 9999.0;
}
