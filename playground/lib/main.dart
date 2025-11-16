import 'package:flutter/material.dart';

import 'config/theme.dart';
import 'presentations/showcase_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize theme on startup (default to dark)
    AppTheme.initializeTheme(_themeMode == ThemeMode.dark);
  }

  @override
  Widget build(BuildContext context) {
    // Update theme initialization when mode changes
    AppTheme.initializeTheme(_themeMode == ThemeMode.dark);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter CN Playground',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: ShowcaseDashboard(onThemeToggle: _toggleTheme),
    );
  }
}
