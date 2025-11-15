# FlutterCN Theme System

This theme system is designed to work like shadcn/ui's CSS variable system, adapted for Flutter. It provides automatic theme-aware colors, relative spacing, and relative radius constants - all consolidated under `AppTheme`.

## 🎯 Key Features

- **Relative System**: Spacing and radius values are multipliers of base units (like shadcn's rem system)
- **Consolidated**: Everything is under `AppTheme` - no separate classes
- **Automatic Theme Adaptation**: Colors automatically switch between light/dark
- **Easy Scaling**: Change base units to scale the entire design system

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

## 📐 Spacing (Relative System)

Spacing values are **multipliers** of `AppTheme.baseSpacing` (default: 4px). This means you can scale all spacing globally by changing just the base value!

### Base Unit

```dart
AppTheme.baseSpacing  // Default: 4px
```

### Spacing Values

All spacing values are relative to the base:

```dart
// Via context extension (recommended)
context.spacing.xs     // 0.25x base = 1px (with default base)
context.spacing.sm     // 0.5x base = 2px
context.spacing.md     // 1x base = 4px
context.spacing.lg     // 1.5x base = 6px
context.spacing.xl     // 2x base = 8px
context.spacing.xxl    // 3x base = 12px
context.spacing.xxxl   // 4x base = 16px
context.spacing.xxxxl  // 6x base = 24px
context.spacing.xxxxxl // 8x base = 32px
context.spacing.xxxxxxl // 12x base = 48px
context.spacing.xxxxxxxl // 16x base = 64px

// Or directly from AppTheme
AppTheme.spacing.md
```

### Example Usage

```dart
Padding(
  padding: EdgeInsets.all(context.spacing.md),
  child: YourWidget(),
)

SizedBox(height: context.spacing.lg)

EdgeInsets.symmetric(
  horizontal: context.spacing.lg,
  vertical: context.spacing.md,
)
```

### Scaling Spacing Globally

To make spacing tighter or looser globally, just change the base:

```dart
// In theme.dart
static const double baseSpacing = 3.0;  // Tighter spacing
// or
static const double baseSpacing = 5.0;  // Looser spacing
```

All spacing values will automatically scale!

## 🔲 Radius (Relative System)

Radius values are **multipliers** of `AppTheme.baseRadius` (default: 2px). Scale all radius globally by changing just the base value!

### Base Unit

```dart
AppTheme.baseRadius  // Default: 2px
```

### Radius Values

All radius values are relative to the base:

```dart
// Via context extension (recommended)
context.radius.none  // 0px
context.radius.sm    // 1x base = 2px (with default base)
context.radius.md    // 2x base = 4px
context.radius.lg    // 3x base = 6px
context.radius.xl    // 4x base = 8px (commonly used for cards)
context.radius.xxl   // 6x base = 12px
context.radius.full  // 9999px (fully rounded)

// Or directly from AppTheme
AppTheme.radius.xl
```

### Example Usage

```dart
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(context.radius.xl),
    color: context.card,
  ),
)

// For fully rounded buttons/avatars
Container(
  decoration: BoxDecoration(
    shape: BoxShape.circle,  // or
    borderRadius: BorderRadius.circular(context.radius.full),
  ),
)
```

### Scaling Radius Globally

To make radius tighter or looser globally, just change the base:

```dart
// In theme.dart
static const double baseRadius = 1.5;  // Tighter radius
// or
static const double baseRadius = 3.0;  // Looser radius
```

All radius values will automatically scale!

## 🎯 Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_cn_playground/theme/theme_extensions.dart';

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.spacing.lg),
      decoration: BoxDecoration(
        color: context.card,
        borderRadius: BorderRadius.circular(context.radius.xl),
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
          SizedBox(height: context.spacing.sm),
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

## 🔄 Updating Theme

### Updating Colors

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

### Scaling Spacing Globally

Change `AppTheme.baseSpacing` in `theme.dart`:

```dart
// Tighter spacing
static const double baseSpacing = 3.0;

// Looser spacing
static const double baseSpacing = 5.0;
```

### Scaling Radius Globally

Change `AppTheme.baseRadius` in `theme.dart`:

```dart
// Tighter radius
static const double baseRadius = 1.5;

// Looser radius
static const double baseRadius = 3.0;
```

## 📝 Key Benefits

1. **Relative System**: Like shadcn's rem-based system - change base, everything scales
2. **Consolidated**: Everything under `AppTheme` - no separate classes
3. **Automatic Theme Adaptation**: Colors automatically switch between light/dark
4. **No Manual Theme Checks**: No need to check `isDark` everywhere
5. **Easy Scaling**: Change base units to scale entire design system
6. **Type Safe**: Compile-time checks for all values
7. **Similar to shadcn**: Familiar API for developers coming from shadcn/ui

## 🎨 Architecture

```
AppTheme
├── baseSpacing (4px) - Base unit for all spacing
├── baseRadius (2px) - Base unit for all radius
├── spacing - Spacing values (xs, sm, md, lg, etc.)
├── radius - Radius values (sm, md, lg, xl, etc.)
├── lightTheme - Light theme ThemeData
└── darkTheme - Dark theme ThemeData

Context Extension
├── spacing - Access AppTheme.spacing
├── radius - Access AppTheme.radius
└── colors - Automatic theme-aware color access
```
