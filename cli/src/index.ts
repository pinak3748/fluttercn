#!/usr/bin/env node

import { Command } from "commander";
import { addCommand } from "./commands/add.js";
import { initCommand } from "./commands/init.js";
import { listCommand } from "./commands/list.js";

const program = new Command();

program
  .name("fluttercn")
  .description("Add Flutter components to your apps")
  .version("0.0.4")
  .addHelpCommand("help [command]", "Display help for a command");

program
  .command("init")
  .description("Initialize fluttercn in your Flutter project")
  .summary("Set up fluttercn configuration and theme")
  .action(initCommand);

program
  .command("add <component>")
  .description("Add a Flutter component to your project")
  .summary("Install a component from the registry")
  .action(addCommand);

program
  .command("list")
  .alias("ls")
  .description("List all available components")
  .summary("Show all components in the registry")
  .action(listCommand);

// Custom help text
program.configureHelp({
  sortSubcommands: true,
  subcommandTerm: (cmd) => cmd.name(),
});

program.parse();