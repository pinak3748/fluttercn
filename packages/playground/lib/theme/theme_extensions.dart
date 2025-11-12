import 'package:flutter/material.dart';

import 'colors.dart';

/// Theme extension to easily access shadcn-style color tokens
/// 
/// This extension provides automatic theme-aware color access, similar to how
/// shadcn uses CSS variables. Colors automatically adapt to light/dark theme.
/// 
/// **Usage:**
/// ```dart
/// // Instead of manually checking theme:
/// final isDark = Theme.of(context).brightness == Brightness.dark;
/// final color = isDark ? AppColors.primaryDark : AppColors.primary;
/// 
/// // Simply use:
/// context.primary  // Automatically gets the right color for current theme
/// ```
/// 
/// All colors are automatically theme-aware - no need to manually check
/// for light/dark mode. Just use `context.colorName` and it will return
/// the correct color based on the current theme.
extension FlutterCNTheme on BuildContext {
  /// Get the current brightness (light/dark)
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  // Base colors
  /// Background color - automatically adapts to theme
  Color get background =>
      isDark ? AppColors.backgroundDark : AppColors.background;

  /// Foreground color - automatically adapts to theme
  Color get foreground =>
      isDark ? AppColors.foregroundDark : AppColors.foreground;

  // Card colors
  /// Card background color - automatically adapts to theme
  Color get card => isDark ? AppColors.cardDark : AppColors.card;

  /// Card foreground color - automatically adapts to theme
  Color get cardForeground =>
      isDark ? AppColors.cardForegroundDark : AppColors.cardForeground;

  // Interactive colors
  /// Primary color - automatically adapts to theme
  Color get primary => isDark ? AppColors.primaryDark : AppColors.primary;

  /// Primary foreground color - automatically adapts to theme
  Color get primaryForeground =>
      isDark ? AppColors.primaryForegroundDark : AppColors.primaryForeground;

  /// Secondary color - automatically adapts to theme
  Color get secondary =>
      isDark ? AppColors.secondaryDark : AppColors.secondary;

  /// Secondary foreground color - automatically adapts to theme
  Color get secondaryForeground =>
      isDark
          ? AppColors.secondaryForegroundDark
          : AppColors.secondaryForeground;

  // State colors
  /// Muted color - automatically adapts to theme
  Color get muted => isDark ? AppColors.mutedDark : AppColors.muted;

  /// Muted foreground color - automatically adapts to theme
  Color get mutedForeground =>
      isDark ? AppColors.mutedForegroundDark : AppColors.mutedForeground;

  /// Accent color - automatically adapts to theme
  Color get accent => isDark ? AppColors.accentDark : AppColors.accent;

  /// Accent foreground color - automatically adapts to theme
  Color get accentForeground =>
      isDark ? AppColors.accentForegroundDark : AppColors.accentForeground;

  // Semantic colors
  /// Destructive color - automatically adapts to theme
  Color get destructive =>
      isDark ? AppColors.destructiveDark : AppColors.destructive;

  /// Destructive foreground color - automatically adapts to theme
  Color get destructiveForeground =>
      isDark
          ? AppColors.destructiveForegroundDark
          : AppColors.destructiveForeground;

  // Border and input
  /// Border color - automatically adapts to theme
  Color get border => isDark ? AppColors.borderDark : AppColors.border;

  /// Input border color - automatically adapts to theme
  Color get input => isDark ? AppColors.inputDark : AppColors.input;

  /// Ring/focus color - automatically adapts to theme
  Color get ring => isDark ? AppColors.ringDark : AppColors.ring;

  // Popover colors
  /// Popover background color - automatically adapts to theme
  Color get popover =>
      isDark ? AppColors.popoverDark : AppColors.popover;

  /// Popover foreground color - automatically adapts to theme
  Color get popoverForeground =>
      isDark ? AppColors.popoverForegroundDark : AppColors.popoverForeground;
}
