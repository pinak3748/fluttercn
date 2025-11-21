import 'dart:io';

import 'package:fluttercn/preflights/preflight_init.dart';
import 'package:fluttercn/utils/colors.dart';
import 'package:fluttercn/utils/file_handler.dart';
import 'package:path/path.dart' as path;

/// Initialize fluttercn in the current Flutter project
Future<void> initCommand() async {
  stdout.write('Initializing fluttercn...');
  final cwd = Directory.current.path;

  try {
    stdout.write('\rRunning pre-flight checks...');
    final preflight = preflightInit(cwd);

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

    if (preflight.warning != null) {
      stdout.writeln('\n${preflight.warning}');
      if (preflight.details != null) {
        for (final detail in preflight.details!) {
          stdout.writeln(detail);
        }
      }
      stdout.writeln();
      return;
    }

    stdout.write('\rSetting up theme configuration...');
    final themeSource = getCoreFilePath('config/theme.dart');
    final themeDestination = path.join(cwd, 'lib', 'config', 'theme.dart');

    final copyResult = copyFile(themeSource, themeDestination, false);

    if (!copyResult.success) {
      if (copyResult.skipped) {
        stdout.writeln(
            '\r${Colors.yellow}⚠ ${copyResult.message}${Colors.reset}');
      } else {
        stdout.writeln(
            '\r${Colors.yellow}✗ ${copyResult.message}${Colors.reset}');
        exit(1);
      }
    } else {
      stdout.writeln('\r${Colors.green}${copyResult.message}${Colors.reset}');
    }

    stdout.writeln(
        '\n${Colors.green}✓ fluttercn initialized successfully!${Colors.reset}');
    stdout.writeln(
      '${Colors.gray}  You can now use ${Colors.cyan}fluttercn add [component]${Colors.gray} to add components.${Colors.reset}',
    );
  } catch (e) {
    stdout
        .writeln('\r${Colors.yellow}✗ Failed to initialize: $e${Colors.reset}');
    exit(1);
  }
}
