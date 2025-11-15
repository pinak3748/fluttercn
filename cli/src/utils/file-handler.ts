import fs from "fs-extra";
import { dirname, join, resolve } from "path";
import { fileURLToPath } from "url";

const { copyFileSync, existsSync, mkdirSync, readFileSync, writeFileSync } = fs;

/**
 * Gets the directory of the current file (works in both ESM and CommonJS)
 */
function getCurrentDir() {
  try {
    // ESM mode
    if (import.meta.url) {
      return dirname(fileURLToPath(import.meta.url));
    }
  } catch {
    // Fallback to __dirname (CommonJS)
  }
  return __dirname;
}

/**
 * Finds the CLI root directory by looking for package.json
 */
function findCliRoot(): string {
  const currentDir = getCurrentDir();
  let searchDir = currentDir;
  
  // Walk up the directory tree to find package.json
  while (searchDir !== dirname(searchDir)) {
    const packageJsonPath = join(searchDir, "package.json");
    if (existsSync(packageJsonPath)) {
      // Check if this is the CLI package.json (has "flutter-cn" name)
      try {
        const packageJson = fs.readJsonSync(packageJsonPath);
        if (packageJson.name === "flutter-cn") {
          return searchDir;
        }
      } catch {
        // Continue searching if read fails
      }
    }
    searchDir = dirname(searchDir);
  }
  
  // Fallback: assume we're in cli/src/utils or cli/dist/utils
  // Go up two levels to get to cli root
  return resolve(currentDir, "..", "..");
}

/**
 * Ensures a directory exists, creating it if necessary
 * @param dirPath - Path to the directory
 */
export function ensureDirectoryExists(dirPath: string) {
  if (!existsSync(dirPath)) {
    mkdirSync(dirPath, { recursive: true });
  }
}

/**
 * Copies a file from source to destination
 * @param sourcePath - Source file path
 * @param destinationPath - Destination file path
 * @param overwrite - Whether to overwrite if file exists (default: false)
 * @param transformContent - Optional function to transform file content before writing
 * @returns Object with success boolean and message
 */
export function copyFile(
  sourcePath: string,
  destinationPath: string,
  overwrite: boolean = false,
  transformContent?: (content: string) => string
) {
  // Check if source exists
  if (!existsSync(sourcePath)) {
    return {
      success: false,
      message: `Source file not found: ${sourcePath}`,
    };
  }

  // Check if destination exists
  if (existsSync(destinationPath) && !overwrite) {
    return {
      success: false,
      message: `File already exists: ${destinationPath}. Skipping...`,
      skipped: true,
    };
  }

  try {
    // Ensure destination directory exists
    const destDir = dirname(destinationPath);
    ensureDirectoryExists(destDir);

    // Read source file
    let content = readFileSync(sourcePath, "utf-8");

    // Transform content if transform function provided
    if (transformContent) {
      content = transformContent(content);
    }

    // Write to destination
    writeFileSync(destinationPath, content, "utf-8");

    return {
      success: true,
      message: `✓ Created ${destinationPath}`,
    };
  } catch (error) {
    return {
      success: false,
      message: `Failed to copy file: ${error instanceof Error ? error.message : String(error)}`,
    };
  }
}

/**
 * Gets the path to a file in the CLI's core directory
 * @param relativePath - Relative path from cli/src/core (e.g., "config/theme.dart")
 * @returns Absolute path to the file
 */
export function getCoreFilePath(relativePath: string): string {
  const cliRoot = findCliRoot();
  const currentDir = getCurrentDir();
  
  // Determine if we're running from src (development) or dist (production)
  // by checking which directory we're currently in
  const isDevelopment = currentDir.includes("src");
  
  // Try dist/core first (production), then src/core (development)
  // This ensures it works when running from the built package
  const distCorePath = join(cliRoot, "dist", "core");
  const srcCorePath = join(cliRoot, "src", "core");
  
  // Check dist/core first (for production/published package)
  if (existsSync(distCorePath)) {
    const filePath = join(distCorePath, relativePath);
    if (existsSync(filePath)) {
      return filePath;
    }
  }
  
  // Fallback to src/core (for development)
  if (existsSync(srcCorePath)) {
    const filePath = join(srcCorePath, relativePath);
    if (existsSync(filePath)) {
      return filePath;
    }
  }
  
  // If neither exists, return the dist path (will show error in copyFile)
  return join(distCorePath, relativePath);
}

