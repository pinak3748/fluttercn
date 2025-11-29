# ⚠️ DEPRECATED - Node.js CLI

**This Node.js CLI has been discontinued in favor of the Dart CLI.**

Please use the new Dart CLI instead for better integration with the Flutter ecosystem.

---

## New Installation (Dart CLI)

Install the fluttercn CLI globally using Dart's pub:

```bash
dart pub global activate fluttercn
```

**Important:** Make sure `~/.pub-cache/bin` is in your PATH:

```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

## Documentation

For complete documentation and usage instructions, please see:

- **Main README**: [../README.md](../README.md)
- **Dart CLI README**: [../dart-cli/README.md](../dart-cli/README.md)
- **Documentation Website**: [https://fluttercn.site](https://fluttercn.site)

## Migration

If you were using the old Node.js CLI, simply uninstall it and install the new Dart CLI:

```bash
# Uninstall old CLI
npm uninstall -g fluttercn
# or
yarn global remove fluttercn

# Install new Dart CLI
dart pub global activate fluttercn
```

The commands and functionality remain the same:
- `fluttercn init` - Initialize your project
- `fluttercn list` - List available components
- `fluttercn add <component>` - Add a component

## Why the change?

The Dart CLI provides:
- Better integration with the Dart/Flutter ecosystem
- No Node.js dependency required
- Simpler installation and distribution
- Consistent tooling experience for Flutter developers
