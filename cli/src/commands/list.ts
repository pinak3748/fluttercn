import chalk from "chalk";
import { listComponents } from "../utils/registry.js";
import { preflightList } from "../preflights/preflight-list.js";

/**
 * List all available components
 */
export async function listCommand() {
  try {
    // Pre-flight checks
    const preflight = preflightList();

    if (!preflight.success) {
      console.log("\n" + preflight.error);
      if (preflight.details) {
        preflight.details.forEach((detail) => console.log(detail));
      }
      console.log();
      process.exit(1);
    }

    const components = listComponents();

    if (components.length === 0) {
      console.log(chalk.yellow("⚠ No components available in the registry."));
      return;
    }

    console.log(chalk.cyan("\n📦 Available Components:\n"));

    components.forEach((component, index) => {
      console.log(
        chalk.green(`  ${index + 1}. ${component.name}`) +
          chalk.gray(` - ${component.description}`)
      );
    });

    console.log(
      chalk.gray(
        `\n💡 Usage: `) +
        chalk.cyan(`fluttercn add <component-name>`)
    );
    console.log(
      chalk.gray(`   Example: `) +
        chalk.cyan(`fluttercn add card\n`)
    );
  } catch (error) {
    console.error(
      chalk.red(
        `Failed to list components: ${error instanceof Error ? error.message : String(error)}`
      )
    );
    process.exit(1);
  }
}

