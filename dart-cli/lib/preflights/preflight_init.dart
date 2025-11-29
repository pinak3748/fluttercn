import 'package:fluttercn/utils/validator.dart';
import 'package:path/path.dart' as path;

/// Preflight result with success status and optional messages
class PreflightResult {
  final bool success;
  final String? error;
  final String? warning;
  final List<String>? details;

  PreflightResult({
    required this.success,
    this.error,
    this.warning,
    this.details,
  });
}

PreflightResult preflightInit(String cwd) {
  final validation = validateFlutterProject(cwd);

  if (!validation.isValid) {
    return PreflightResult(
      success: false,
      error: '✗ Flutter project validation failed',
      details: ['  • ${validation.error}'],
    );
  }

  if (isAlreadyInitialized(cwd)) {
    final themePath = path.join(cwd, 'lib', 'config', 'theme.dart');
    return PreflightResult(
      success: true,
      warning: '⚠ fluttercn is already initialized',
      details: [
        '  Theme file exists at: $themePath',
        '  Skipping initialization...',
      ],
    );
  }

  return PreflightResult(success: true);
}
