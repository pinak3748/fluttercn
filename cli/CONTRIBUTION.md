# CLI Development Guide

This document provides CLI-specific development instructions. For general contributing guidelines, see the [root CONTRIBUTING.md](../CONTRIBUTING.md).

## Development Setup

### Prerequisites

- Node.js (v14 or higher)
- npm, yarn, pnpm, or bun

### Setup Steps

1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Build the CLI**
   ```bash
   npm run build
   ```

3. **Link the CLI Locally**
   ```bash
   npm link
   ```
   This makes the `fluttercn` command available globally for local development.

4. **Test Locally**
   ```bash
   flutter create test_project
   cd test_project
   fluttercn init
   fluttercn list
   fluttercn add <component>
   ```

## Development Scripts

- `npm run dev` - Watch mode for development
- `npm run build` - Build the CLI
- `npm run clean` - Clean the dist directory
- `npm start` - Run the built CLI

## CLI-Specific Contribution Notes

When adding a new component to the CLI:

1. Add component files to `src/core/widgets/`
2. Update `src/core/registery.json` with component metadata
3. Ensure component dependencies are properly declared
4. Test the `fluttercn add <component>` command with a fresh Flutter project
5. Update component documentation in the `www/` directory

For the complete contribution workflow, see [CONTRIBUTING.md](../CONTRIBUTING.md).
