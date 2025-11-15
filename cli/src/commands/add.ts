import chalk from "chalk";
import fs from "fs-extra";
import ora from "ora";
import { dirname, join, relative } from "path";
import { copyFile, getCoreFilePath } from "../utils/file-handler.js";
import { getComponent } from "../utils/registry.js";
import { isAlreadyInitialized, validateFlutterProject } from "../utils/validator.js";

const { existsSync } = fs;

/**
 * Calculates the relative import path from destination to theme file
 * @param destinationPath - Path where the component will be saved
 * @param themePath - Path to the theme file
 * @returns Relative import path
 */
function calculateThemeImportPath(
  destinationPath: string,
  themePath: string
): string {
  const destDir = dirname(destinationPath);
  const themeDir = dirname(themePath);
  
  // Calculate relative path from component location to theme location
  const relativePath = relative(destDir, themeDir);
  
  // Normalize the path and convert to Dart import format
  // If theme is at lib/config/theme.dart and component is at lib/widgets/common/card.dart
  // Relative path would be: ../../config/theme.dart
  const normalizedPath = relativePath.replace(/\\/g, "/");
  
  // If paths are the same directory, use same directory
  if (normalizedPath === "") {
    return "./theme.dart";
  }
  
  // Add leading ./ if not present, or use ../ for parent directories
  if (normalizedPath.startsWith("..")) {
    return `${normalizedPath}/theme.dart`;
  }
  
  return `./${normalizedPath}/theme.dart`;
}

/**
 * Transforms the component file content to fix import paths
 * @param content - Original file content
 * @param destinationPath - Where the file will be saved
 * @param cwd - Current working directory (Flutter project root)
 * @returns Transformed content with corrected import paths
 */
function transformComponentContent(
  content: string,
  destinationPath: string,
  cwd: string
): string {
  // Find the theme import line and replace it
  // Original: import '../config/theme.dart';
  // Need to calculate correct relative path from destination to theme
  
  const themePath = join(cwd, "lib", "config", "theme.dart");
  const importPath = calculateThemeImportPath(destinationPath, themePath);
  
  // Replace the theme import
  // Match: import '../config/theme.dart'; or import '../config/theme.dart';
  const importRegex = /import\s+['"](\.\.\/)*config\/theme\.dart['"];?/g;
  const newImport = `import '${importPath}';`;
  
  return content.replace(importRegex, newImport);
}

/**
 * Checks if a dependency file exists
 * @param cwd - Current working directory
 * @param dependencyFile - Relative path to dependency file
 * @returns boolean indicating if dependency exists
 */
function checkDependency(cwd: string, dependencyFile: string): boolean {
  const dependencyPath = join(cwd, "lib", dependencyFile);
  return existsSync(dependencyPath);
}

/**
 * Add a component to the Flutter project
 * @param componentName - Name of the component to add
 */
export async function addCommand(componentName: string) {
  const spinner = ora(`Adding ${componentName}...`).start();
  const cwd = process.cwd();

  try {
    // Step 1: Validate Flutter project
    spinner.text = "Validating Flutter project...";
    const validation = validateFlutterProject(cwd);

    if (!validation.isValid) {
      spinner.fail(validation.error || "Validation failed");
      process.exit(1);
    }

    // Step 2: Check if Flutter CN is initialized
    if (!isAlreadyInitialized(cwd)) {
      spinner.fail(
        "Flutter CN is not initialized. Please run 'flutter-cn init' first."
      );
      process.exit(1);
    }

    // Step 3: Load component from registry
    spinner.text = `Loading component: ${componentName}...`;
    const component = getComponent(componentName);

    if (!component) {
      spinner.fail(`Component '${componentName}' not found in registry.`);
      spinner.info("Run 'flutter-cn list' to see available components.");
      process.exit(1);
    }

    // Step 4: Check dependencies
    if (component.dependencies && component.dependencies.length > 0) {
      spinner.text = "Checking dependencies...";
      for (const dep of component.dependencies) {
        const depPath = join("lib", dep.file);
        if (!checkDependency(cwd, dep.file)) {
          spinner.fail(
            dep.message ||
              `Dependency not found: ${depPath}. Please run 'flutter-cn init' first.`
          );
          process.exit(1);
        }
      }
    }

    // Step 5: Copy component files
    spinner.text = `Installing ${component.name}...`;
    const copiedFiles: string[] = [];
    const skippedFiles: string[] = [];

    for (const file of component.files) {
      const sourcePath = getCoreFilePath(file.source);
      const destinationPath = join(cwd, file.destination);

      // Transform content to fix import paths
      const transformFn = (content: string) =>
        transformComponentContent(content, destinationPath, cwd);

      const result = copyFile(sourcePath, destinationPath, false, transformFn);

      if (result.success) {
        copiedFiles.push(file.destination);
        spinner.succeed(result.message);
      } else if (result.skipped) {
        skippedFiles.push(file.destination);
        spinner.warn(result.message);
      } else {
        spinner.fail(result.message);
        process.exit(1);
      }
    }

    // Step 6: Success message
    console.log("\n" + chalk.green(`✓ ${component.name} added successfully!`));

    if (copiedFiles.length > 0) {
      console.log(chalk.gray("  Files created:"));
      copiedFiles.forEach((file) => {
        console.log(chalk.gray(`    - ${file}`));
      });
    }

    if (skippedFiles.length > 0) {
      console.log(chalk.yellow("  Files skipped (already exist):"));
      skippedFiles.forEach((file) => {
        console.log(chalk.yellow(`    - ${file}`));
      });
    }

    // Step 7: Show usage instructions
//     console.log("\n" + chalk.cyan("📝 Usage:"));
//     console.log(chalk.gray("  Make sure your MaterialApp is configured with the theme:"));
//     console.log(
//       chalk.gray(`
//   return MaterialApp(
//     title: appName,
//     debugShowCheckedModeBanner: false,
//     theme: AppTheme.lightTheme,
//     darkTheme: AppTheme.darkTheme,
//     themeMode: ThemeMode.light,
//     routes: AppRoutes.routes,
//     initialRoute: routeName,
//   );
// `)
//     );

    // if (component.usageExample) {
    //   console.log(chalk.gray("\n  Example usage:"));
    //   console.log(chalk.gray(component.usageExample));
    // }

    console.log(
      chalk.gray(
        `\n  Import: import 'package:your_app/${component.files[0].destination.replace("lib/", "")}';`
      )
    );
  } catch (error) {
    spinner.fail(
      `Failed to add component: ${error instanceof Error ? error.message : String(error)}`
    );
    process.exit(1);
  }
}

