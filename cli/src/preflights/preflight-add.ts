import chalk from "chalk";
import fs from "fs-extra";
import { join } from "path";
import { Component, getComponent } from "../utils/registry.js";
import { isAlreadyInitialized, validateFlutterProject } from "../utils/validator.js";

const { existsSync } = fs;

export interface PreflightResult {
  success: boolean;
  error?: string;
  details?: string[];
  component?: Component;
}

/**
 * Pre-flight checks for the add command
 * @param cwd - Current working directory
 * @param componentName - Name of the component to add
 * @returns PreflightResult with validation status and messages
 */
export function preflightAdd(cwd: string, componentName: string): PreflightResult {
  // Step 1: Validate Flutter project
  const validation = validateFlutterProject(cwd);

  if (!validation.isValid) {
    return {
      success: false,
      error: chalk.red("✗ Flutter project validation failed"),
      details: [chalk.gray(`  • ${validation.error}`)],
    };
  }

  // Step 2: Check if fluttercn is initialized
  if (!isAlreadyInitialized(cwd)) {
    return {
      success: false,
      error: chalk.red("✗ fluttercn is not initialized"),
      details: [
        chalk.gray("  Please run ") +
          chalk.cyan("fluttercn init") +
          chalk.gray(" first to set up fluttercn."),
      ],
    };
  }

  // Step 3: Check if component exists
  const component = getComponent(componentName);

  if (!component) {
    return {
      success: false,
      error: chalk.red(`✗ Component '${chalk.yellow(componentName)}' not found`),
      details: [
        chalk.gray("  Run ") +
          chalk.cyan("fluttercn list") +
          chalk.gray(" to see available components."),
      ],
    };
  }

  // Step 4: Check dependencies
  if (component.dependencies && component.dependencies.length > 0) {
    const missingDeps: string[] = [];

    for (const dep of component.dependencies) {
      const depPath = join(cwd, "lib", dep.file);
      if (!existsSync(depPath)) {
        missingDeps.push(dep.message || dep.file);
      }
    }

    if (missingDeps.length > 0) {
      return {
        success: false,
        error: chalk.red("✗ Missing required dependencies"),
        details: missingDeps.map((dep) => chalk.gray(`  • ${dep}`)),
      };
    }
  }

  return {
    success: true,
    component,
  };
}

