import chalk from "chalk";
import { loadRegistry } from "../utils/registry.js";

export interface PreflightResult {
  success: boolean;
  error?: string;
  details?: string[];
}

/**
 * Pre-flight checks for the list command
 * @returns PreflightResult with validation status and messages
 */
export function preflightList(): PreflightResult {
  try {
    // Check if registry can be loaded
    loadRegistry();
    return {
      success: true,
    };
  } catch (error) {
    return {
      success: false,
      error: chalk.red("✗ Failed to load component registry"),
      details: [
        chalk.gray(
          `  ${error instanceof Error ? error.message : String(error)}`
        ),
      ],
    };
  }
}

