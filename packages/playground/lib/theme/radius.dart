/// Border radius scale - Compatible with shadcn/ui radius tokens
/// 
/// Use these constants for consistent border radius throughout the app.
/// Similar to shadcn's radius system.
/// 
/// Example:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(AppRadius.md),
///   ),
/// )
/// ```
class AppRadius {
  AppRadius._(); // Private constructor to prevent instantiation

  /// None - no border radius
  static const double none = 0.0;

  /// Small radius (2px)
  static const double sm = 2.0;

  /// Default/Medium radius (4px)
  static const double md = 4.0;

  /// Large radius (6px)
  static const double lg = 6.0;

  /// Extra large radius (8px) - commonly used for cards
  static const double xl = 8.0;

  /// 2X large radius (12px)
  static const double xxl = 12.0;

  /// Full radius - creates a circle/fully rounded shape
  static const double full = 9999.0;
}

