# Flutter CN CLI

A command-line tool to add Flutter components to your Flutter projects.

## Getting Started

Use your preferred package manager (npm, yarn, pnpm, or bun) for all commands.

### 1. Install Dependencies

```bash
npm install
```

### 2. Build the CLI

```bash
npm run build
```

### 3. Link the CLI

From the CLI directory, run:

```bash
npm link
```

This makes the `fluttercn` command available globally. After linking, you can use `fluttercn` from any directory.

### 4. Test It Out

Create a new Flutter project and test the CLI:

```bash
flutter create test_project
cd test_project
fluttercn init
fluttercn list
fluttercn add <component>
```

## Commands

- `fluttercn init` - Initialize Flutter CN in your project
- `fluttercn add <component>` - Add a component to your project
- `fluttercn list` - List all available components

## Contributing

### Adding a New Component

Follow this workflow to add a new component to Flutter CN:

1. **Build the CLI**
   ```bash
   npm run build
   ```

2. **Create a new branch**
   ```bash
   git checkout -b component/component-name
   ```
   Use the naming convention: `component/component-name` (e.g., `component/toast`)

3. **Develop in the playground**
   - Create your widget in `playground/lib/widgets/`
   - Create a showcase page in `playground/lib/presentations/` to demonstrate different use cases
   - Test thoroughly

4. **Create a PR**
   - Submit a PR for the playground changes
   - Once merged, the component is ready for CLI integration

5. **Add to CLI**
   - Create another PR to add the component to the CLI registry
   - This makes it available through `fluttercn add <component>`
