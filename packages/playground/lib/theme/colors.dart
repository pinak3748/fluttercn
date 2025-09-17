import 'package:flutter/material.dart';

/// Color System - Compatible with shadcn/ui color tokens
class AppColors {
  // Light Theme Colors
  static const Color background = Color(0xFFFFFFFF); // --background
  static const Color foreground = Color(0xFF0A0A0A); // --foreground
  static const Color card = Color(0xFFFFFFFF); // --card
  static const Color cardForeground = Color(0xFF0A0A0A); // --card-foreground
  static const Color popover = Color(0xFFFFFFFF); // --popover
  static const Color popoverForeground = Color(
    0xFF0A0A0A,
  ); // --popover-foreground

  // Interactive colors
  static const Color primary = Color(0xFF171717); // --primary
  static const Color primaryForeground = Color(
    0xFFFAFAFA,
  ); // --primary-foreground
  static const Color secondary = Color(0xFFF5F5F5); // --secondary
  static const Color secondaryForeground = Color(
    0xFF171717,
  ); // --secondary-foreground

  // State colors
  static const Color muted = Color(0xFFF5F5F5); // --muted
  static const Color mutedForeground = Color(0xFF737373); // --muted-foreground
  static const Color accent = Color(0xFFF5F5F5); // --accent
  static const Color accentForeground = Color(
    0xFF171717,
  ); // --accent-foreground

  // Semantic colors
  static const Color destructive = Color(0xFFEF4444); // --destructive
  static const Color destructiveForeground = Color(
    0xFFFEF2F2,
  ); // --destructive-foreground

  // Border and input
  static const Color border = Color(0xFFE5E5E5); // --border
  static const Color input = Color(0xFFE5E5E5); // --input
  static const Color ring = Color(0xFF171717); // --ring

  // Dark Theme Colors
  static const Color backgroundDark = Color(0xFF0A0A0A);
  static const Color foregroundDark = Color(0xFFFAFAFA);
  static const Color cardDark = Color(0xFF0A0A0A);
  static const Color cardForegroundDark = Color(0xFFFAFAFA);
  static const Color popoverDark = Color(0xFF0A0A0A);
  static const Color popoverForegroundDark = Color(0xFFFAFAFA);

  static const Color primaryDark = Color(0xFFFAFAFA);
  static const Color primaryForegroundDark = Color(0xFF171717);
  static const Color secondaryDark = Color(0xFF262626);
  static const Color secondaryForegroundDark = Color(0xFFFAFAFA);

  static const Color mutedDark = Color(0xFF262626);
  static const Color mutedForegroundDark = Color(0xFFA3A3A3);
  static const Color accentDark = Color(0xFF262626);
  static const Color accentForegroundDark = Color(0xFFFAFAFA);

  static const Color destructiveDark = Color(0xFF7F1D1D);
  static const Color destructiveForegroundDark = Color(0xFFFEF2F2);

  static const Color borderDark = Color(0xFF262626);
  static const Color inputDark = Color(0xFF262626);
  static const Color ringDark = Color(0xFFD4D4D8);
}
