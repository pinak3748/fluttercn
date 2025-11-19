<div align="center">
  <img src="src/assets/logo.png" alt="fluttercn logo" width="120" />
  
  # fluttercn
  
  **Build beautiful Flutter apps with copy-paste components**
  
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
  [![npm version](https://img.shields.io/npm/v/fluttercn.svg)](https://www.npmjs.com/package/fluttercn)
</div>

---

## Installation

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

2. **List available components:**
   ```bash
   fluttercn list
   ```

3. **Add a component:**
   ```bash
   fluttercn add button
   fluttercn add card
   ```

## Commands

### `init`
Initialize fluttercn in your Flutter project. Creates the theme configuration file at `lib/config/theme.dart`.

```bash
fluttercn init
```

### `add <component>`
Add a Flutter component to your project. Components are copied to `lib/widgets/common/`.

```bash
fluttercn add <component-name>
```

### `list` (or `ls`)
List all available components in the registry.

```bash
fluttercn list
```

## Requirements

- Node.js (v14 or higher)
- Flutter project with `pubspec.yaml` and `lib/` directory

## Troubleshooting

**Flutter project validation failed**  
Make sure you're running the command from the root of your Flutter project.

**fluttercn is not initialized**  
Run `fluttercn init` first to set up fluttercn in your project.

**Component not found**  
Use `fluttercn list` to see all available components.

## Support

- 🐛 [Report Issues](https://github.com/pinak3748/fluttercn/issues)
- 💬 [Discussions](https://github.com/pinak3748/fluttercn/discussions)

## License

MIT
