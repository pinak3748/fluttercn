import chalk from "chalk";
import { join } from "path";
import { isAlreadyInitialized, validateFlutterProject } from "../utils/validator.js";

export interface PreflightResult {
  success: boolean;
  error?: string;
  warning?: string;
  details?: string[];
}

/**
 * Pre-flight checks for the init command
 * @param cwd - Current working directory
 * @returns PreflightResult with validation status and messages
 */
export function preflightInit(cwd: string): PreflightResult {
  // Step 1: Validate Flutter project
  const validation = validateFlutterProject(cwd);

  if (!validation.isValid) {
    return {
      success: false,
      error: chalk.red("✗ Flutter project validation failed"),
      details: [chalk.gray(`  • ${validation.error}`)],
    };
  }

  // Step 2: Check if already initialized (warning, not error)
  if (isAlreadyInitialized(cwd)) {
    const themePath = join(cwd, "lib", "config", "theme.dart");
    return {
      success: true,
      warning: chalk.yellow("⚠ fluttercn is already initialized"),
      details: [
        chalk.gray(`  Theme file exists at: ${themePath}`),
        chalk.gray("  Skipping initialization..."),
      ],
    };
  }

  return {
    success: true,
  };
}

