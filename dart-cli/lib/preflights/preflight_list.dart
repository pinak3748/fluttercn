import 'package:fluttercn/utils/registry.dart';

/// Preflight result with success status
class PreflightResult {
  final bool success;
  final String? error;
  final List<String>? details;

  PreflightResult({
    required this.success,
    this.error,
    this.details,
  });
}

PreflightResult preflightList() {
  try {
    loadRegistry();
    return PreflightResult(success: true);
  } catch (e) {
    return PreflightResult(
      success: false,
      error: '✗ Failed to load component registry',
      details: ['  $e'],
    );
  }
}
