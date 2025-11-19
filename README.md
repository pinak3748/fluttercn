<div align="center">
  <img src="cli/src/assets/logo.png" alt="fluttercn logo" width="120" />
  
  # fluttercn
  
  **Build beautiful Flutter apps with copy-paste components**

  fluttercn is a collection of beautifully designed, accessible Flutter components that you can copy and paste directly into your apps. Think of it as your component library—built with Flutter, for Flutter developers.
  
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
  [![npm version](https://img.shields.io/npm/v/fluttercn.svg)](https://www.npmjs.com/package/fluttercn)
</div>





## ✨ Features

- 🎨 **Beautiful Components** - Carefully crafted UI components following Flutter design principles
- 📦 **Copy-Paste Philosophy** - Components are copied directly into your project, giving you complete ownership
- 🎯 **Zero Dependencies** - No external packages required, just Flutter
- 🚀 **Easy to Use** - Simple CLI tool to add components to your project
- 🎨 **Fully Customizable** - Modify, extend, or customize components however you need
- ♿ **Accessible** - Built with accessibility in mind

## 🚀 Quick Start

### Installation

Install the fluttercn CLI globally:

```bash
npm install -g fluttercn
```

Or using yarn:

```bash
yarn global add fluttercn
```

### Usage

1. **Initialize fluttercn in your Flutter project:**

```bash
cd your-flutter-project
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

That's it! Components are copied to `lib/widgets/common/` in your project.

## 📚 Documentation

Visit our [documentation website](https://fluttercn.site) for:
- Complete component reference
- Usage examples
- Theming guide
- Best practices

## 🏗️ Project Structure

This repository contains three main parts:

- **`cli/`** - The fluttercn CLI tool (npm package)
- **`playground/`** - Flutter app for developing and testing components
- **`www/`** - Documentation website (Next.js)

## 📦 Available Components

- **Card** - Flexible card component with header, content, and footer
- **Button** - Customizable button with multiple variants and sizes
- **Avatar** - Versatile avatar with network, asset, and initials fallback
- **Badge** - Badge, count badge, and status badge primitives
- **Checkbox** - Animated checkbox with tristate support

More components are coming soon! Check the [documentation](https://fluttercn.site/docs/components) for the complete list.

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Quick Contribution Guide

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-component`)
3. Develop your component in the `playground/` directory
4. Test thoroughly
5. Submit a pull request

For detailed instructions, see [CONTRIBUTING.md](CONTRIBUTING.md).

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

Inspired by [shadcn/ui](https://ui.shadcn.com) and its philosophy of production ready components.

## 📞 Support

- 📖 [Documentation](https://fluttercn.site)
- 🐛 [Report Issues](https://github.com/pinak3748/fluttercn/issues)
- 💬 [Discussions](https://github.com/pinak3748/fluttercn/discussions)

---

<div align="center">
  Made with ❤️ for the Flutter community
</div>
