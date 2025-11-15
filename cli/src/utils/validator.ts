import fs from "fs-extra";
import { join } from "path";

const { existsSync } = fs;

/**
 * Validates if the current directory is a Flutter project
 * @param cwd - Current working directory (defaults to process.cwd())
 * @returns Object with isValid boolean and error message if invalid
 */
export function validateFlutterProject(cwd: string = process.cwd()) {
  const pubspecPath = join(cwd, "pubspec.yaml");
  const libPath = join(cwd, "lib");

  const errors: string[] = [];

  // Check for pubspec.yaml
  if (!existsSync(pubspecPath)) {
    errors.push(`pubspec.yaml not found`);
  }

  // Check for lib/ directory
  if (!existsSync(libPath)) {
    errors.push(`lib/ directory not found`);
  }

  if (errors.length > 0) {
    return {
      isValid: false,
      error: `Error: Not a Flutter project. ${errors.join(" and ")}.`,
    };
  }

  return {
    isValid: true,
    error: null,
  };
}

/**
 * Checks if Flutter CN is already initialized
 * @param cwd - Current working directory
 * @returns boolean indicating if already initialized
 */
export function isAlreadyInitialized(cwd: string = process.cwd()) {
  const themePath = join(cwd, "lib", "config", "theme.dart");
  return existsSync(themePath);
}

