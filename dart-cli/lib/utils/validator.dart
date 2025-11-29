import 'dart:io';

import 'package:path/path.dart' as path;

/// Validation result for Flutter project checks
class ValidationResult {
  final bool isValid;
  final String? error;

  ValidationResult({required this.isValid, this.error});
}

ValidationResult validateFlutterProject(String cwd) {
  final pubspecPath = path.join(cwd, 'pubspec.yaml');
  final libPath = path.join(cwd, 'lib');

  final errors = <String>[];

  if (!File(pubspecPath).existsSync()) {
    errors.add('pubspec.yaml not found');
  }

  if (!Directory(libPath).existsSync()) {
    errors.add('lib/ directory not found');
  }

  if (errors.isNotEmpty) {
    return ValidationResult(
      isValid: false,
      error: 'Error: Not a Flutter project. ${errors.join(' and ')}.',
    );
  }

  return ValidationResult(isValid: true);
}

/// Checks if fluttercn is already initialized
bool isAlreadyInitialized(String cwd) {
  final themePath = path.join(cwd, 'lib', 'config', 'theme.dart');
  return File(themePath).existsSync();
}
