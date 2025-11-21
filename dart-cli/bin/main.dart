#!/usr/bin/env dart

import 'dart:io';

import 'package:args/args.dart';
import 'package:fluttercn/commands/add_command.dart';
import 'package:fluttercn/commands/init_command.dart';
import 'package:fluttercn/commands/list_command.dart';
import 'package:fluttercn/utils/colors.dart';
import 'package:path/path.dart' as path;

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Display help information',
    )
    ..addFlag(
      'version',
      abbr: 'v',
      negatable: false,
      help: 'Display version information',
    );

  parser
    ..addCommand('init', _initParser())
    ..addCommand('add', _addParser())
    ..addCommand('list', _listParser())
    ..addCommand('ls', _listParser());

  try {
    final results = parser.parse(arguments);

    if (results['help'] == true) {
      _printHelp(parser);
      exit(0);
    }

    if (results['version'] == true) {
      try {
        final scriptPath = Platform.script.toFilePath();
        var searchDir = path.dirname(scriptPath);

        while (searchDir != path.dirname(searchDir)) {
          final pubspecPath = path.join(searchDir, 'pubspec.yaml');
          final pubspec = File(pubspecPath);
          if (pubspec.existsSync()) {
            try {
              final content = pubspec.readAsStringSync();
              if (content.contains('name: fluttercn')) {
                final versionMatch =
                    RegExp(r'^version:\s*(.+)$', multiLine: true)
                        .firstMatch(content);
                if (versionMatch != null) {
                  stdout.writeln(versionMatch.group(1)!.trim());
                } else {
                  stdout.writeln('0.0.5');
                }
                exit(0);
              }
            } catch (_) {
              // Continue searching
            }
          }
          searchDir = path.dirname(searchDir);
        }
        stdout.writeln('0.0.5');
      } catch (_) {
        stdout.writeln('0.0.5');
      }
      exit(0);
    }

    if (results.command != null) {
      final command = results.command!;
      final commandName = command.name;

      switch (commandName) {
        case 'init':
          await initCommand();
          break;
        case 'add':
          final rest = command.rest;
          if (rest.isEmpty) {
            stdout.writeln(
                '${Colors.cyan}Error:${Colors.reset} Component name is required');
            stdout.writeln('Usage: fluttercn add <component-name>');
            exit(1);
          }
          await addCommand(rest[0]);
          break;
        case 'list':
        case 'ls':
          await listCommand();
          break;
        default:
          _printHelp(parser);
          exit(1);
      }
    } else {
      _printHelp(parser);
      exit(0);
    }
  } catch (e) {
    stdout.writeln('${Colors.cyan}Error:${Colors.reset} $e');
    _printHelp(parser);
    exit(1);
  }
}

ArgParser _initParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Display help for init command',
    );
}

ArgParser _addParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Display help for add command',
    );
}

ArgParser _listParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Display help for list command',
    );
}

void _printHelp(ArgParser parser) {
  stdout.writeln(
      '${Colors.cyan}fluttercn${Colors.reset} - Add Flutter components to your apps');
  stdout.writeln();
  stdout.writeln('${Colors.gray}Usage:${Colors.reset}');
  stdout.writeln('  fluttercn <command> [arguments]');
  stdout.writeln();
  stdout.writeln('${Colors.gray}Global options:${Colors.reset}');
  stdout.writeln('  -h, --help     Print this usage information.');
  stdout.writeln('  -v, --version  Print the version number.');
  stdout.writeln();
  stdout.writeln('${Colors.gray}Available commands:${Colors.reset}');
  stdout
      .writeln('  init           Initialize fluttercn in your Flutter project');
  stdout.writeln('  add <name>     Add a Flutter component to your project');
  stdout.writeln('  list (or ls)   List all available components');
  stdout.writeln();
  stdout.writeln(
      '${Colors.gray}Run "fluttercn help <command>" for more information about a command.${Colors.reset}');
}
