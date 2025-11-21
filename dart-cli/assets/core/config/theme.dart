import 'dart:io';

import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════
// CORE COLORS - Shared across themes
// ═══════════════════════════════════════════════════════════════

class CoreColors {
  static const Color primary = Color(0xFF000000);
  static const Color primaryDark = Color(0xFF000000);
  static const Color primaryLight = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFF5F5F5);

  static const Color secondary = Color(0xFFF4F4F5);
  static const Color secondaryDark = Color(0xFF27272A);
  static const Color secondaryLight = Color(0xFFFAFAFA);
  static const Color secondaryContainer = Color(0xFFF5F5F5);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFFD1FAE5);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFFDBEAFE);
}

// ═══════════════════════════════════════════════════════════════
// LIGHT THEME COLORS
// ═══════════════════════════════════════════════════════════════

class LightColors {
  static const Color primary = Color(0xFF000000);
  static const Color secondary = Color(0xFF727272);

  static const Color textPrimary = Color(0xFF171717);
  static const Color textSecondary = Color(0xFF525252);
  static const Color textTertiary = Color(0xFF737373);
  static const Color textDisabled = Color(0xFFA3A3A3);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFF171717);

  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);
  static const Color surfaceContainer = Color(0xFFF0F0F0);

  static const Color border = Color.fromARGB(255, 234, 234, 234);
  static const Color borderLight = Color(0xFFF5F5F5);
  static const Color borderFocus = Color(0xFF000000);

  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFE5E5E5);
  static const Color gray300 = Color(0xFFD4D4D4);
  static const Color gray400 = Color(0xFFA3A3A3);
  static const Color gray500 = Color(0xFF737373);
  static const Color gray600 = Color(0xFF525252);
  static const Color gray700 = Color(0xFF404040);
  static const Color gray800 = Color(0xFF262626);
  static const Color gray900 = Color(0xFF171717);
  static const Color gray950 = Color(0xFF0A0A0A);
}

// ═══════════════════════════════════════════════════════════════
// DARK THEME COLORS
// ═══════════════════════════════════════════════════════════════

class DarkColors {
  static const Color primary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF27272A);

  static const Color textPrimary = Color(0xFFFAFAFA);
  static const Color textSecondary = Color(0xFFD4D4D4);
  static const Color textTertiary = Color(0xFFA3A3A3);
  static const Color textDisabled = Color(0xFF737373);
  static const Color textOnPrimary = Color(0xFF171717);
  static const Color textOnSecondary = Color(0xFFFFFFFF);

  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color surfaceVariant = Color(0xFF2C2C2C);
  static const Color surfaceContainer = Color(0xFF333333);

  static const Color border = Color.fromARGB(255, 44, 44, 44);
  static const Color borderLight = Color(0xFF2C2C2C);
  static const Color borderFocus = Color(0xFFFFFFFF);

  static const Color gray50 = Color(0xFF121212);
  static const Color gray100 = Color(0xFF1E1E1E);
  static const Color gray200 = Color(0xFF2C2C2C);
  static const Color gray300 = Color(0xFF333333);
  static const Color gray400 = Color(0xFF3A3A3A);
  static const Color gray500 = Color(0xFF737373);
  static const Color gray600 = Color(0xFFA3A3A3);
  static const Color gray700 = Color(0xFFD4D4D4);
  static const Color gray800 = Color(0xFFE5E5E5);
  static const Color gray900 = Color(0xFFF5F5F5);
  static const Color gray950 = Color(0xFFFFFFFF);
}

// ═══════════════════════════════════════════════════════════════
// THEME HELPER - Provides current theme colors
// ═══════════════════════════════════════════════════════════════

class ThemeColors {
  static bool _isDarkMode = false;

  static void setDarkMode(bool isDark) {
    _isDarkMode = isDark;
  }

  static Color get primary =>
      _isDarkMode ? DarkColors.primary : LightColors.primary;
  static Color get secondary =>
      _isDarkMode ? DarkColors.secondary : LightColors.secondary;

  static Color get textPrimary =>
      _isDarkMode ? DarkColors.textPrimary : LightColors.textPrimary;
  static Color get textSecondary =>
      _isDarkMode ? DarkColors.textSecondary : LightColors.textSecondary;
  static Color get textTertiary =>
      _isDarkMode ? DarkColors.textTertiary : LightColors.textTertiary;
  static Color get textDisabled =>
      _isDarkMode ? DarkColors.textDisabled : LightColors.textDisabled;
  static Color get textOnPrimary =>
      _isDarkMode ? DarkColors.textOnPrimary : LightColors.textOnPrimary;
  static Color get textOnSecondary =>
      _isDarkMode ? DarkColors.textOnSecondary : LightColors.textOnSecondary;

  static Color get background =>
      _isDarkMode ? DarkColors.background : LightColors.background;
  static Color get surface =>
      _isDarkMode ? DarkColors.surface : LightColors.surface;
  static Color get surfaceVariant =>
      _isDarkMode ? DarkColors.surfaceVariant : LightColors.surfaceVariant;
  static Color get surfaceContainer =>
      _isDarkMode ? DarkColors.surfaceContainer : LightColors.surfaceContainer;

  static Color get border =>
      _isDarkMode ? DarkColors.border : LightColors.border;
  static Color get borderLight =>
      _isDarkMode ? DarkColors.borderLight : LightColors.borderLight;
  static Color get borderFocus =>
      _isDarkMode ? DarkColors.borderFocus : LightColors.borderFocus;

  static Color get gray50 =>
      _isDarkMode ? DarkColors.gray50 : LightColors.gray50;
  static Color get gray100 =>
      _isDarkMode ? DarkColors.gray100 : LightColors.gray100;
  static Color get gray200 =>
      _isDarkMode ? DarkColors.gray200 : LightColors.gray200;
  static Color get gray300 =>
      _isDarkMode ? DarkColors.gray300 : LightColors.gray300;
  static Color get gray400 =>
      _isDarkMode ? DarkColors.gray400 : LightColors.gray400;
  static Color get gray500 =>
      _isDarkMode ? DarkColors.gray500 : LightColors.gray500;
  static Color get gray600 =>
      _isDarkMode ? DarkColors.gray600 : LightColors.gray600;
  static Color get gray700 =>
      _isDarkMode ? DarkColors.gray700 : LightColors.gray700;
  static Color get gray800 =>
      _isDarkMode ? DarkColors.gray800 : LightColors.gray800;
  static Color get gray900 =>
      _isDarkMode ? DarkColors.gray900 : LightColors.gray900;
  static Color get gray950 =>
      _isDarkMode ? DarkColors.gray950 : LightColors.gray950;
}

class AppTheme {
  static void initializeTheme(bool isDarkMode) {
    ThemeColors.setDarkMode(isDarkMode);
  }

  static Color get primary => ThemeColors.primary;
  static Color get primaryDark => CoreColors.primaryDark;
  static Color get primaryLight => CoreColors.primaryLight;
  static Color get primaryContainer => CoreColors.primaryContainer;

  static Color get secondary => ThemeColors.secondary;
  static Color get secondaryDark => CoreColors.secondaryDark;
  static Color get secondaryLight => CoreColors.secondaryLight;
  static Color get secondaryContainer => CoreColors.secondaryContainer;

  static Color get white => CoreColors.white;
  static Color get black => CoreColors.black;

  static Color get success => CoreColors.success;
  static Color get successLight => CoreColors.successLight;
  static Color get warning => CoreColors.warning;
  static Color get warningLight => CoreColors.warningLight;
  static Color get error => CoreColors.error;
  static Color get errorLight => CoreColors.errorLight;
  static Color get info => CoreColors.info;
  static Color get infoLight => CoreColors.infoLight;

  static Color get textPrimary => ThemeColors.textPrimary;
  static Color get textSecondary => ThemeColors.textSecondary;
  static Color get textTertiary => ThemeColors.textTertiary;
  static Color get textDisabled => ThemeColors.textDisabled;
  static Color get textOnPrimary => ThemeColors.textOnPrimary;
  static Color get textOnSecondary => ThemeColors.textOnSecondary;

  static Color get background => ThemeColors.background;
  static Color get surface => ThemeColors.surface;
  static Color get surfaceVariant => ThemeColors.surfaceVariant;
  static Color get surfaceContainer => ThemeColors.surfaceContainer;

  static Color get border => ThemeColors.border;
  static Color get borderLight => ThemeColors.borderLight;
  static Color get borderFocus => ThemeColors.borderFocus;

  static Color get gray50 => ThemeColors.gray50;
  static Color get gray100 => ThemeColors.gray100;
  static Color get gray200 => ThemeColors.gray200;
  static Color get gray300 => ThemeColors.gray300;
  static Color get gray400 => ThemeColors.gray400;
  static Color get gray500 => ThemeColors.gray500;
  static Color get gray600 => ThemeColors.gray600;
  static Color get gray700 => ThemeColors.gray700;
  static Color get gray800 => ThemeColors.gray800;
  static Color get gray900 => ThemeColors.gray900;
  static Color get gray950 => ThemeColors.gray950;

  static String get fontFamily {
    if (Platform.isIOS) {
      return '-apple-system';
    } else if (Platform.isAndroid) {
      return 'Roboto';
    }
    return 'system-ui';
  }

  static String get fontFamilyDisplay {
    if (Platform.isIOS) {
      return '-apple-system';
    } else if (Platform.isAndroid) {
      return 'Roboto';
    }
    return 'system-ui';
  }

  static String get fontFamilyBody {
    if (Platform.isIOS) {
      return '-apple-system';
    } else if (Platform.isAndroid) {
      return 'Roboto';
    }
    return 'system-ui';
  }

  static const double fontSizeXs = 10.0;
  static const double fontSizeSm = 12.0;
  static const double fontSizeMd = 14.0;
  static const double fontSizeLg = 16.0;
  static const double fontSizeXl = 18.0;
  static const double fontSize2xl = 20.0;
  static const double fontSize3xl = 24.0;
  static const double fontSize4xl = 28.0;
  static const double fontSize5xl = 32.0;
  static const double fontSize6xl = 36.0;
  static const double fontSize7xl = 48.0;
  static const double fontSize8xl = 64.0;
  static const double fontSize9xl = 72.0;

  static const double lineHeightTight = 1.2;
  static const double lineHeightSnug = 1.3;
  static const double lineHeightNormal = 1.4;
  static const double lineHeightRelaxed = 1.6;
  static const double lineHeightLoose = 1.8;

  static const FontWeight fontWeightThin = FontWeight.w100;
  static const FontWeight fontWeightExtraLight = FontWeight.w200;
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;
  static const FontWeight fontWeightExtraBold = FontWeight.w800;
  static const FontWeight fontWeightBlack = FontWeight.w900;

  static TextStyle get displayLarge => TextStyle(
    fontSize: fontSize5xl,
    fontWeight: fontWeightBold,
    height: lineHeightTight,
    fontFamily: fontFamilyDisplay,
    letterSpacing: -0.5,
  );

  static TextStyle get displayMedium => TextStyle(
    fontSize: fontSize4xl,
    fontWeight: fontWeightBold,
    height: lineHeightTight,
    fontFamily: fontFamilyDisplay,
    letterSpacing: -0.3,
  );

  static TextStyle get displaySmall => TextStyle(
    fontSize: fontSize3xl,
    fontWeight: fontWeightBold,
    height: lineHeightTight,
    fontFamily: fontFamilyDisplay,
    letterSpacing: -0.2,
  );

  static TextStyle get headlineLarge => TextStyle(
    fontSize: fontSize2xl,
    fontWeight: fontWeightSemiBold,
    height: lineHeightSnug,
    fontFamily: fontFamilyDisplay,
  );

  static TextStyle get headlineMedium => TextStyle(
    fontSize: fontSizeXl,
    fontWeight: fontWeightSemiBold,
    height: lineHeightSnug,
    fontFamily: fontFamilyDisplay,
  );

  static TextStyle get headlineSmall => TextStyle(
    fontSize: fontSizeLg,
    fontWeight: fontWeightSemiBold,
    height: lineHeightNormal,
    fontFamily: fontFamilyDisplay,
  );

  // Title Styles - For card titles and labels
  static TextStyle get titleLarge => TextStyle(
    fontSize: fontSizeLg,
    fontWeight: fontWeightMedium,
    height: lineHeightNormal,
    fontFamily: fontFamilyBody,
  );

  static TextStyle get titleMedium => TextStyle(
    fontSize: fontSizeMd,
    fontWeight: fontWeightMedium,
    height: lineHeightNormal,
    fontFamily: fontFamilyBody,
  );

  static TextStyle get titleSmall => TextStyle(
    fontSize: fontSizeSm,
    fontWeight: fontWeightMedium,
    height: lineHeightNormal,
    fontFamily: fontFamilyBody,
  );

  static TextStyle get bodyLarge => TextStyle(
    fontSize: fontSizeLg,
    fontWeight: fontWeightRegular,
    height: lineHeightRelaxed,
    fontFamily: fontFamilyBody,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontSize: fontSizeMd,
    fontWeight: fontWeightRegular,
    height: lineHeightRelaxed,
    fontFamily: fontFamilyBody,
  );

  static TextStyle get bodySmall => TextStyle(
    fontSize: fontSizeSm,
    fontWeight: fontWeightRegular,
    height: lineHeightRelaxed,
    fontFamily: fontFamilyBody,
  );

  static TextStyle get labelLarge => TextStyle(
    fontSize: fontSizeMd,
    fontWeight: fontWeightMedium,
    height: lineHeightNormal,
    fontFamily: fontFamilyBody,
  );

  static TextStyle get labelMedium => TextStyle(
    fontSize: fontSizeSm,
    fontWeight: fontWeightMedium,
    height: lineHeightNormal,
    fontFamily: fontFamilyBody,
  );

  static TextStyle get labelSmall => TextStyle(
    fontSize: fontSizeXs,
    fontWeight: fontWeightMedium,
    height: lineHeightNormal,
    fontFamily: fontFamilyBody,
  );

  static const double spaceXs = 4.0;
  static const double spaceSm = 8.0;
  static const double spaceMd = 12.0;
  static const double spaceLg = 16.0;
  static const double spaceXl = 20.0;
  static const double space2xl = 24.0;
  static const double space3xl = 32.0;
  static const double space4xl = 40.0;
  static const double space5xl = 48.0;
  static const double space6xl = 64.0;
  static const double space7xl = 80.0;
  static const double space8xl = 96.0;

  static const EdgeInsets paddingXs = EdgeInsets.all(spaceXs);
  static const EdgeInsets paddingSm = EdgeInsets.all(spaceSm);
  static const EdgeInsets paddingMd = EdgeInsets.all(spaceMd);
  static const EdgeInsets paddingLg = EdgeInsets.all(spaceLg);
  static const EdgeInsets paddingXl = EdgeInsets.all(spaceXl);
  static const EdgeInsets padding2xl = EdgeInsets.all(space2xl);
  static const EdgeInsets padding3xl = EdgeInsets.all(space3xl);
  static const EdgeInsets padding4xl = EdgeInsets.all(space4xl);

  // Horizontal Padding
  static const EdgeInsets paddingHorizontalXs = EdgeInsets.symmetric(
    horizontal: spaceXs,
  );
  static const EdgeInsets paddingHorizontalSm = EdgeInsets.symmetric(
    horizontal: spaceSm,
  );
  static const EdgeInsets paddingHorizontalMd = EdgeInsets.symmetric(
    horizontal: spaceMd,
  );
  static const EdgeInsets paddingHorizontalLg = EdgeInsets.symmetric(
    horizontal: spaceLg,
  );
  static const EdgeInsets paddingHorizontalXl = EdgeInsets.symmetric(
    horizontal: spaceXl,
  );
  static const EdgeInsets paddingHorizontal2xl = EdgeInsets.symmetric(
    horizontal: space2xl,
  );

  // Vertical Padding
  static const EdgeInsets paddingVerticalXs = EdgeInsets.symmetric(
    vertical: spaceXs,
  );
  static const EdgeInsets paddingVerticalSm = EdgeInsets.symmetric(
    vertical: spaceSm,
  );
  static const EdgeInsets paddingVerticalMd = EdgeInsets.symmetric(
    vertical: spaceMd,
  );
  static const EdgeInsets paddingVerticalLg = EdgeInsets.symmetric(
    vertical: spaceLg,
  );
  static const EdgeInsets paddingVerticalXl = EdgeInsets.symmetric(
    vertical: spaceXl,
  );
  static const EdgeInsets paddingVertical2xl = EdgeInsets.symmetric(
    vertical: space2xl,
  );

  static const Widget gapXs = SizedBox(width: spaceXs, height: spaceXs);
  static const Widget gapSm = SizedBox(width: spaceSm, height: spaceSm);
  static const Widget gapMd = SizedBox(width: spaceMd, height: spaceMd);
  static const Widget gapLg = SizedBox(width: spaceLg, height: spaceLg);
  static const Widget gapXl = SizedBox(width: spaceXl, height: spaceXl);
  static const Widget gap2xl = SizedBox(width: space2xl, height: space2xl);
  static const Widget gap3xl = SizedBox(width: space3xl, height: space3xl);
  static const Widget gap4xl = SizedBox(width: space4xl, height: space4xl);

  static const Widget gapHorizontalXs = SizedBox(width: spaceXs);
  static const Widget gapHorizontalSm = SizedBox(width: spaceSm);
  static const Widget gapHorizontalMd = SizedBox(width: spaceMd);
  static const Widget gapHorizontalLg = SizedBox(width: spaceLg);
  static const Widget gapHorizontalXl = SizedBox(width: spaceXl);
  static const Widget gapHorizontal2xl = SizedBox(width: space2xl);

  static const Widget gapVerticalXs = SizedBox(height: spaceXs);
  static const Widget gapVerticalSm = SizedBox(height: spaceSm);
  static const Widget gapVerticalMd = SizedBox(height: spaceMd);
  static const Widget gapVerticalLg = SizedBox(height: spaceLg);
  static const Widget gapVerticalXl = SizedBox(height: spaceXl);
  static const Widget gapVertical2xl = SizedBox(height: space2xl);
  static const Widget gapVertical3xl = SizedBox(height: space3xl);
  static const Widget gapVertical4xl = SizedBox(height: space4xl);

  static const double radiusXs = 4.0;
  static const double radiusSm = 6.0;
  static const double radiusMd = 8.0;
  static const double radiusLg = 12.0;
  static const double radiusXl = 16.0;
  static const double radius2xl = 20.0;
  static const double radius3xl = 24.0;
  static const double radius4xl = 32.0;
  static const double radiusFull = 9999.0;

  static const BorderRadius borderRadiusXs = BorderRadius.all(
    Radius.circular(radiusXs),
  );
  static const BorderRadius borderRadiusSm = BorderRadius.all(
    Radius.circular(radiusSm),
  );
  static const BorderRadius borderRadiusMd = BorderRadius.all(
    Radius.circular(radiusMd),
  );
  static const BorderRadius borderRadiusLg = BorderRadius.all(
    Radius.circular(radiusLg),
  );
  static const BorderRadius borderRadiusXl = BorderRadius.all(
    Radius.circular(radiusXl),
  );
  static const BorderRadius borderRadius2xl = BorderRadius.all(
    Radius.circular(radius2xl),
  );
  static const BorderRadius borderRadius3xl = BorderRadius.all(
    Radius.circular(radius3xl),
  );
  static const BorderRadius borderRadius4xl = BorderRadius.all(
    Radius.circular(radius4xl),
  );
  static const BorderRadius borderRadiusFull = BorderRadius.all(
    Radius.circular(radiusFull),
  );

  static const double elevationNone = 0.0;
  static const double elevationSm = 1.0;
  static const double elevationMd = 2.0;
  static const double elevationLg = 4.0;
  static const double elevationXl = 8.0;
  static const double elevation2xl = 12.0;

  static const List<BoxShadow> shadowSm = [
    BoxShadow(
      color: Color(0x08000000),
      blurRadius: 2,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> shadowMd = [
    BoxShadow(
      color: Color(0x0C000000),
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: -1,
    ),
  ];

  static const List<BoxShadow> shadowLg = [
    BoxShadow(
      color: Color(0x10000000),
      blurRadius: 8,
      offset: Offset(0, 4),
      spreadRadius: -2,
    ),
  ];

  static const List<BoxShadow> shadowXl = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 16,
      offset: Offset(0, 8),
      spreadRadius: -4,
    ),
  ];

  static const List<BoxShadow> lightShadowSm = [
    BoxShadow(
      color: Color(0x06000000),
      blurRadius: 2,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> lightShadowMd = [
    BoxShadow(
      color: Color(0x08000000),
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: -1,
    ),
  ];

  static const List<BoxShadow> darkShadowSm = [
    BoxShadow(
      color: Color(0x20000000),
      blurRadius: 2,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> darkShadowMd = [
    BoxShadow(
      color: Color(0x30000000),
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: -1,
    ),
  ];

  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);

  static const Curve curveEaseIn = Curves.easeIn;
  static const Curve curveEaseOut = Curves.easeOut;
  static const Curve curveEaseInOut = Curves.easeInOut;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: LightColors.primary,
        onPrimary: LightColors.textOnPrimary,
        secondary: LightColors.secondary,
        onSecondary: LightColors.textOnSecondary,
        surface: LightColors.surface,
        onSurface: LightColors.textPrimary,
        background: LightColors.background,
        onBackground: LightColors.textPrimary,
        error: CoreColors.error,
        onError: CoreColors.white,
        outline: LightColors.border,
        outlineVariant: LightColors.borderLight,
        surfaceContainerHighest: LightColors.surfaceContainer,
      ),
      textTheme: TextTheme(
        displayLarge: displayLarge.copyWith(color: LightColors.textPrimary),
        displayMedium: displayMedium.copyWith(color: LightColors.textPrimary),
        displaySmall: displaySmall.copyWith(color: LightColors.textPrimary),
        headlineLarge: headlineLarge.copyWith(color: LightColors.textPrimary),
        headlineMedium: headlineMedium.copyWith(color: LightColors.textPrimary),
        headlineSmall: headlineSmall.copyWith(color: LightColors.textPrimary),
        titleLarge: titleLarge.copyWith(color: LightColors.textPrimary),
        titleMedium: titleMedium.copyWith(color: LightColors.textPrimary),
        titleSmall: titleSmall.copyWith(color: LightColors.textPrimary),
        bodyLarge: bodyLarge.copyWith(color: LightColors.textPrimary),
        bodyMedium: bodyMedium.copyWith(color: LightColors.textSecondary),
        bodySmall: bodySmall.copyWith(color: LightColors.textTertiary),
        labelLarge: labelLarge.copyWith(color: LightColors.textPrimary),
        labelMedium: labelMedium.copyWith(color: LightColors.textSecondary),
        labelSmall: labelSmall.copyWith(color: LightColors.textTertiary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightColors.primary,
          foregroundColor: LightColors.textOnPrimary,
          padding: paddingHorizontalLg.add(paddingVerticalMd),
          shape: RoundedRectangleBorder(borderRadius: borderRadiusLg),
          elevation: elevationSm,
          textStyle: labelLarge,
          shadowColor: Colors.transparent,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: LightColors.primary,
          padding: paddingHorizontalLg.add(paddingVerticalMd),
          shape: RoundedRectangleBorder(borderRadius: borderRadiusLg),
          side: const BorderSide(color: LightColors.border, width: 1),
          textStyle: labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: LightColors.primary,
          padding: paddingHorizontalLg.add(paddingVerticalMd),
          shape: RoundedRectangleBorder(borderRadius: borderRadiusLg),
          textStyle: labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: LightColors.surface,
        border: OutlineInputBorder(
          borderRadius: borderRadiusLg,
          borderSide: const BorderSide(color: LightColors.border, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadiusLg,
          borderSide: const BorderSide(color: LightColors.border, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadiusLg,
          borderSide: const BorderSide(
            color: LightColors.borderFocus,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadiusLg,
          borderSide: const BorderSide(color: CoreColors.error, width: 1),
        ),
        contentPadding: paddingLg,
        labelStyle: labelLarge.copyWith(color: LightColors.textSecondary),
        hintStyle: bodyMedium.copyWith(color: LightColors.textDisabled),
      ),
      cardTheme: CardThemeData(
        color: LightColors.surface,
        elevation: elevationSm,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadiusXl,
          side: const BorderSide(color: LightColors.borderLight, width: 1),
        ),
        margin: paddingMd,
        shadowColor: Colors.transparent,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: LightColors.background,
        foregroundColor: LightColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: headlineSmall.copyWith(color: LightColors.textPrimary),
        shadowColor: Colors.transparent,
      ),
      scaffoldBackgroundColor: LightColors.background,
      dividerTheme: const DividerThemeData(
        color: LightColors.border,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: DarkColors.primary,
        onPrimary: DarkColors.textOnPrimary,
        secondary: DarkColors.secondary,
        onSecondary: DarkColors.textOnSecondary,
        surface: DarkColors.surface,
        onSurface: DarkColors.textPrimary,
        background: DarkColors.background,
        onBackground: DarkColors.textPrimary,
        error: CoreColors.error,
        onError: CoreColors.white,
        outline: DarkColors.border,
        outlineVariant: DarkColors.borderLight,
        surfaceContainerHighest: DarkColors.surfaceContainer,
      ),
      textTheme: TextTheme(
        displayLarge: displayLarge.copyWith(color: DarkColors.textPrimary),
        displayMedium: displayMedium.copyWith(color: DarkColors.textPrimary),
        displaySmall: displaySmall.copyWith(color: DarkColors.textPrimary),
        headlineLarge: headlineLarge.copyWith(color: DarkColors.textPrimary),
        headlineMedium: headlineMedium.copyWith(color: DarkColors.textPrimary),
        headlineSmall: headlineSmall.copyWith(color: DarkColors.textPrimary),
        titleLarge: titleLarge.copyWith(color: DarkColors.textPrimary),
        titleMedium: titleMedium.copyWith(color: DarkColors.textPrimary),
        titleSmall: titleSmall.copyWith(color: DarkColors.textPrimary),
        bodyLarge: bodyLarge.copyWith(color: DarkColors.textPrimary),
        bodyMedium: bodyMedium.copyWith(color: DarkColors.textSecondary),
        bodySmall: bodySmall.copyWith(color: DarkColors.textTertiary),
        labelLarge: labelLarge.copyWith(color: DarkColors.textPrimary),
        labelMedium: labelMedium.copyWith(color: DarkColors.textSecondary),
        labelSmall: labelSmall.copyWith(color: DarkColors.textTertiary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DarkColors.primary,
          foregroundColor: DarkColors.textOnPrimary,
          padding: paddingHorizontalLg.add(paddingVerticalMd),
          shape: RoundedRectangleBorder(borderRadius: borderRadiusLg),
          elevation: elevationSm,
          textStyle: labelLarge,
          shadowColor: Colors.transparent,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: DarkColors.primary,
          padding: paddingHorizontalLg.add(paddingVerticalMd),
          shape: RoundedRectangleBorder(borderRadius: borderRadiusLg),
          side: const BorderSide(color: DarkColors.border, width: 1),
          textStyle: labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: DarkColors.primary,
          padding: paddingHorizontalLg.add(paddingVerticalMd),
          shape: RoundedRectangleBorder(borderRadius: borderRadiusLg),
          textStyle: labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DarkColors.surface,
        border: OutlineInputBorder(
          borderRadius: borderRadiusLg,
          borderSide: const BorderSide(color: DarkColors.border, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadiusLg,
          borderSide: const BorderSide(color: DarkColors.border, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadiusLg,
          borderSide: const BorderSide(color: DarkColors.borderFocus, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadiusLg,
          borderSide: const BorderSide(color: CoreColors.error, width: 1),
        ),
        contentPadding: paddingLg,
        labelStyle: labelLarge.copyWith(color: DarkColors.textSecondary),
        hintStyle: bodyMedium.copyWith(color: DarkColors.textDisabled),
      ),
      cardTheme: CardThemeData(
        color: DarkColors.surface,
        elevation: elevationSm,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadiusXl,
          side: const BorderSide(color: DarkColors.borderLight, width: 1),
        ),
        margin: paddingMd,
        shadowColor: Colors.transparent,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: DarkColors.background,
        foregroundColor: DarkColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: headlineSmall.copyWith(color: DarkColors.textPrimary),
        shadowColor: Colors.transparent,
      ),
      scaffoldBackgroundColor: DarkColors.background,
      dividerTheme: const DividerThemeData(
        color: DarkColors.border,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
