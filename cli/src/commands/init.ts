import chalk from "chalk";
import ora from "ora";
import { join } from "path";
import { copyFile, getCoreFilePath } from "../utils/file-handler.js";
import { isAlreadyInitialized, validateFlutterProject } from "../utils/validator.js";

/**
 * Initialize Flutter CN in the current Flutter project
 */
export async function initCommand() {
  const spinner = ora("Initializing Flutter CN...").start();

  try {
    const cwd = process.cwd();

    // Step 1: Validate Flutter project
    spinner.text = "Validating Flutter project...";
    const validation = validateFlutterProject(cwd);

    if (!validation.isValid) {
      spinner.fail(validation.error || "Validation failed");
      process.exit(1);
    }

    // Step 2: Check if already initialized
    if (isAlreadyInitialized(cwd)) {
      spinner.warn("Flutter CN is already initialized in this project.");
      spinner.info(`Theme file exists at: ${join(cwd, "lib", "config", "theme.dart")}`);
      return;
    }

    // Step 3: Copy theme file
    spinner.text = "Setting up theme configuration...";
    const themeSource = getCoreFilePath("config/theme.dart");
    const themeDestination = join(cwd, "lib", "config", "theme.dart");

    const copyResult = copyFile(themeSource, themeDestination, false);

    if (!copyResult.success) {
      if (copyResult.skipped) {
        spinner.warn(copyResult.message);
      } else {
        spinner.fail(copyResult.message);
        process.exit(1);
      }
    } else {
      spinner.succeed(copyResult.message);
    }

    // Step 4: Success message
    console.log("\n" + chalk.green("✓ Flutter CN initialized successfully!"));
    console.log(
      chalk.gray("  You can now use ") +
        chalk.cyan("flutter-cn add [component]") +
        chalk.gray(" to add components.")
    );
  } catch (error) {
    spinner.fail(
      `Failed to initialize: ${error instanceof Error ? error.message : String(error)}`
    );
    process.exit(1);
  }
}

