# fluttercn CLI

fluttercn is a CLI tool that helps you quickly add native Flutter components to your projects. It provides a curated library of reusable UI components that are easy to use and customize.

## Installation

Install fluttercn globally using npm:

```bash
npm install -g fluttercn
```

Or using yarn:

```bash
yarn global add fluttercn
```

## Quick Start

1. **Initialize fluttercn in your project:**
   ```bash
   fluttercn init
   ```
   This sets up the theme configuration required for all components.

2. **List available components:**
   ```bash
   fluttercn list
   ```
   Or use the short alias:
   ```bash
   fluttercn ls
   ```

3. **Add a component to your project:**
   ```bash
   fluttercn add <component-name>
   ```
   For example:
   ```bash
   fluttercn add card
   fluttercn add button
   ```

## Commands

### `init`

Initialize fluttercn in your Flutter project. This command:

- Validates that you're in a Flutter project
- Creates the theme configuration file at `lib/config/theme.dart`
- Sets up the necessary structure for components

**Usage:**
```bash
fluttercn init
```

**Note:** You only need to run this once per project. If fluttercn is already initialized, you'll see a warning message.

### `add <component>`

Add a Flutter component to your project. This command:

- Validates your Flutter project
- Checks if fluttercn is initialized
- Verifies component dependencies
- Copies component files to your project
- Automatically fixes import paths

**Usage:**
```bash
fluttercn add <component-name>
```

**Examples:**
```bash
fluttercn add card
fluttercn add button
```

**Features:**
- If a file already exists, you'll be prompted to overwrite it
- Import paths are automatically adjusted based on your project structure
- Dependencies are checked before installation

### `list` (or `ls`)

List all available components in the registry.

**Usage:**
```bash
fluttercn list
```

Or use the short alias:
```bash
fluttercn ls
```

This command displays:
- Component names
- Component descriptions
- Usage examples

## Available Components

### Card

A flexible card component with header, content, and footer sections.

**Usage:**
```dart
import 'package:your_app/widgets/common/card.dart';

Card(
  header: CardHeader(
    title: CardTitle('Card Title'),
    description: CardDescription('Card description'),
  ),
  content: CardContent(
    child: Text('Card content'),
  ),
)
```

### Button

A customizable button component with multiple variants and sizes.

**Usage:**
```dart
import 'package:your_app/widgets/common/button.dart';

Button(
  variant: ButtonVariant.primary,
  size: ButtonSize.md,
  onPressed: () {
    // Handle button press
  },
  child: Text('Click me'),
)

// With icon
Button(
  variant: ButtonVariant.secondary,
  onPressed: () {},
  icon: Icon(Icons.add),
  iconPosition: IconPosition.leading,
  child: Text('Add Item'),
)
```

## Requirements

- Node.js (v14 or higher)
- A Flutter project with `pubspec.yaml` and `lib/` directory

## Troubleshooting

### "Flutter project validation failed"

Make sure you're running the command from the root of your Flutter project (where `pubspec.yaml` is located).

### "fluttercn is not initialized"

Run `fluttercn init` first to set up fluttercn in your project.

### "Component not found"

Use `fluttercn list` to see all available components. Make sure you're using the correct component name (case-insensitive).

### "Missing required dependencies"

Some components require the theme configuration. Make sure you've run `fluttercn init` before adding components.

## License

MIT

