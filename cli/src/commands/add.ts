import chalk from "chalk";
import fs from "fs-extra";
import ora from "ora";
import { dirname, join, relative } from "path";
import readline from "readline";
import { copyFile, getCoreFilePath } from "../utils/file-handler.js";
import { preflightAdd } from "../preflights/preflight-add.js";

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
 * Prompts the user for confirmation to overwrite an existing file
 * @param filePath - Path to the file that already exists
 * @returns Promise that resolves to true if user wants to overwrite, false otherwise
 */
function promptOverwrite(filePath: string): Promise<boolean> {
  return new Promise((resolve) => {
    const rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout,
    });

    rl.question(
      chalk.yellow(
        `\n⚠️  File already exists: ${filePath}\n   Do you want to overwrite it? (y/N): `
      ),
      (answer) => {
        rl.close();
        const shouldOverwrite =
          answer.toLowerCase() === "y" || answer.toLowerCase() === "yes";
        resolve(shouldOverwrite);
      }
    );
  });
}

/**
 * Add a component to the Flutter project
 * @param componentName - Name of the component to add
 */
export async function addCommand(componentName: string) {
  const spinner = ora(`Adding ${componentName}...`).start();
  const cwd = process.cwd();

  try {
    // Pre-flight checks
    spinner.text = "Running pre-flight checks...";
    const preflight = preflightAdd(cwd, componentName);

    if (!preflight.success) {
      spinner.stop();
      console.log("\n" + preflight.error);
      if (preflight.details) {
        preflight.details.forEach((detail) => console.log(detail));
      }
      console.log();
      process.exit(1);
    }

    const component = preflight.component!;

    // Step 2: Copy component files
    spinner.text = `Installing ${component.name}...`;
    const copiedFiles: string[] = [];
    const skippedFiles: string[] = [];

    for (const file of component.files) {
      const sourcePath = getCoreFilePath(file.source);
      const destinationPath = join(cwd, file.destination);
      const fileExists = existsSync(destinationPath);

      // Check if file already exists and prompt user
      let shouldOverwrite = false;
      if (fileExists) {
        spinner.stop();
        shouldOverwrite = await promptOverwrite(file.destination);
        spinner.start();

        if (!shouldOverwrite) {
          skippedFiles.push(file.destination);
          spinner.warn(`Skipped ${file.destination} (user chose not to overwrite)`);
          continue;
        }
      }

      // Transform content to fix import paths
      const transformFn = (content: string) =>
        transformComponentContent(content, destinationPath, cwd);

      // Copy file with overwrite enabled if file exists and user confirmed
      const result = copyFile(
        sourcePath,
        destinationPath,
        shouldOverwrite,
        transformFn
      );

      if (result.success) {
        copiedFiles.push(file.destination);
        spinner.succeed(result.message);
      } else {
        spinner.fail(result.message);
        process.exit(1);
      }
    }

    // Step 3: Success message
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

    // Step 4: Show usage instructions
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

