import 'dart:convert';
import 'dart:io';

import 'package:fluttercn/utils/file_handler.dart';

/// Component file definition
class ComponentFile {
  final String source;
  final String destination;

  ComponentFile({required this.source, required this.destination});

  factory ComponentFile.fromJson(Map<String, dynamic> json) {
    return ComponentFile(
      source: json['source'] as String,
      destination: json['destination'] as String,
    );
  }
}

/// Component dependency definition
class ComponentDependency {
  final String type;
  final String file;
  final String? message;

  ComponentDependency({
    required this.type,
    required this.file,
    this.message,
  });

  factory ComponentDependency.fromJson(Map<String, dynamic> json) {
    return ComponentDependency(
      type: json['type'] as String,
      file: json['file'] as String,
      message: json['message'] as String?,
    );
  }
}

/// Component definition
class Component {
  final String name;
  final String description;
  final List<ComponentFile> files;
  final List<ComponentDependency>? dependencies;
  final String? importPath;
  final String? usageExample;

  Component({
    required this.name,
    required this.description,
    required this.files,
    this.dependencies,
    this.importPath,
    this.usageExample,
  });

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      name: json['name'] as String,
      description: json['description'] as String,
      files: (json['files'] as List)
          .map((f) => ComponentFile.fromJson(f as Map<String, dynamic>))
          .toList(),
      dependencies: json['dependencies'] != null
          ? (json['dependencies'] as List)
              .map((d) =>
                  ComponentDependency.fromJson(d as Map<String, dynamic>))
              .toList()
          : null,
      importPath: json['importPath'] as String?,
      usageExample: json['usageExample'] as String?,
    );
  }
}

/// Registry containing all components
class Registry {
  final Map<String, Component> components;

  Registry({required this.components});

  factory Registry.fromJson(Map<String, dynamic> json) {
    final componentsMap = <String, Component>{};
    final componentsJson = json['components'] as Map<String, dynamic>;

    componentsJson.forEach((key, value) {
      // Normalize keys to kebab-case (lowercase with hyphens)
      final normalizedKey = key.toLowerCase().replaceAll('_', '-');
      componentsMap[normalizedKey] =
          Component.fromJson(value as Map<String, dynamic>);
    });

    return Registry(components: componentsMap);
  }
}

/// Loads the registry from the core directory
Registry loadRegistry() {
  final registryPath = getCoreFilePath('registery.json');

  if (!File(registryPath).existsSync()) {
    throw Exception('Registry file not found: $registryPath');
  }

  try {
    final content = File(registryPath).readAsStringSync();
    final json = jsonDecode(content) as Map<String, dynamic>;
    return Registry.fromJson(json);
  } catch (e) {
    throw Exception('Failed to read registry: $e');
  }
}

/// Normalizes component name for lookup (handles both kebab-case and snake_case)
String normalizeComponentName(String name) {
  // Convert to lowercase and replace underscores with hyphens for consistency
  return name.toLowerCase().replaceAll('_', '-');
}

/// Gets a component from the registry
Component? getComponent(String componentName) {
  final registry = loadRegistry();
  final normalizedName = normalizeComponentName(componentName);
  return registry.components[normalizedName];
}

/// Lists all available components
List<Map<String, String>> listComponents() {
  final registry = loadRegistry();
  return registry.components.values
      .map((comp) => {'name': comp.name, 'description': comp.description})
      .toList();
}
