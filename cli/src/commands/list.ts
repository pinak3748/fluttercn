import chalk from "chalk";
import { listComponents } from "../utils/registry.js";

/**
 * List all available components
 */
export async function listCommand() {
  try {
    const components = listComponents();

    if (components.length === 0) {
      console.log(chalk.yellow("No components available in the registry."));
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
        chalk.cyan(`flutter-cn add <component-name>`)
    );
    console.log(
      chalk.gray(`   Example: `) +
        chalk.cyan(`flutter-cn add card\n`)
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

