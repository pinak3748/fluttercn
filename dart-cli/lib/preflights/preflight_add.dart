import 'dart:io';

import 'package:fluttercn/utils/registry.dart';
import 'package:fluttercn/utils/validator.dart';
import 'package:path/path.dart' as path;

/// Preflight result with success status and optional component data
class PreflightResult {
  final bool success;
  final String? error;
  final List<String>? details;
  final Component? component;

  PreflightResult({
    required this.success,
    this.error,
    this.details,
    this.component,
  });
}

PreflightResult preflightAdd(String cwd, String componentName) {
  final validation = validateFlutterProject(cwd);

  if (!validation.isValid) {
    return PreflightResult(
      success: false,
      error: '✗ Flutter project validation failed',
      details: ['  • ${validation.error}'],
    );
  }

  if (!isAlreadyInitialized(cwd)) {
    return PreflightResult(
      success: false,
      error: '✗ fluttercn is not initialized',
      details: [
        '  Please run fluttercn init first to set up fluttercn.',
      ],
    );
  }

  final component = getComponent(componentName);

  if (component == null) {
    return PreflightResult(
      success: false,
      error: "✗ Component '$componentName' not found",
      details: [
        '  Run fluttercn list to see available components.',
      ],
    );
  }

  if (component.dependencies != null && component.dependencies!.isNotEmpty) {
    final missingDeps = <String>[];

    for (final dep in component.dependencies!) {
      final depPath = path.join(cwd, 'lib', dep.file);
      if (!File(depPath).existsSync()) {
        missingDeps.add(dep.message ?? dep.file);
      }
    }

    if (missingDeps.isNotEmpty) {
      return PreflightResult(
        success: false,
        error: '✗ Missing required dependencies',
        details: missingDeps.map((dep) => '  • $dep').toList(),
      );
    }
  }

  return PreflightResult(
    success: true,
    component: component,
  );
}
