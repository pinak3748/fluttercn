import chalk from "chalk";
import ora from "ora";
import { join } from "path";
import { preflightInit } from "../preflights/preflight-init.js";
import { copyFile, getCoreFilePath } from "../utils/file-handler.js";

/**
 * Initialize Flutter CN in the current Flutter project
 */
export async function initCommand() {
  const spinner = ora("Initializing Flutter CN...").start();

  try {
    const cwd = process.cwd();

    // Pre-flight checks
    spinner.text = "Running pre-flight checks...";
    const preflight = preflightInit(cwd);

    if (!preflight.success) {
      spinner.stop();
      console.log("\n" + preflight.error);
      if (preflight.details) {
        preflight.details.forEach((detail) => console.log(detail));
      }
      console.log();
      process.exit(1);
    }

    // Handle warning if already initialized
    if (preflight.warning) {
      spinner.stop();
      console.log("\n" + preflight.warning);
      if (preflight.details) {
        preflight.details.forEach((detail) => console.log(detail));
      }
      console.log();
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
        chalk.cyan("fluttercn add [component]") +
        chalk.gray(" to add components.")
    );
  } catch (error) {
    spinner.fail(
      `Failed to initialize: ${error instanceof Error ? error.message : String(error)}`
    );
    process.exit(1);
  }
}

