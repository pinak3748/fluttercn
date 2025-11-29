import 'dart:io';

import 'package:fluttercn/preflights/preflight_add.dart';
import 'package:fluttercn/utils/colors.dart';
import 'package:fluttercn/utils/file_handler.dart';
import 'package:path/path.dart' as path;

String calculateThemeImportPath(String destinationPath, String themePath) {
  final destDir = path.dirname(destinationPath);
  final themeDir = path.dirname(themePath);
  final relativePath = path.relative(themeDir, from: destDir);
  final normalizedPath = path.normalize(relativePath).replaceAll('\\', '/');

  if (normalizedPath == '.' || normalizedPath.isEmpty) {
    return './theme.dart';
  }

  if (normalizedPath.startsWith('..')) {
    return '$normalizedPath/theme.dart';
  }

  return './$normalizedPath/theme.dart';
}

String transformComponentContent(
  String content,
  String destinationPath,
  String cwd,
) {
  final themePath = path.join(cwd, 'lib', 'config', 'theme.dart');
  final importPath = calculateThemeImportPath(destinationPath, themePath);
  final importRegex = RegExp(
    "import\\s+(['\"])(\\.\\.\\/)*config\\/theme\\.dart(['\"]);?",
    multiLine: true,
  );
  final newImport = "import '$importPath';";

  return content.replaceAll(importRegex, newImport);
}

Future<bool> promptOverwrite(String filePath) async {
  stdout.write(
    '${Colors.yellow}\n⚠️  File already exists: $filePath\n   Do you want to overwrite it? (y/N): ${Colors.reset}',
  );
  final input = stdin.readLineSync();
  final shouldOverwrite =
      input?.toLowerCase() == 'y' || input?.toLowerCase() == 'yes';
  return shouldOverwrite;
}

Future<void> addCommand(String componentName) async {
  stdout.write('Adding $componentName...');
  final cwd = Directory.current.path;

  try {
    stdout.write('\rRunning pre-flight checks...');
    final preflight = preflightAdd(cwd, componentName);

    if (!preflight.success) {
      stdout.writeln('\n${preflight.error}');
      if (preflight.details != null) {
        for (final detail in preflight.details!) {
          stdout.writeln(detail);
        }
      }
      stdout.writeln();
      exit(1);
    }

    final component = preflight.component!;

    if (component.files.isEmpty) {
      stdout.writeln(
        '\r${Colors.yellow}✗ Component has no files to install${Colors.reset}',
      );
      exit(1);
    }

    stdout.write('\rInstalling ${component.name}...');
    final copiedFiles = <String>[];
    final skippedFiles = <String>[];

    for (final file in component.files) {
      if (!isPathSafe(file.destination, cwd)) {
        stdout.writeln(
          '\r${Colors.yellow}✗ Invalid destination path: ${file.destination}${Colors.reset}',
        );
        exit(1);
      }

      final sourcePath = getCoreFilePath(file.source);
      final destinationPath = path.join(cwd, file.destination);
      final fileExists = File(destinationPath).existsSync();

      var shouldOverwrite = false;
      if (fileExists) {
        stdout.write('\r');
        shouldOverwrite = await promptOverwrite(file.destination);
        stdout.write('Installing ${component.name}...');

        if (!shouldOverwrite) {
          skippedFiles.add(file.destination);
          stdout.writeln(
            '\r${Colors.yellow}⚠ Skipped ${file.destination} (user chose not to overwrite)${Colors.reset}',
          );
          stdout.write('Installing ${component.name}...');
          continue;
        }
      }

      String transformFn(String content) =>
          transformComponentContent(content, destinationPath, cwd);
      final result = copyFile(
        sourcePath,
        destinationPath,
        shouldOverwrite,
        transformFn,
      );

      if (result.success) {
        copiedFiles.add(file.destination);
        stdout.writeln('\r${Colors.green}${result.message}${Colors.reset}');
        stdout.write('Installing ${component.name}...');
      } else {
        stdout.writeln('\r${Colors.yellow}✗ ${result.message}${Colors.reset}');
        exit(1);
      }
    }

    stdout.writeln(
      '\r${Colors.green}✓ ${component.name} added successfully!${Colors.reset}',
    );

    if (copiedFiles.isNotEmpty) {
      stdout.writeln('${Colors.gray}  Files created:${Colors.reset}');
      for (final file in copiedFiles) {
        stdout.writeln('${Colors.gray}    - $file${Colors.reset}');
      }
    }

    if (skippedFiles.isNotEmpty) {
      stdout.writeln(
          '${Colors.yellow}  Files skipped (already exist):${Colors.reset}');
      for (final file in skippedFiles) {
        stdout.writeln('${Colors.yellow}    - $file${Colors.reset}');
      }
    }

    if (component.files.isNotEmpty) {
      final importPath = component.files[0].destination.replaceAll('lib/', '');
      stdout.writeln(
        '${Colors.gray}\n  Import: import \'package:your_app/$importPath\';${Colors.reset}',
      );
    }
  } catch (e) {
    stdout.writeln(
        '\r${Colors.yellow}✗ Failed to add component: $e${Colors.reset}');
    exit(1);
  }
}
