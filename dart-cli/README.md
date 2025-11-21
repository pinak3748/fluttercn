<div align="center">
  <h1>fluttercn CLI</h1>
  
  <strong>Build beautiful Flutter apps with copy-paste components</strong>
  
  [![pub.dev](https://img.shields.io/pub/v/fluttercn)](https://pub.dev/packages/fluttercn)
  [![License: BSD-3-Clause](https://img.shields.io/badge/License-BSD--3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
  [![Dart SDK](https://img.shields.io/badge/Dart-3.0.0+-blue.svg)](https://dart.dev)
</div>

---

A Dart CLI tool for adding beautiful, production-ready Flutter components to your projects. Components are copied directly into your project, giving you complete ownership and full control.

## ✨ Features

- 🎨 **Beautiful Components** - Carefully crafted UI components following Flutter design principles
- 📦 **Copy-Paste Philosophy** - Components are copied directly into your project, giving you complete ownership
- 🎯 **Zero Dependencies** - No external packages required, just Flutter
- 🚀 **Easy to Use** - Simple CLI tool to add components to your project
- 🎨 **Fully Customizable** - Modify, extend, or customize components however you need
- ♿ **Accessible** - Built with accessibility in mind

## 📦 Installation

### Global Installation (Recommended)

Install the CLI globally using Dart's pub:

```bash
dart pub global activate fluttercn
```

**Important:** Make sure `~/.pub-cache/bin` is in your PATH. Add it by running:

```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

To make this permanent, add the above line to your shell profile (`~/.zshrc`, `~/.bashrc`, etc.).

### Verify Installation

Check if the CLI is installed correctly:

```bash
fluttercn --version
```

You should see the version number (e.g., `0.0.5`).

## 🚀 Quick Start

1. **Navigate to your Flutter project:**
   ```bash
   cd your-flutter-project
   ```

2. **Initialize fluttercn:**
   ```bash
   fluttercn init
   ```
   This creates the theme configuration file at `lib/config/theme.dart`.

3. **List available components:**
   ```bash
   fluttercn list
   ```

4. **Add a component:**
   ```bash
   fluttercn add button
   fluttercn add card
   ```

That's it! Components are copied to `lib/widgets/common/` in your project.

## 📚 Commands

### `init`

Initialize fluttercn in your Flutter project. This command creates the theme configuration file that components depend on.

```bash
fluttercn init
```

**What it does:**
- Creates `lib/config/theme.dart` with theme configuration
- Validates that you're in a Flutter project
- Sets up the necessary directory structure

### `add <component>`

Add a Flutter component to your project. Components are copied to `lib/widgets/common/`.

```bash
fluttercn add <component-name>
```

**Available components:**
- `button` - Customizable button with multiple variants and sizes
- `card` - Card component with header, content, and footer sections
- `avatar` - Avatar with network, asset, and initials fallback
- `badge` - Badge, count badge, and status badge primitives
- `checkbox` - Animated checkbox with tristate support

**Examples:**
```bash
# Add a button component
fluttercn add button

# Add a card component
fluttercn add card

# Add multiple components
fluttercn add avatar
fluttercn add badge
fluttercn add checkbox
```

### `list` (or `ls`)

List all available components in the registry.

```bash
fluttercn list
# or
fluttercn ls
```

### `--version` / `-v`

Display the version number.

```bash
fluttercn --version
# or
fluttercn -v
```

### `--help` / `-h`

Display help information.

```bash
fluttercn --help
# or
fluttercn -h
```

## 📖 Usage Examples

### Basic Workflow

```bash
# 1. Initialize fluttercn
fluttercn init

# 2. See what's available
fluttercn list

# 3. Add components you need
fluttercn add button
fluttercn add card
```

## 🔧 Requirements

- **Dart SDK**: 3.0.0 or higher
- **Flutter project**: Must have `pubspec.yaml` and `lib/` directory
- **PATH configuration**: `~/.pub-cache/bin` must be in your PATH

## 🐛 Troubleshooting

### Flutter project validation failed

**Problem:** CLI says you're not in a Flutter project.

**Solution:**
- Make sure you're running the command from the root of your Flutter project
- Verify that `pubspec.yaml` exists in the current directory
- Check that `lib/` directory exists

### fluttercn is not initialized

**Problem:** Error when trying to add a component.

**Solution:**
```bash
fluttercn init
```
Run this command first to set up fluttercn in your project.

### Component not found

**Problem:** Component name doesn't exist.

**Solution:**
```bash
fluttercn list
```
Use this command to see all available components and their exact names.

### Command not found: fluttercn

**Problem:** `fluttercn` command is not recognized.

**Solution:**
1. Make sure you've installed the CLI:
   ```bash
   dart pub global activate fluttercn
   ```

2. Add `~/.pub-cache/bin` to your PATH:
   ```bash
   export PATH="$PATH":"$HOME/.pub-cache/bin"
   ```

3. Restart your terminal or run:
   ```bash
   source ~/.zshrc  # or ~/.bashrc
   ```

### Permission denied

**Problem:** Permission errors when running commands.

**Solution:**
```bash
chmod +x ~/.pub-cache/bin/fluttercn
```


More components are coming soon! Check the [documentation](https://fluttercn.site) for updates.

## 🔗 Resources

- 📖 [Documentation](https://fluttercn.site)
- 🐛 [Report Issues](https://github.com/pinak3748/fluttercn/issues)
- 💬 [Discussions](https://github.com/pinak3748/fluttercn/discussions)
- 📦 [pub.dev Package](https://pub.dev/packages/fluttercn)

## 📄 License

This project is licensed under the BSD-3-Clause License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

Inspired by [shadcn/ui](https://ui.shadcn.com) and its philosophy of production-ready, copy-paste components.

---

<div align="center">
  Made with ❤️ for the Flutter community
</div>
