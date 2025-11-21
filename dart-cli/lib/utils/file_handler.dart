import 'dart:io';

import 'package:path/path.dart' as path;

/// Result of a file copy operation
class CopyResult {
  final bool success;
  final String message;
  final bool skipped;

  CopyResult({
    required this.success,
    required this.message,
    this.skipped = false,
  });
}

String _getCurrentDir() {
  return path.dirname(Platform.script.toFilePath());
}

String findCliRoot() {
  final currentDir = _getCurrentDir();
  var searchDir = currentDir;

  while (searchDir != path.dirname(searchDir)) {
    final pubspecPath = path.join(searchDir, 'pubspec.yaml');
    if (File(pubspecPath).existsSync()) {
      try {
        final content = File(pubspecPath).readAsStringSync();
        if (content.contains('name: fluttercn')) {
          return searchDir;
        }
      } catch (_) {
        // Continue searching if read fails
      }
    }
    searchDir = path.dirname(searchDir);
  }

  if (currentDir.contains('lib') || currentDir.contains('bin')) {
    return path.normalize(path.join(currentDir, '..', '..'));
  }
  return path.normalize(path.join(currentDir, '..'));
}

void ensureDirectoryExists(String dirPath) {
  if (!Directory(dirPath).existsSync()) {
    Directory(dirPath).createSync(recursive: true);
  }
}

CopyResult copyFile(
  String sourcePath,
  String destinationPath,
  bool overwrite, [
  String Function(String)? transformContent,
]) {
  if (!File(sourcePath).existsSync()) {
    return CopyResult(
      success: false,
      message: 'Source file not found: $sourcePath',
    );
  }

  if (File(destinationPath).existsSync() && !overwrite) {
    return CopyResult(
      success: false,
      message: 'File already exists: $destinationPath. Skipping...',
      skipped: true,
    );
  }

  try {
    final destDir = path.dirname(destinationPath);
    ensureDirectoryExists(destDir);

    var content = File(sourcePath).readAsStringSync();

    if (transformContent != null) {
      content = transformContent(content);
    }

    final destFile = File(destinationPath);
    destFile.writeAsStringSync(content);

    return CopyResult(
      success: true,
      message: '✓ Created $destinationPath',
    );
  } catch (e) {
    return CopyResult(
      success: false,
      message: 'Failed to copy file: $e',
    );
  }
}

bool isPathSafe(String destinationPath, String projectRoot) {
  if (path.isAbsolute(destinationPath)) {
    return false;
  }

  final normalizedDest =
      path.normalize(path.join(projectRoot, destinationPath));
  final normalizedRoot = path.normalize(projectRoot);
  return normalizedDest.startsWith(normalizedRoot);
}

String getCoreFilePath(String relativePath) {
  final cliRoot = findCliRoot();

  final assetsCorePath = path.join(cliRoot, 'assets', 'core');
  if (Directory(assetsCorePath).existsSync()) {
    final filePath = path.join(assetsCorePath, relativePath);
    if (File(filePath).existsSync()) {
      return filePath;
    }
  }

  final libAssetsCorePath = path.join(cliRoot, 'lib', 'assets', 'core');
  if (Directory(libAssetsCorePath).existsSync()) {
    final filePath = path.join(libAssetsCorePath, relativePath);
    if (File(filePath).existsSync()) {
      return filePath;
    }
  }

  return path.join(assetsCorePath, relativePath);
}
