/// Spacing scale - Compatible with shadcn/ui spacing tokens
/// 
/// Use these constants for consistent spacing throughout the app.
/// Similar to shadcn's spacing system using rem units.
/// 
/// Example:
/// ```dart
/// Padding(
///   padding: EdgeInsets.all(AppSpacing.md),
///   child: YourWidget(),
/// )
/// ```
class AppSpacing {
  AppSpacing._(); // Private constructor to prevent instantiation

  /// Extra small spacing (0.25rem / 4px)
  static const double xs = 4.0;

  /// Small spacing (0.5rem / 8px)
  static const double sm = 8.0;

  /// Medium spacing (1rem / 16px)
  static const double md = 16.0;

  /// Large spacing (1.5rem / 24px)
  static const double lg = 24.0;

  /// Extra large spacing (2rem / 32px)
  static const double xl = 32.0;

  /// 2X large spacing (3rem / 48px)
  static const double xxl = 48.0;

  /// 3X large spacing (4rem / 64px)
  static const double xxxl = 64.0;
}

