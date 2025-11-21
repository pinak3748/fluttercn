import 'dart:io';

import 'package:fluttercn/preflights/preflight_list.dart';
import 'package:fluttercn/utils/colors.dart';
import 'package:fluttercn/utils/registry.dart';

/// List all available components
Future<void> listCommand() async {
  try {
    final preflight = preflightList();

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

    final components = listComponents();

    if (components.isEmpty) {
      stdout.writeln(
          '${Colors.yellow}⚠ No components available in the registry.${Colors.reset}');
      return;
    }

    stdout.writeln('${Colors.cyan}\n📦 Available Components:\n${Colors.reset}');

    for (var i = 0; i < components.length; i++) {
      final component = components[i];
      stdout.writeln(
        '${Colors.green}  ${i + 1}. ${component['name']}${Colors.reset}'
        '${Colors.gray} - ${component['description']}${Colors.reset}',
      );
    }

    stdout.writeln(
      '${Colors.gray}\n💡 Usage: ${Colors.cyan}fluttercn add <component-name>${Colors.reset}',
    );
    stdout.writeln(
      '${Colors.gray}   Example: ${Colors.cyan}fluttercn add card\n${Colors.reset}',
    );
  } catch (e) {
    stdout.writeln(
      '${Colors.yellow}Failed to list components: $e${Colors.reset}',
    );
    exit(1);
  }
}
