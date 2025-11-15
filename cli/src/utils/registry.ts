import fs from "fs-extra";
import { join } from "path";
import { getCoreFilePath } from "./file-handler.js";

const { readJsonSync, existsSync } = fs;

export interface ComponentFile {
  source: string;
  destination: string;
}

export interface ComponentDependency {
  type: string;
  file: string;
  message?: string;
}

export interface Component {
  name: string;
  description: string;
  files: ComponentFile[];
  dependencies?: ComponentDependency[];
  importPath?: string;
  usageExample?: string;
}

export interface Registry {
  components: Record<string, Component>;
}

/**
 * Loads the registry from the core directory
 * @returns Registry object
 */
export function loadRegistry(): Registry {
  const registryPath = getCoreFilePath("registery.json");
  
  if (!existsSync(registryPath)) {
    throw new Error(`Registry file not found: ${registryPath}`);
  }

  try {
    const registry = readJsonSync(registryPath) as Registry;
    return registry;
  } catch (error) {
    throw new Error(
      `Failed to read registry: ${error instanceof Error ? error.message : String(error)}`
    );
  }
}

/**
 * Gets a component from the registry
 * @param componentName - Name of the component
 * @returns Component object or null if not found
 */
export function getComponent(componentName: string): Component | null {
  const registry = loadRegistry();
  const component = registry.components[componentName.toLowerCase()];
  return component || null;
}

/**
 * Lists all available components
 * @returns Array of component names and descriptions
 */
export function listComponents(): Array<{ name: string; description: string }> {
  const registry = loadRegistry();
  return Object.values(registry.components).map((comp) => ({
    name: comp.name,
    description: comp.description,
  }));
}

