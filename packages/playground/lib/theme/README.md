# FlutterCN Theme System

This theme system is designed to work like shadcn/ui's CSS variable system, adapted for Flutter. It provides automatic theme-aware colors, spacing, and radius constants.

## 🎨 Colors

### Automatic Theme-Aware Access

Colors automatically adapt to the current theme (light/dark). No need to manually check for theme mode!

```dart
// ❌ Don't do this:
final isDark = Theme.of(context).brightness == Brightness.dark;
final color = isDark ? AppColors.primaryDark : AppColors.primary;

// ✅ Do this instead:
context.primary  // Automatically gets the right color for current theme
```

### Available Colors

All colors are accessed through the `BuildContext` extension:

```dart
// Base colors
context.background
context.foreground

// Card colors
context.card
context.cardForeground

// Interactive colors
context.primary
context.primaryForeground
context.secondary
context.secondaryForeground

// State colors
context.muted
context.mutedForeground
context.accent
context.accentForeground

// Semantic colors
context.destructive
context.destructiveForeground

// Border and input
context.border
context.input
context.ring

// Popover colors
context.popover
context.popoverForeground
```

### Example Usage

```dart
Container(
  color: context.card,
  child: Text(
    'Hello',
    style: TextStyle(color: context.cardForeground),
  ),
)
```

## 📐 Spacing

Use `AppSpacing` constants for consistent spacing throughout your app:

```dart
import 'package:flutter_cn_playground/theme/spacing.dart';

// Available spacing values
AppSpacing.xs    // 4px
AppSpacing.sm    // 8px
AppSpacing.md    // 16px
AppSpacing.lg    // 24px
AppSpacing.xl    // 32px
AppSpacing.xxl   // 48px
AppSpacing.xxxl  // 64px
```

### Example Usage

```dart
Padding(
  padding: EdgeInsets.all(AppSpacing.md),
  child: YourWidget(),
)

SizedBox(height: AppSpacing.lg)

EdgeInsets.symmetric(
  horizontal: AppSpacing.lg,
  vertical: AppSpacing.md,
)
```

## 🔲 Radius

Use `AppRadius` constants for consistent border radius:

```dart
import 'package:flutter_cn_playground/theme/radius.dart';

// Available radius values
AppRadius.none   // 0px
AppRadius.sm     // 2px
AppRadius.md     // 4px
AppRadius.lg     // 6px
AppRadius.xl     // 8px (commonly used for cards)
AppRadius.xxl    // 12px
AppRadius.full   // 9999px (fully rounded)
```

### Example Usage

```dart
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(AppRadius.xl),
    color: context.card,
  ),
)

// For fully rounded buttons/avatars
Container(
  decoration: BoxDecoration(
    shape: BoxShape.circle,  // or
    borderRadius: BorderRadius.circular(AppRadius.full),
  ),
)
```

## 🎯 Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_cn_playground/theme/theme_extensions.dart';
import 'package:flutter_cn_playground/theme/spacing.dart';
import 'package:flutter_cn_playground/theme/radius.dart';

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: context.card,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: context.border),
      ),
      child: Column(
        children: [
          Text(
            'Title',
            style: TextStyle(
              color: context.cardForeground,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: AppSpacing.sm),
          Text(
            'Description',
            style: TextStyle(
              color: context.mutedForeground,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
```

## 🔄 Updating Theme Colors

To update theme colors, simply modify the values in `colors.dart`:

```dart
// In colors.dart
class AppColors {
  // Light Theme
  static const Color primary = Color(0xFF171717);  // Change this
  
  // Dark Theme
  static const Color primaryDark = Color(0xFFFAFAFA);  // Change this
}
```

All components using `context.primary` will automatically use the new colors!

## 📝 Key Benefits

1. **Automatic Theme Adaptation**: Colors automatically switch between light/dark
2. **No Manual Theme Checks**: No need to check `isDark` everywhere
3. **Consistent Spacing**: Use spacing constants instead of magic numbers
4. **Consistent Radius**: Use radius constants for uniform border radius
5. **Easy Updates**: Change colors in one place, affects entire app
6. **Type Safe**: Compile-time checks for all values
7. **Similar to shadcn**: Familiar API for developers coming from shadcn/ui

